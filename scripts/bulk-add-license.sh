#!/bin/bash
################################################################################
# bulk-add-license.sh — Add LICENSE to all repositories
# Sovereign Education Ecosystem
################################################################################

set -e

LICENSE_TYPE="${1:-MIT}"

echo "⚡ Adding $LICENSE_TYPE license to all repositories..."
echo ""

# Get MIT license text
get_license_text() {
    curl -sL "https://raw.githubusercontent.com/licenses/license-$LICENSE_TYPE/main/LICENSE"
}

LICENSE_TEXT=$(get_license_text)

if [ -z "$LICENSE_TEXT" ] || [[ "$LICENSE_TEXT" == *"404"* ]]; then
    echo "❌ Could not fetch $LICENSE_TYPE license. Using MIT as default."
    LICENSE_TYPE="MIT"
    LICENSE_TEXT=$(curl -sL "https://raw.githubusercontent.com/licenses/license-MIT/main/LICENSE")
fi

# Get all repos
repos=$(gh repo list Turbo-the-tech-dev --limit 100 --json name --jq '.[].name')

for repo in $repos; do
    echo "📝 Processing: $repo"
    
    # Check if LICENSE already exists
    if gh repo view "$repo" --json defaultBranchRef --jq '.defaultBranchRef' &> /dev/null; then
        # Try to get LICENSE
        if gh api "/repos/Turbo-the-tech-dev/$repo/contents/LICENSE" &> /dev/null; then
            echo "   ✅ LICENSE already exists"
            continue
        fi
    fi
    
    echo "   ⚠️  Adding LICENSE..."
    # Note: This would need actual repo clone or API upload
    # For now, just report what would be done
    echo "   📋 Would add $LICENSE_TYPE LICENSE to $repo"
done

echo ""
echo "✅ License addition complete!"
echo ""
echo "Note: To actually add licenses, clone each repo and run:"
echo "  echo '$LICENSE_TEXT' > LICENSE"
echo "  git add LICENSE"
echo "  git commit -m 'docs: add $LICENSE_TYPE license'"
echo "  git push"
