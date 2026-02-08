# [REQ-STDD_SETUP] STDD Methodology Setup

**Category**: Functional  
**Priority**: P0 (Critical)  
**Status**: ✅ Implemented  
**Created**: 2025-11-08  
**Last Updated**: 2026-02-06

---

## Description

The project must follow the Semantic Token-Driven Development (STDD) methodology, including a specific directory structure (`stdd/`) and documentation files (`requirements.md`, `architecture-decisions.md`, etc.).

## Rationale

To ensure traceability of intent from requirements to code and to maintain a consistent development process.

## Satisfaction Criteria

- `stdd/` directory exists
- All required documentation files exist and are populated from templates:
  - `requirements.md` (index) with `requirements/` directory for detail files
  - `architecture-decisions.md` (index) with `architecture-decisions/` directory for detail files
  - `implementation-decisions.md` (index) with `implementation-decisions/` directory for detail files
  - `semantic-tokens.yaml` (YAML index/database of all tokens - canonical token registry)
  - `semantic-tokens.md` (semantic tokens guide with format and conventions)
  - `tasks.md` (task tracking)
  - `processes.md` (process tracking including `[PROC-YAML_DB_OPERATIONS]`)
- `.cursorrules` contains the STDD rules
- `AGENTS.md` contains canonical AI agent instructions

## Validation Criteria

- Manual verification of file existence
- AI agent acknowledgment of principles ("Observing AI principles!")
- Verification that all index files have corresponding detail directories
- Verification that template files are properly structured

## Traceability

- **Architecture**: `ARCH-STDD_STRUCTURE` (see `architecture-decisions.yaml`)
- **Implementation**: `IMPL-STDD_FILES` (see `implementation-decisions.yaml`)
- **Tests**: Manual verification checklists
- **Code**: Bootstrap scripts with `// [IMPL-STDD_FILES] [ARCH-STDD_STRUCTURE] [REQ-STDD_SETUP]`

_Note: In `requirements.yaml`, traceability is stored as structured YAML lists for programmatic querying._

## Related Requirements

- **Depends on**: None (foundational requirement)
- **Related to**: All other requirements depend on this setup
- **Supersedes**: None

---

*Last validated: 2026-02-06 by AI agent*
