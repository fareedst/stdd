# Architecture Decisions

**STDD Methodology Version**: 1.4.0

## Overview

This document serves as the **index** for all architecture decisions in this project. Each architecture decision is stored in its own file within the `architecture-decisions/` directory for scalability.

All decisions are cross-referenced with requirements using `[REQ-*]` tokens for traceability.

## Directory Structure

```
stdd/
├── architecture-decisions.md              # This guide file (you are here)
├── architecture-decisions.yaml            # YAML index/database of all architecture decisions
├── architecture-decisions/                # Detail files directory
│   ├── ARCH-STDD_STRUCTURE.md
│   ├── ARCH-MODULE_VALIDATION.md
│   ├── ARCH-LANGUAGE_SELECTION.md
│   └── ...
```

## Filename Convention

Token names use the same format in text and filenames:

| Token Format | Filename Format |
|--------------|-----------------|
| `[ARCH-CONFIG_STRUCTURE]` | `ARCH-CONFIG_STRUCTURE.md` |
| `[ARCH-MODULE_VALIDATION]` | `ARCH-MODULE_VALIDATION.md` |

**Rule**: Remove brackets, keep hyphen, append `.md`

## Notes

- All architecture decisions MUST be recorded IMMEDIATELY when made
- Each decision MUST include `[ARCH-*]` token and cross-reference `[REQ-*]` tokens
- Architecture decisions are dependent on requirements
- DO NOT defer architecture documentation - record decisions as they are made
- Document the expected code + test touchpoints so `[PROC-TOKEN_AUDIT]` has concrete files/functions to verify
- Capture the intended validation tooling (e.g., references to `./scripts/validate_tokens.sh`) so `[PROC-TOKEN_VALIDATION]` remains reproducible
- **Language Selection**: Language selection, runtime choices, and language-specific architectural patterns belong in architecture decisions. Document language choice with `[ARCH-LANGUAGE_SELECTION]` token when it's an architectural decision (not a requirement). Language-specific patterns (e.g., async/await, goroutines, callbacks) should be documented here. Requirements should remain language-agnostic unless language selection is itself a specific requirement.

## How to Add a New Architecture Decision

1. **Create a new detail file** in `architecture-decisions/` using the naming convention above
2. **Use the detail file template** (see below)
3. **Add an entry to the index table** below
4. **Update `semantic-tokens.md`** registry with the new `[ARCH-*]` token

---

## Architecture Decisions Index

**The architecture decisions index is maintained in `architecture-decisions.yaml`**, a YAML database file that contains all architecture decision records with their metadata, cross-references, and status.

To view the index:

```bash
# View entire index
cat stdd/architecture-decisions.yaml

# View specific decision
yq '.ARCH-STDD_STRUCTURE' stdd/architecture-decisions.yaml

# List all active decisions
yq 'to_entries | map(select(.value.status == "Active")) | from_entries' stdd/architecture-decisions.yaml

# Quick grep search
grep -A 30 '^ARCH-STDD_STRUCTURE:' stdd/architecture-decisions.yaml
```

### How to Append a New Architecture Decision

1. Open `architecture-decisions.yaml` in your editor
2. Copy the template block at the bottom of the file (ARCH-IDENTIFIER)
3. Paste it at the end with a blank line before it
4. Replace `ARCH-IDENTIFIER` with your new semantic token
5. Fill in all fields (name, status, cross_references, rationale, alternatives, etc.)
6. Update the `detail_file` path to match your new `.md` file in `architecture-decisions/` directory
7. Save the file

Example append operation:

```bash
cat >> stdd/architecture-decisions.yaml << 'EOF'

ARCH-NEW_DECISION:
  name: New Architecture Decision
  status: Active
  cross_references:
    - REQ-RELATED_REQUIREMENT
  created: 2026-02-06
  last_updated: 2026-02-06
  rationale: |
    Why this decision was made
  alternatives_considered: |
    - **Alternative 1**: Why rejected
    - **Alternative 2**: Why rejected
  implementation_approach: |
    - High-level approach
    - Key components
  traceability: |
    **Requirements**: See `requirements.yaml` § REQ-RELATED_REQUIREMENT
    **Implementation**: See `implementation-decisions.yaml` § IMPL-NEW_DECISION
    **Tests**: testFeatureName_ARCH_NEW_DECISION
    **Code**: // [ARCH-NEW_DECISION] in source files
  related_decisions:
    depends_on:
      - REQ-RELATED_REQUIREMENT
    informs:
      - IMPL-NEW_DECISION
    see_also: []
  detail_file: architecture-decisions/ARCH-NEW_DECISION.md
  last_validated: 2026-02-06
  last_validator: Your Name
EOF
```

### Status Values

- **Active**: Currently in use and maintained
- **Deprecated**: No longer recommended; kept for historical reference
- **Template**: Example/template entry for reference
- **Superseded**: Replaced by another decision (note the replacement in the detail file)

---

## Detail File Template

Use this template when creating a new architecture decision file in `architecture-decisions/`:

```markdown
# [ARCH-IDENTIFIER] Architecture Decision Title

**Cross-References**: [REQ-RELATED_REQUIREMENT]  
**Status**: Active  
**Created**: YYYY-MM-DD  
**Last Updated**: YYYY-MM-DD

---

## Decision

Brief description of the architectural decision.

## Rationale

- Why this decision was made
- What problems it solves
- What benefits it provides

## Alternatives Considered

- **Alternative 1**: Why it was rejected
- **Alternative 2**: Why it was rejected

## Implementation Approach

- High-level approach
- Key components
- Integration points

## Token Coverage `[PROC-TOKEN_AUDIT]`

Code files expected to carry `[IMPL-*] [ARCH-*] [REQ-*]` comments:
- [ ] `path/to/implementation.ext` - Description

Tests expected to reference `[REQ-*]` / `[TEST-*]` tokens:
- [ ] `testFeatureName_REQ_IDENTIFIER` in `path/to/test_file.ext`

## Validation Evidence `[PROC-TOKEN_VALIDATION]`

| Date | Commit | Validation Result | Notes |
|------|--------|-------------------|-------|
| YYYY-MM-DD | `abc1234` | ✅ Pass | Initial validation |

## Related Decisions

- Depends on: [REQ-REQUIREMENT]
- Informs: [IMPL-IMPLEMENTATION]
- See also: [ARCH-RELATED_DECISION]

---

*Last validated: YYYY-MM-DD by [agent/contributor]*
```

---

## Quick Reference: Creating a New Architecture Decision

```bash
# 1. Create the detail file
touch stdd/architecture-decisions/ARCH-YOUR_TOKEN.md

# 2. Copy the template above into the new file

# 3. Fill in the details

# 4. Add entry to the index table in this file

# 5. Update semantic-tokens.md registry
```

---

## Grouping by Domain (Optional)

For very large projects, organize detail files by domain:

```
architecture-decisions/
├── core/
│   ├── ARCH-STDD_STRUCTURE.md
│   └── ARCH-MODULE_VALIDATION.md
├── auth/
│   ├── ARCH-AUTH_FLOW.md
│   └── ARCH-SESSION_MGMT.md
└── api/
    └── ARCH-REST_DESIGN.md
```

When using subdirectories, update the Detail File column in the index:
```markdown
| `[ARCH-AUTH_FLOW]` | Auth Flow | Active | ... | [Detail](architecture-decisions/auth/ARCH-AUTH_FLOW.md) |
```

---

## Migration from Monolithic File

If migrating from a single monolithic `architecture-decisions.md` file, see `migrate-architecture-decisions.md` for step-by-step instructions.

