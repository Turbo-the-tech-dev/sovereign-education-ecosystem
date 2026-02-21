#!/bin/bash
################################################################################
# choose-path.sh — Learning Path Selector
# Sovereign Education Ecosystem
################################################################################

set -e

echo "🎯 Learning Path Selector"
echo "========================"
echo ""
echo "Choose your learning track:"
echo ""
echo "  1) 🎓 Educational Track"
echo "     - college-bridge (NASA, Harvard/MIT)"
echo "     - math-fundamentals (geometry, algebra)"
echo "     - downloadable-resources (worksheets, templates)"
echo "     - viral-math-problems (8÷2(2+2))"
echo "     - juxtaposition (implicit multiplication)"
echo "     - visual-math (fractions, grouping)"
echo ""
echo "  2) 🤖 AI/ML Track"
echo "     - computer-science-ai (AI types, history, ethics)"
echo "     - llm-fundamentals (next word prediction)"
echo "     - ml-fundamentals (traditional ML)"
echo "     - generative-ai (Midjourney, GANs, diffusion)"
echo "     - prompt-engineering (tasks, verbs, context)"
echo "     - advanced-prompt-engineering (19 techniques)"
echo "     - ai-powered-services (recommendation, fraud detection)"
echo "     - human-ai-collaboration (creativity, productivity)"
echo ""
echo "  3) ⚡ Electrical Track"
echo "     - electrical-field (568 directories, NEC reference)"
echo "     - sovereign-circuit-academy (NEC 2026, conduit bending)"
echo ""
echo "  4) 📐 Mathematics Track"
echo "     - math-fundamentals (geometry, algebra)"
echo "     - concrete-mathematics (Knuth's 100 topics)"
echo "     - mathematicians (ancient to contemporary)"
echo ""
echo "  5) 🔧 Special Projects"
echo "     - julia-programming (high-performance math)"
echo "     - masters-of-reverse-engineering (binary analysis)"
echo ""
echo "  6) 📋 Show me all repositories"
echo ""
echo "  0) Exit"
echo ""
read -p "Enter choice [0-6]: " choice

case $choice in
    1)
        echo ""
        echo "🎓 Educational Track"
        echo "===================="
        gh repo clone Turbo-the-tech-dev/college-bridge
        gh repo clone Turbo-the-tech-dev/math-fundamentals
        gh repo clone Turbo-the-tech-dev/downloadable-resources
        gh repo clone Turbo-the-tech-dev/viral-math-problems
        gh repo clone Turbo-the-tech-dev/juxtaposition
        gh repo clone Turbo-the-tech-dev/visual-math
        echo "✅ Educational Track cloned!"
        ;;
    2)
        echo ""
        echo "🤖 AI/ML Track"
        echo "=============="
        gh repo clone Turbo-the-tech-dev/computer-science-ai
        gh repo clone Turbo-the-tech-dev/llm-fundamentals
        gh repo clone Turbo-the-tech-dev/ml-fundamentals
        gh repo clone Turbo-the-tech-dev/generative-ai
        gh repo clone Turbo-the-tech-dev/prompt-engineering
        gh repo clone Turbo-the-tech-dev/advanced-prompt-engineering
        gh repo clone Turbo-the-tech-dev/ai-powered-services
        gh repo clone Turbo-the-tech-dev/human-ai-collaboration
        echo "✅ AI/ML Track cloned!"
        ;;
    3)
        echo ""
        echo "⚡ Electrical Track"
        echo "==================="
        gh repo clone Turbo-the-tech-dev/sovereign-circuit-academy
        echo "Note: electrical-field is local only (568 directories)"
        echo "✅ Electrical Track cloned!"
        ;;
    4)
        echo ""
        echo "📐 Mathematics Track"
        echo "===================="
        gh repo clone Turbo-the-tech-dev/math-fundamentals
        gh repo clone Turbo-the-tech-dev/concrete-mathematics
        gh repo clone Turbo-the-tech-dev/mathematicians
        echo "✅ Mathematics Track cloned!"
        ;;
    5)
        echo ""
        echo "🔧 Special Projects"
        echo "==================="
        gh repo clone Turbo-the-tech-dev/julia-programming
        gh repo clone Turbo-the-tech-dev/masters-of-reverse-engineering
        echo "✅ Special Projects cloned!"
        ;;
    6)
        echo ""
        echo "📋 All Repositories"
        echo "==================="
        gh repo list Turbo-the-tech-dev --limit 50
        ;;
    0)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "🎉 Happy learning!"
