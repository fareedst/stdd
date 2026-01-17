# [ARCH-STDD_STRUCTURE] STDD Project Structure

**Cross-References**: [REQ-STDD_SETUP]  
**Status**: Active  
**Created**: 2025-12-18  
**Last Updated**: 2025-12-18

---

## Decision

Centralized `stdd/` directory for all STDD methodology documentation.

## Rationale

- Keeps documentation close to code but organized in a dedicated namespace
- Ensures the AI agent can easily find all context in one place
- Separates meta-documentation from project source code
- Clear separation of concerns
- Standard project layout
- Testable components

## Alternatives Considered

- **Root-level files**: Rejected - clutters the root directory
- **`.github` or `.docs` folder**: Rejected - `stdd` is more specific to the methodology

## Implementation Approach

- Create `stdd/` directory at project root
- Populate with template files:
  - `requirements.md`
  - `architecture-decisions.md` (index)
  - `architecture-decisions/` (detail files)
  - `implementation-decisions.md` (index)
  - `implementation-decisions/` (detail files)
  - `semantic-tokens.md`
  - `tasks.md`
  - `processes.md`

## Token Coverage `[PROC-TOKEN_AUDIT]`

Code files expected to carry `[IMPL-*] [ARCH-*] [REQ-*]` comments:
- [ ] Bootstrap scripts with `// [IMPL-STDD_FILES] [ARCH-STDD_STRUCTURE] [REQ-STDD_SETUP]`

Tests expected to reference `[REQ-*]` / `[TEST-*]` tokens:
- [ ] `TestSTDDSetup_REQ_STDD_SETUP` ensures docs + registry exist

## Validation Evidence `[PROC-TOKEN_VALIDATION]`

| Date | Commit | Validation Result | Notes |
|------|--------|-------------------|-------|
| 2025-12-18 | — | ✅ Pass | Initial structure validated |

## Related Decisions

- Depends on: [REQ-STDD_SETUP]
- Informs: [IMPL-STDD_FILES]
- See also: —

---

*Last validated: 2025-12-18*
