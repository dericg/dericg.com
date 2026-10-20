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

  response="$(curl --fail-with-body -sS "${auth[@]}" -G \
    --data-urlencode "name=${hostname}" \
    --data-urlencode "type=CNAME" \
    "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records")"

  record_id="$(jq -r '.result[0].id // empty' <<<"${response}")"
  payload="$(jq -nc --arg name "${hostname}" --arg content "${CLOUDFLARE_PAGES_PROJECT}.pages.dev" \
    '{type:"CNAME", name:$name, content:$content, ttl:1, proxied:false}')"

  if [[ -n "${record_id}" ]]; then
    curl --fail-with-body -sS "${auth[@]}" -X PUT \
      "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records/${record_id}" \
      --data "${payload}" >/dev/null
  else
    curl --fail-with-body -sS "${auth[@]}" -X POST \
      "${api}/zones/${CLOUDFLARE_ZONE_ID}/dns_records" \
      --data "${payload}" >/dev/null
  fi

  echo "Reconciled CNAME for ${hostname}"
}

upsert_cname dericg.com
upsert_cname www.dericg.com
