#!/bin/bash
set -e

# Bump CMC_VERSION in .env
bump_cmc() {
  old=$(grep ^CMC_VERSION .env | cut -d= -f2)
  new=$((old + 1))
  sed -i "s/^CMC_VERSION=.*/CMC_VERSION=$new/" .env
  echo "✅ Bumped CMC_VERSION: $old → $new"
}

# Run bump
bump_cmc

# Load version from updated .env
source .env
V="v${MC_VERSION}-${CMC_VERSION}"

# Stage and commit changes
git add .
git commit -m "$V"

# Create tag and push
git tag "$V"
git push origin main "$V"

echo "🚀 Tagged and pushed $V"