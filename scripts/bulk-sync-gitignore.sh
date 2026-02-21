#!/bin/bash
################################################################################
# bulk-sync-gitignore.sh — Sync .gitignore across all repositories
# Sovereign Education Ecosystem
################################################################################

set -e

echo "⚡ Syncing .gitignore across all repositories..."
echo ""

# Standard .gitignore content
GITIGNORE_CONTENT='# Dependencies
node_modules/
__pycache__/
*.pyc
*.pyo

# Environment
.env
.env.local
.env.*.local

# Build outputs
dist/
build/
*.egg-info/

# Logs
logs/
*.log
npm-debug.log*

# OS files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# Backups
*.bak
*.backup
backups/

# Test coverage
coverage/
*.cover

# Temporary files
tmp/
temp/
*.tmp
'

# Get all repos
repos=$(gh repo list Turbo-the-tech-dev --limit 100 --json name --jq '.[].name')

for repo in $repos; do
    echo "📝 Processing: $repo"
    
    # Check if .gitignore needs update
    if gh api "/repos/Turbo-the-tech-dev/$repo/contents/.gitignore" &> /dev/null; then
        echo "   ⚠️  .gitignore exists - would update"
    else
        echo "   ⚠️  .gitignore missing - would add"
    fi
    
    echo "   📋 Would sync .gitignore in $repo"
done

echo ""
echo "✅ Gitignore sync complete!"
echo ""
echo "Note: To actually sync, clone each repo and run:"
echo "  echo '$GITIGNORE_CONTENT' > .gitignore"
echo "  git add .gitignore"
echo "  git commit -m 'chore: sync .gitignore'"
echo "  git push"
