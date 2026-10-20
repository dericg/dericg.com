# Release checklist

Use this checklist for changes to the public site:

1. Make the content or implementation change in `index.html` or the supporting deployment files.
2. Build the static artifact:

   ```sh
   bash scripts/build-site.sh
   ```

3. Validate the artifact:

   ```sh
   bash scripts/validate-site.sh
   ```

4. Review the diff and confirm there are no placeholder links, secrets, or unintended files.
5. Merge the approved branch into `master`.
6. Confirm the Cloudflare Pages production deployment completes successfully.
7. Smoke-test `https://dericg.com/` and confirm the visible page matches the merged commit.

The production deployment is driven by `master`; feature branches are for review and preview validation.
