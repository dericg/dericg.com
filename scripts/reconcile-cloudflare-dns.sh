#!/usr/bin/env bash
set -euo pipefail

: "${CLOUDFLARE_API_TOKEN:?CLOUDFLARE_API_TOKEN is required}"
: "${CLOUDFLARE_ZONE_ID:?CLOUDFLARE_ZONE_ID is required}"
: "${CLOUDFLARE_PAGES_PROJECT:?CLOUDFLARE_PAGES_PROJECT is required}"

api="https://api.cloudflare.com/client/v4"
auth=(-H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" -H "Content-Type: application/json")

upsert_cname() {
  local hostname="$1"
  local response record_id payload

  response="$(curl -sS "${auth[@]}" -G \
    --data-urlencode "name=${hostname}" \
    "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records")"

  if ! jq -e '.success == true' <<<"${response}" >/dev/null; then
    echo "Cloudflare DNS lookup failed: ${response}" >&2
    exit 1
  fi

  record_id="$(jq -r '.result[] | select(.type == "CNAME") | .id' <<<"${response}" | head -n1)"
  conflict_ids="$(jq -r '.result[] | select(.type == "A" or .type == "AAAA") | .id' <<<"${response}")"
  payload="$(jq -nc --arg name "${hostname}" --arg content "${CLOUDFLARE_PAGES_PROJECT}.pages.dev" \
    '{type:"CNAME", name:$name, content:$content, ttl:1, proxied:false}')"

  if [[ -n "${record_id}" ]]; then
    response="$(curl -sS "${auth[@]}" -X PUT \
      "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records/${record_id}" \
      --data "${payload}")"
  else
    while IFS= read -r conflict_id; do
      [[ -z "${conflict_id}" ]] && continue
      curl --fail-with-body -sS "${auth[@]}" -X DELETE \
        "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records/${conflict_id}" >/dev/null
    done <<<"${conflict_ids}"

    response="$(curl -sS "${auth[@]}" -X POST \
      "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records" \
      --data "${payload}")"
  fi

  if ! jq -e '.success == true' <<<"${response}" >/dev/null; then
    echo "Cloudflare DNS update failed: ${response}" >&2
    exit 1
  fi

  echo "Reconciled CNAME for ${hostname}"
}

upsert_cname dericg.com
upsert_cname www.dericg.com
