# 🚀 Fleet Operations Guide

> Operating procedures for managing 1,000 workers across the ecosystem

---

## Overview

| Metric | Value |
|--------|-------|
| Fleet Size | ~1,000 workers |
| Total Repositories | 23+ |
| Categories | 5 (Educational, AI/ML, Electrical, Math, Special) |
| GitHub Org | Turbo-the-tech-dev |

---

## Daily Operations

### Morning Checklist

```bash
# 1. Check fleet health
gh api repos/Turbo-the-tech-dev/traffic/clones

# 2. Review new issues
gh issue list --state open --limit 20

# 3. Check pending PRs
gh pr list --state open

# 4. Monitor API usage
gh api /users/Turbo-the-tech-dev
```

### Bulk Operations

```bash
# Add LICENSE to all repos
./scripts/bulk-add-license.sh MIT

# Sync .gitignore across all repos
./scripts/bulk-sync-gitignore.sh

# Audit for exposed secrets
./scripts/bulk-audit-secrets.sh

# Update all README footers
./scripts/bulk-update-readme.sh
```

---

## Worker Onboarding

### One-Command Setup

```bash
curl -fsSL https://raw.githubusercontent.com/Turbo-the-tech-dev/sovereign-education-ecosystem/main/scripts/setup-worker.sh | bash
```

### What the Script Does

1. Installs required tools (git, gh)
2. Configures git credentials
3. Clones ecosystem root
4. Prompts for learning path
5. Clones chosen track repositories

---

## Repository Management

### Creating New Learning Repos

```bash
# Use the academy template
./scripts/mkacademy.sh NEW-ACADEMY-NAME

# Example: Create JSON Academy
./scripts/mkacademy.sh JSON-ACADEMY
```

### Standard Structure

```
{NAME}-ACADEMY/
├── 01-foundations/
├── 02-basics/
├── 03-intermediate/
├── 04-advanced/
├── 05-real-world/
├── 06-certification-prep/
├── assets/
│   ├── cheat-sheets/
│   ├── diagrams/
│   └── examples/
├── labs/
│   ├── beginner/
│   ├── intermediate/
│   ├── advanced/
│   └── ctf-challenges/
└── README.md
```

---

## Cost Management

### Claude Code API Budgets

| Model | Use Case | Budget/Worker/Day |
|-------|----------|-------------------|
| Haiku | Routine reviews, Q&A | $0.50 |
| Sonnet | Code generation, analysis | $2.00 |
| Opus | Complex reasoning, architecture | $5.00 (supervisor only) |

### Daily Budget Limits

```
Total Daily Budget: $500
Per Worker Daily Avg: < $1.00
Target: 95% under budget
```

---

## Monitoring

### Key Metrics

| Metric | Command | Target |
|--------|---------|--------|
| Clone Count | `gh api repos/{repo}/traffic/clones` | Increasing |
| Issues Open | `gh issue list --state open` | < 50 |
| Issues Resolved | `gh issue list --state closed` | 90%+ rate |
| API Usage | AWS Console / Claude Dashboard | < $500/day |

### Health Checks

```bash
# Check all repos are accessible
for repo in $(gh repo list --limit 100 --json name --jq '.[].name'); do
  echo "Checking $repo..."
  gh repo view "$repo" > /dev/null || echo "❌ $repo inaccessible"
done

# Check for secret leaks
./scripts/bulk-audit-secrets.sh
```

---

## Incident Response

### Secret Leak Detected

1. **Immediately** rotate the exposed secret
2. Run `git filter-branch` or BFG to remove from history
3. Force push cleaned repo
4. Document in incident log

### Repo Access Issues

1. Check worker's auth: `gh auth status`
2. Verify repo visibility (public vs private)
3. Re-run onboarding script if needed

---

## Weekly Rhythm

| Day | Focus |
|-----|-------|
| Saturday | Infrastructure & Templates |
| Sunday | Learning Repos (new builds) |
| Monday | Pilot Onboarding (10 workers) |
| Tuesday | Phase 1 Rollout (100 workers) |
| Wednesday | Phase 2 Rollout (500 workers) |
| Thursday | Full Fleet (1,000 workers) |
| Friday | Review, Metrics, Retro |

---

*"Organized, everything must be. Scale of 1,000, we build for."* — Yoda
