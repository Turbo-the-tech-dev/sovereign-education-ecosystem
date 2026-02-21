# 📐 Repository Standards

> Standards all repositories in the Sovereign Education Ecosystem must follow

---

## Required Files

Every repository MUST have:

| File | Purpose | Template |
|------|---------|----------|
| `README.md` | Project overview, structure, quick start | See below |
| `LICENSE` | Legal terms (MIT recommended) | MIT License |
| `.gitignore` | Ignore patterns | Standard template |

---

## README Structure

```markdown
# {Repository Name}

> One-sentence description

**Status:** ✅ Git ready | 📁 Local only | 🚧 In progress

---

## 📁 Directory Structure

\`\`\`
repo-name/
├── folder-1/
├── folder-2/
└── README.md
\`\`\`

---

## 🎯 Purpose

What this repository is for and who it serves.

---

## 🚀 Quick Start

How to get started in 3-5 steps.

---

## 📚 Resources

Links to related content.

---

## 🏆 Status

| Metric | Progress |
|--------|----------|
| Content Complete | X% |
| Git Ready | ✅/❌ |
| Published | ✅/❌ |

---

*"Clear documentation, the path to understanding is."*
```

---

## Naming Conventions

### Repositories

| Type | Pattern | Example |
|------|---------|---------|
| Learning | `{TOPIC}-ACADEMY` | `JSON-ACADEMY` |
| Tools | `{TOPIC}-tools` | `fraud-detection-tools` |
| Reference | `{TOPIC}-reference` | `nec-reference` |
| Calculators | `{TOPIC}-calculator` | `box-fill-calculator` |
| Templates | `__TEMPLATES__` | (special case) |

### Directories (Learning Repos)

```
01-foundations/     # Basics, terminology
02-basics/          # Core concepts
03-intermediate/    # Applied knowledge
04-advanced/        # Expert-level topics
05-real-world/      # Production examples
06-certification-prep/ # Exam prep (if applicable)
```

### Files

- Use lowercase with hyphens: `quick-start.md`
- Code files: follow language conventions
- Avoid spaces in filenames

---

## Git Standards

### Commit Messages

```
<type>: <subject>

<body - optional>

<footer - optional>
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Example:
```
feat: add JSON validation examples

- Added jq filter examples
- Added schema validation tests

Closes #42
```

### Branch Naming

```
feature/description
fix/description
docs/description
```

---

## License

**Default:** MIT License

```
Copyright (c) 2026 Turbo-the-tech-dev

Permission is hereby granted, free of charge, to any person obtaining a copy...
```

Use `./scripts/bulk-add-license.sh MIT` to add to all repos.

---

## .gitignore Standard

Use the root `.gitignore` as base:

```gitignore
# Dependencies
node_modules/
__pycache__/
*.pyc

# Environment
.env
.env.local

# Build outputs
dist/
build/

# Logs
logs/
*.log

# OS files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
```

---

## Quality Gates

Before marking a repo as "Git Ready":

- [ ] README.md exists and is complete
- [ ] LICENSE file present
- [ ] .gitignore configured
- [ ] No secrets in git history
- [ ] Directory structure is clear
- [ ] Content is organized
- [ ] GitHub repo created
- [ ] Local copy can be deleted

---

## Audit Checklist

Run `./scripts/bulk-audit-secrets.sh` regularly.

Manual review quarterly:
- [ ] All repos accessible
- [ ] No 404 errors
- [ ] Links between repos work
- [ ] Content is up to date

---

*"Standardized, the path to scale must be."*
