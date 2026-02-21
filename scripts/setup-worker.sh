#!/bin/bash
################################################################################
# setup-worker.sh — One-Command Worker Onboarding
# Sovereign Education Ecosystem
################################################################################

set -e

echo "⚡ Sovereign Education Ecosystem - Worker Setup"
echo "=============================================="
echo ""

# Check for git
if ! command -v git &> /dev/null; then
    echo "❌ Git not found. Please install git first."
    exit 1
fi

# Check for gh CLI
if ! command -v gh &> /dev/null; then
    echo "⚠️  GitHub CLI (gh) not found. Installing..."
    if command -v pkg &> /dev/null; then
        # Termux
        pkg install gh -y
    elif command -v apt &> /dev/null; then
        # Debian/Ubuntu
        sudo apt update && sudo apt install gh -y
    else
        echo "❌ Cannot install gh automatically. Please install manually."
        exit 1
    fi
fi

# Authenticate with GitHub
echo ""
echo "🔐 Authenticating with GitHub..."
gh auth login

# Verify auth
if ! gh auth status &> /dev/null; then
    echo "❌ GitHub authentication failed."
    exit 1
fi

echo "✅ GitHub authentication successful!"

# Clone ecosystem root
echo ""
echo "📦 Cloning Sovereign Education Ecosystem..."
if [ ! -d "sovereign-education-ecosystem" ]; then
    gh repo clone Turbo-the-tech-dev/sovereign-education-ecosystem
else
    echo "✅ Ecosystem already cloned."
fi

cd sovereign-education-ecosystem

# Configure git
echo ""
echo "⚙️  Configuring git..."
git config --global user.name "turbo-the-tech"
git config --global user.email "turbo.the.tech@gmail.com"

# Choose learning path
echo ""
echo "🎯 Choose your learning path:"
echo "  1) Educational Track (math, worksheets, visual learning)"
echo "  2) AI/ML Track (LLMs, generative AI, prompt engineering)"
echo "  3) Electrical Track (NEC, conduit bending, load calculations)"
echo "  4) Mathematics Track (concrete math, mathematicians)"
echo "  5) Special Projects (Julia, reverse engineering)"
echo "  6) Skip (clone later manually)"
echo ""
read -p "Enter choice [1-6]: " path_choice

case $path_choice in
    1)
        echo "🎓 Cloning Educational Track..."
        gh repo clone Turbo-the-tech-dev/college-bridge
        gh repo clone Turbo-the-tech-dev/math-fundamentals
        gh repo clone Turbo-the-tech-dev/downloadable-resources
        ;;
    2)
        echo "🤖 Cloning AI/ML Track..."
        gh repo clone Turbo-the-tech-dev/computer-science-ai
        gh repo clone Turbo-the-tech-dev/llm-fundamentals
        gh repo clone Turbo-the-tech-dev/prompt-engineering
        gh repo clone Turbo-the-tech-dev/generative-ai
        ;;
    3)
        echo "⚡ Cloning Electrical Track..."
        gh repo clone Turbo-the-tech-dev/sovereign-circuit-academy
        ;;
    4)
        echo "📐 Cloning Mathematics Track..."
        gh repo clone Turbo-the-tech-dev/math-fundamentals
        gh repo clone Turbo-the-tech-dev/concrete-mathematics
        ;;
    5)
        echo "🔧 Cloning Special Projects..."
        gh repo clone Turbo-the-tech-dev/julia-programming
        gh repo clone Turbo-the-tech-dev/masters-of-reverse-engineering
        ;;
    6)
        echo "⏭️  Skipping repository cloning."
        ;;
    *)
        echo "❌ Invalid choice. Skipping repository cloning."
        ;;
esac

echo ""
echo "=============================================="
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. cd into your cloned repositories"
echo "  2. Read the README.md to get started"
echo "  3. Join the fleet weekly sprints!"
echo ""
echo "📚 See docs/onboarding.md for more details."
echo "=============================================="
