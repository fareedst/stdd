# Architecture Decisions

**STDD Methodology Version**: 1.3.0

## Overview

This document serves as the **index** for all architecture decisions in this project. Each architecture decision is stored in its own file within the `architecture-decisions/` directory for scalability.

All decisions are cross-referenced with requirements using `[REQ-*]` tokens for traceability.

## Directory Structure

```
stdd/
├── architecture-decisions.md              # This index file
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

| Token | Title | Status | Cross-References | Detail File |
|-------|-------|--------|------------------|-------------|
| `[ARCH-STDD_STRUCTURE]` | STDD Project Structure | Active | [REQ-STDD_SETUP] | [Detail](architecture-decisions/ARCH-STDD_STRUCTURE.md) |
| `[ARCH-MODULE_VALIDATION]` | Module Validation Strategy | Active | [REQ-MODULE_VALIDATION] | [Detail](architecture-decisions/ARCH-MODULE_VALIDATION.md) |
| `[ARCH-LANGUAGE_SELECTION]` | Language and Runtime Selection | Template | — | [Detail](architecture-decisions/ARCH-LANGUAGE_SELECTION.md) |
| `[ARCH-EXAMPLE_DECISION]` | Core Architecture Example | Template | [REQ-EXAMPLE_FEATURE] | [Detail](architecture-decisions/ARCH-EXAMPLE_DECISION.md) |
| `[ARCH-ERROR_HANDLING]` | Error Handling Strategy | Template | [REQ-ERROR_HANDLING] | [Detail](architecture-decisions/ARCH-ERROR_HANDLING.md) |
| `[ARCH-TESTING_STRATEGY]` | Testing Strategy | Template | — | [Detail](architecture-decisions/ARCH-TESTING_STRATEGY.md) |

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

