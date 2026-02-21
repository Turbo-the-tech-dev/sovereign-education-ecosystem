#!/bin/bash
################################################################################
# bulk-audit-secrets.sh — Audit all repositories for exposed secrets
# Sovereign Education Ecosystem
################################################################################

set -e

echo "⚡ Auditing all repositories for exposed secrets..."
echo ""

# Patterns to search for
SECRET_PATTERNS=(
    "api_key"
    "apikey"
    "api-key"
    "password"
    "passwd"
    "secret"
    "token"
    "access_token"
    "private_key"
    "aws_access"
    "aws_secret"
    "ghp_"  # GitHub personal access token
    "xox"   # Slack token
    "sk-"   # OpenAI key
)

# Get all repos
repos=$(gh repo list Turbo-the-tech-dev --limit 100 --json name --jq '.[].name')

found_issues=0

for repo in $repos; do
    echo "🔍 Auditing: $repo"
    
    # Clone temporarily for audit
    temp_dir=$(mktemp -d)
    cd "$temp_dir"
    
    if gh repo clone "Turbo-the-tech-dev/$repo" 2>/dev/null; then
        cd "$repo"
        
        # Search for secrets in current files
        for pattern in "${SECRET_PATTERNS[@]}"; do
            matches=$(grep -ri "$pattern" --include="*.env" --include="*.json" --include="*.yaml" --include="*.yml" --include="*.py" --include="*.js" --include="*.ts" . 2>/dev/null | grep -v node_modules | head -5 || true)
            
            if [ -n "$matches" ]; then
                echo "   ⚠️  Potential secret found (pattern: $pattern):"
                echo "$matches" | head -3 | sed 's/^/      /'
                found_issues=$((found_issues + 1))
            fi
        done
        
        cd ..
        rm -rf "$repo"
    else
        echo "   ⚠️  Could not clone (may be private or local only)"
    fi
    
    cd /root
    rm -rf "$temp_dir"
done

echo ""
echo "=============================================="
if [ $found_issues -gt 0 ]; then
    echo "⚠️  AUDIT COMPLETE: $found_issues potential issues found!"
    echo ""
    echo "Next steps:"
    echo "  1. Review each flagged file"
    echo "  2. Remove or rotate exposed secrets"
    echo "  3. Add files to .gitignore"
    echo "  4. Use git filter-branch or BFG to clean history"
else
    echo "✅ AUDIT COMPLETE: No obvious secrets found!"
fi
echo "=============================================="
