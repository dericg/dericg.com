# Deployment

GitHub is the source of truth. The Cloudflare Pages project is dericg-com.

## Flow

- Every pull request runs static-site validation.
- A same-repository pull request with Cloudflare secrets configured also deploys dist/ to a Pages preview branch named pr-<number>.
- A push or merge to master validates the site and deploys dist/ to the production Pages deployment.
- The production environment is expected at https://dericg.com.

The build is dependency-free:

1. scripts/build-site.sh removes and recreates dist/.
2. It copies the preserved root index.html into dist/index.html.
3. scripts/validate-site.sh verifies the artifact, required HTML markers, and placeholder links.

## One-time setup

Create the Cloudflare Pages project and custom domains using the checked-in bootstrap script or equivalent Cloudflare API calls:

    export CLOUDFLARE_API_TOKEN='...'
    export CLOUDFLARE_ACCOUNT_ID='...'
    bash infra/bootstrap-cloudflare.sh

The API token should be narrowly scoped to the target Cloudflare account with Pages project write access. Do not commit it.

Then add these GitHub Actions repository or environment secrets:

- CLOUDFLARE_API_TOKEN
- CLOUDFLARE_ACCOUNT_ID

Cloudflare DNS must point dericg.com and www.dericg.com at the Pages project according to the account's assigned Pages targets. Cloudflare manages HTTPS after the custom domains are attached.

## Local verification

    bash scripts/build-site.sh
    bash scripts/validate-site.sh
