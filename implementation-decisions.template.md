# Implementation Decisions

**STDD Methodology Version**: 1.2.0

## Overview

This document serves as the **index** for all implementation decisions in this project. Each implementation decision is stored in its own file within the `implementation-decisions/` directory for scalability.

All decisions are cross-referenced with architecture decisions using `[ARCH:*]` tokens and requirements using `[REQ:*]` tokens for traceability.

## Directory Structure

```
stdd/
├── implementation-decisions.md              # This index file
├── implementation-decisions/                # Detail files directory
│   ├── IMPL-CONFIG_STRUCT.md
│   ├── IMPL-STDD_FILES.md
│   ├── IMPL-MODULE_VALIDATION.md
│   └── ...
```

## Filename Convention

Token names contain `:` which is invalid in filenames on many operating systems. Use this mapping:

| Token Format | Filename Format |
|--------------|-----------------|
| `[IMPL:CONFIG_STRUCT]` | `IMPL-CONFIG_STRUCT.md` |
| `[IMPL:MODULE_VALIDATION]` | `IMPL-MODULE_VALIDATION.md` |

**Rule**: Replace `[`, `]`, and `:` → Remove brackets, replace `:` with `-`, append `.md`

## Notes

- All implementation decisions MUST be recorded IMMEDIATELY when made
- Each decision MUST include `[IMPL:*]` token and cross-reference both `[ARCH:*]` and `[REQ:*]` tokens
- Implementation decisions are dependent on both architecture decisions and requirements
- DO NOT defer implementation documentation - record decisions as they are made
- Record where code/tests are annotated so `[PROC:TOKEN_AUDIT]` can succeed later
- Include the most recent `[PROC:TOKEN_VALIDATION]` run information so future contributors know the last verified state
- **Language-Specific Implementation**: Language-specific implementation details (APIs, libraries, syntax patterns, idioms) belong in implementation decisions. Code examples in documentation should use `[your-language]` placeholders or be language-agnostic pseudo-code unless demonstrating a specific language requirement. Requirements and architecture decisions should remain language-agnostic.

## How to Add a New Implementation Decision

1. **Create a new detail file** in `implementation-decisions/` using the naming convention above
2. **Use the detail file template** (see below)
3. **Add an entry to the index table** below
4. **Update `semantic-tokens.md`** registry with the new `[IMPL:*]` token

---

## Implementation Decisions Index

| Token | Title | Status | Cross-References | Detail File |
|-------|-------|--------|------------------|-------------|
| `[IMPL:CONFIG_STRUCT]` | Configuration Structure | Active | [ARCH:CONFIG_STRUCTURE] [REQ:CONFIGURATION] | [Detail](implementation-decisions/IMPL-CONFIG_STRUCT.md) |
| `[IMPL:STDD_FILES]` | STDD File Creation | Active | [ARCH:STDD_STRUCTURE] [REQ:STDD_SETUP] | [Detail](implementation-decisions/IMPL-STDD_FILES.md) |
| `[IMPL:EXAMPLE_IMPLEMENTATION]` | Core Implementation Example | Template | [ARCH:EXAMPLE_DECISION] [REQ:EXAMPLE_FEATURE] | [Detail](implementation-decisions/IMPL-EXAMPLE_IMPLEMENTATION.md) |
| `[IMPL:ERROR_HANDLING]` | Error Handling | Active | [ARCH:ERROR_HANDLING] [REQ:ERROR_HANDLING] | [Detail](implementation-decisions/IMPL-ERROR_HANDLING.md) |
| `[IMPL:TESTING]` | Testing Implementation | Active | [ARCH:TESTING_STRATEGY] [REQ:*] | [Detail](implementation-decisions/IMPL-TESTING.md) |
| `[IMPL:CODE_STYLE]` | Code Style and Conventions | Active | — | [Detail](implementation-decisions/IMPL-CODE_STYLE.md) |
| `[IMPL:MODULE_VALIDATION]` | Module Validation | Active | [ARCH:MODULE_VALIDATION] [REQ:MODULE_VALIDATION] | [Detail](implementation-decisions/IMPL-MODULE_VALIDATION.md) |

### Status Values

- **Active**: Currently in use and maintained
- **Deprecated**: No longer recommended; kept for historical reference
- **Template**: Example/template entry for reference
- **Superseded**: Replaced by another decision (note the replacement in the detail file)

---

## Detail File Template

Use this template when creating a new implementation decision file in `implementation-decisions/`:

```markdown
# [IMPL:IDENTIFIER] Implementation Title

**Cross-References**: [ARCH:RELATED_ARCHITECTURE] [REQ:RELATED_REQUIREMENT]  
**Status**: Active  
**Created**: YYYY-MM-DD  
**Last Updated**: YYYY-MM-DD

---

## Decision

Brief description of the implementation decision.

## Rationale

- Why this implementation approach was chosen
- What problems it solves
- How it fulfills the architecture decision

## Implementation Approach

- Specific technical details
- Code structure or patterns
- API design decisions

### Data Structures

```[your-language]
// [IMPL:IDENTIFIER] [ARCH:RELATED_ARCHITECTURE] [REQ:RELATED_REQUIREMENT]
// Define your data structures here
type ExampleStruct struct {
    Field1 string
    Field2 int
}
```

### Key Algorithms

Description of key algorithms and their implementation.

### Platform-Specific Considerations

- Platform 1: Specific considerations
- Platform 2: Specific considerations

## Code Markers

Specific code locations, function names, or patterns to look for:
- `path/to/file.ext`: Description of what's implemented there
- Function `exampleFunction()`: What it does

## Token Coverage `[PROC:TOKEN_AUDIT]`

Files/functions that must carry the `[IMPL:*] [ARCH:*] [REQ:*]` annotations:
- [ ] `path/to/implementation.ext` - Main implementation
- [ ] `path/to/helper.ext` - Helper functions

Tests that must reference the matching `[REQ:*]`:
- [ ] `testFeatureName_REQ_IDENTIFIER` in `path/to/test_file.ext`

## Validation Evidence `[PROC:TOKEN_VALIDATION]`

| Date | Commit | Validation Result | Notes |
|------|--------|-------------------|-------|
| YYYY-MM-DD | `abc1234` | ✅ Pass | Initial validation |

Latest `./scripts/validate_tokens.sh` output summary:
```
(paste relevant output here)
```

## Related Decisions

- Depends on: [IMPL:OTHER_DECISION]
- Supersedes: (if applicable)
- See also: [ARCH:RELATED_ARCHITECTURE]

---

*Last validated: YYYY-MM-DD by [agent/contributor]*
```

---

## Quick Reference: Creating a New Implementation Decision

```bash
# 1. Create the detail file
touch stdd/implementation-decisions/IMPL-YOUR_TOKEN.md

# 2. Copy the template above into the new file

# 3. Fill in the details

# 4. Add entry to the index table in this file

# 5. Update semantic-tokens.md registry
```

---

## Grouping by Domain (Optional)

For very large projects, organize detail files by domain:

```
implementation-decisions/
├── core/
│   ├── IMPL-CONFIG_STRUCT.md
│   └── IMPL-ERROR_HANDLING.md
├── auth/
│   ├── IMPL-AUTH_FLOW.md
│   └── IMPL-SESSION_MGMT.md
└── api/
    └── IMPL-REST_ENDPOINTS.md
```

When using subdirectories, update the Detail File column in the index:
```markdown
| `[IMPL:AUTH_FLOW]` | Auth Flow | Active | ... | [Detail](implementation-decisions/auth/IMPL-AUTH_FLOW.md) |
```

---

## Migration from Monolithic File

If migrating from a single `implementation-decisions.md` file:

1. Create the `implementation-decisions/` directory
2. For each numbered section in the old file:
   - Create `IMPL-{TOKEN_NAME}.md` using the detail template
   - Copy content into the new file
   - Add metadata (Status, Created, Last Updated)
3. Replace section content in this file with an index row
4. Update `semantic-tokens.md` to note the new structure
5. Verify all links work correctly

