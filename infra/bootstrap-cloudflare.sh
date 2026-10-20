#!/usr/bin/env bash
set -euo pipefail

: "${CLOUDFLARE_API_TOKEN:?Set CLOUDFLARE_API_TOKEN in the environment}"
: "${CLOUDFLARE_ACCOUNT_ID:?Set CLOUDFLARE_ACCOUNT_ID in the environment}"

project_name="${CLOUDFLARE_PAGES_PROJECT:-dericg-com}"
domain="${CLOUDFLARE_DOMAIN:-dericg.com}"
www_domain="${CLOUDFLARE_WWW_DOMAIN:-www.dericg.com}"
api="https://api.cloudflare.com/client/v4"
auth=(-H "Authorization: Bearer ${CLOUDFLARE_API_TOKEN}" -H "Content-Type: application/json")

echo "Creating or confirming Pages project: ${project_name}"
curl --fail-with-body -sS "${auth[@]}" -X POST "${api}/accounts/${CLOUDFLARE_ACCOUNT_ID}/pages/projects" \
  --data "{\"name\":\"${project_name}\",\"production_branch\":\"master\"}" || true

echo "Attaching custom domains"
for host in "${domain}" "${www_domain}"; do
  curl --fail-with-body -sS "${auth[@]}" -X POST \
    "${api}/accounts/${CLOUDFLARE_ACCOUNT_ID}/pages/projects/${project_name}/domains" \
    --data "{\"name\":\"${host}\"}" || true
done

echo "Bootstrap complete. Review DNS records and certificate status in Cloudflare."
