# 📚 Onboarding Guide

> Welcome to the Sovereign Education Ecosystem!

This guide will help you get set up and choose your learning path.

---

## Step 1: Prerequisites

Ensure you have the following installed:

```bash
# Required
git
gh (GitHub CLI)

# Optional (for development)
node   # For web tools
python # For calculations
```

### Quick Install (Termux/Linux)

```bash
# Install git and gh
pkg install git
pkg install gh

# Authenticate with GitHub
gh auth login
```

---

## Step 2: Clone the Ecosystem

```bash
# Clone the root repository
gh repo clone Turbo-the-tech-dev/sovereign-education-ecosystem

# Navigate into it
cd sovereign-education-ecosystem
```

---

## Step 3: Choose Your Learning Path

Run the path selector:

```bash
./scripts/choose-path.sh
```

Or manually clone your chosen track:

### 🎓 Educational Track
```bash
gh repo clone Turbo-the-tech-dev/college-bridge
gh repo clone Turbo-the-tech-dev/math-fundamentals
gh repo clone Turbo-the-tech-dev/downloadable-resources
```

### 🤖 AI/ML Track
```bash
gh repo clone Turbo-the-tech-dev/computer-science-ai
gh repo clone Turbo-the-tech-dev/llm-fundamentals
gh repo clone Turbo-the-tech-dev/prompt-engineering
```

### ⚡ Electrical Track
```bash
gh repo clone Turbo-the-tech-dev/sovereign-circuit-academy
gh repo clone Turbo-the-tech-dev/electrical-field
```

### 📐 Mathematics Track
```bash
gh repo clone Turbo-the-tech-dev/math-fundamentals
gh repo clone Turbo-the-tech-dev/concrete-mathematics
```

---

## Step 4: Start Learning

Each repository has its own README with:
- Directory structure
- Learning roadmap
- Quick start guide
- Resources

---

## Need Help?

1. Check the [Master Index](../MASTER-INDEX.md)
2. Review [Fleet Weekly](../FLEET_WEEKLY.md) for current priorities
3. Open an issue on the relevant repository

---

*"The Force is strong with this one. Ready to learn, you are."* — Yoda
