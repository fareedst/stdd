# STDD Methodology Changelog

All notable changes to the STDD (Semantic Token-Driven Development) methodology will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-01-17

### Added

- **Scalable Implementation Decisions Structure**: Transformed `implementation-decisions.template.md` from a monolithic file into an index + detail files pattern for scalability
  - Main file now serves as a lightweight **index** with a table of all implementation decisions
  - Individual decisions stored in `implementation-decisions/` directory as separate files (e.g., `IMPL-CONFIG_STRUCT.md`)
  - Filename convention: Replace `:` with `-` to handle OS filename restrictions (`[IMPL:TOKEN]` → `IMPL-TOKEN.md`)
  - Status tracking per decision: Active, Deprecated, Template, Superseded
  - Optional domain-based grouping for very large projects

- **Migration Guide** (`migrate-implementation-decisions.md`): Comprehensive AI agent instructions for migrating existing projects from monolithic implementation-decisions files to the new scalable structure
  - Pre-migration checklist
  - Step-by-step migration process with commands
  - Post-migration verification
  - Handling special cases (missing tokens, duplicates, cross-references)
  - Complete worked example
  - Rollback procedure

- **Example Detail File** (`implementation-decisions.template/IMPL-MODULE_VALIDATION.md`): Complete reference implementation of a detail file

### Changed

- **`implementation-decisions.template.md`**: Now contains index table, detail file template, and instructions for the new structure
- **`semantic-tokens.template.md`**: Updated Implementation Tokens Registry reference to point to both index and detail files directory
- **Version Alignment**: Updated all methodology files to STDD v1.2.0

### Rationale

As projects grow, monolithic documentation files become unwieldy for both humans and AI agents. This change preserves all information while enabling:
- Faster navigation and context loading
- Cleaner git history per-decision
- Reduced merge conflicts
- Domain-based organization for large projects

---

## [1.1.0] - 2025-12-19

### Added

- **Processes as a Primary STDD Pillar** [PROC:PROJECT_SURVEY_AND_SETUP] [PROC:BUILD_PIPELINE_VALIDATION]: Elevated processes from optional guidance to a core methodology component so operational rituals remain traceable to requirements, architecture, and implementation tokens.

### Changed

- **Version Alignment**: Updated every methodology guide, template, and project copy to cite STDD v1.1.0 so downstream projects instantly inherit the processes-first workflow expectations.

### Rationale

Adding processes to the primary STDD methodology is a major capability improvement that affects every consumer of these templates, necessitating a version bump.

## [1.0.2] - 2025-01-27

### Added

- **Module Validation Requirement** [REQ:MODULE_VALIDATION]: Mandatory requirement for independent module validation before integration
  - Logical modules must be validated independently before integration into code satisfying specific requirements
  - Each module must have clear boundaries, interfaces, and validation criteria defined before development
  - Modules must pass independent validation (unit tests with mocks, integration tests with test doubles, contract validation, edge case testing, error handling validation) before integration
  - Integration only occurs after module validation passes
  - **Rationale**: Eliminates bugs related to code complexity by ensuring each module works correctly in isolation before combining with other modules

- **Module Validation Architecture Decision** [ARCH:MODULE_VALIDATION]: Architecture decision documenting the module validation strategy
  - Module identification requirements
  - Validation approach (unit testing, integration testing with test doubles, contract validation, edge case testing, error handling validation)
  - Integration requirements
  - Alternatives considered and rationale for rejection

- **Module Validation Implementation Decision** [IMPL:MODULE_VALIDATION]: Implementation decision documenting how module validation is implemented
  - Module identification phase
  - Module development phase
  - Module validation phase (before integration)
  - Integration phase (after validation)
  - Task structure and code markers

- **Template bootstrap script**: `copy_files.sh` copies every STDD template file into a target project’s `stdd/` directory, making STDD installation as easy as downloading the repository somewhere convenient and running the script from the desired project root.

### Changed

- **Development Process**: Enhanced Phase 1, Phase 2, and Phase 3 to include module identification, development, validation, and integration steps
- **AI-First Principles**: Added Principle 8 for independent module validation before integration
- **Task Template**: Updated to include module validation subtasks in task examples
- **All Templates**: Updated version numbers to 1.0.2

### Rationale

This enhancement addresses the need to eliminate bugs related to code complexity by requiring logical modules to be validated independently prior to integration. This ensures each module works correctly in isolation before combining with other modules, reducing integration complexity and catching bugs early in the development cycle.

## [1.0.1] - 2025-11-19

### Changed

- Made the repository language-neutral by removing specific language references
- Updated documentation to be language-agnostic

## [1.0.0] - 2025-11-08

### Added

- Initial release of STDD methodology template (Version 1.0.0)
- Complete STDD principles and process guide (`ai-principles.md`)
- STDD methodology overview for beginners, intermediate, and expert developers (`STDD.md`)
- Template files for project setup (with `.template.md` suffix):
  - `requirements.template.md` - Template for project requirements
  - `architecture-decisions.template.md` - Template for architecture decisions
  - `implementation-decisions.template.md` - Template for implementation decisions
  - `processes.template.md` - Template for process tracking
  - `semantic-tokens.template.md` - Template for semantic token registry
  - `tasks.template.md` - Template for task tracking
- AI agent operating guide (`AGENTS.md`) and Cursor IDE loader (`.cursorrules` template)
- Comprehensive README with getting started guide and template usage instructions
- Version file (`VERSION`) containing methodology version

### Methodology Components
- **Requirements Documentation** - Template file (`requirements.template.md`) for documenting requirements with `[REQ:*]` tokens
- **Architecture Decisions** - Template file (`architecture-decisions.template.md`) for documenting architecture decisions with `[ARCH:*]` tokens
- **Implementation Decisions** - Template file (`implementation-decisions.template.md`) for documenting implementation decisions with `[IMPL:*]` tokens
- **Process Management** - Template file (`processes.template.md`) for repeatable processes
- **Semantic Token System** - Template file (`semantic-tokens.template.md`) for central token registry and cross-referencing system
- **Task Management** - Template file (`tasks.template.md`) for priority-based task tracking system
- **Development Process** - Three-phase development process (Requirements → Pseudo-Code → Tasks → Implementation)

### Template Structure
- Template files use `.template.md` suffix to distinguish them from project-specific files
- Projects copy templates to their own files (without `.template` suffix) for project-specific development
- Methodology documentation files (`STDD.md`, `ai-principles.md`) remain as reference in the STDD repository
- All references in methodology files point to project files (without `.template`), as those are what exist in actual projects

### Key Features
- Intent preservation through semantic tokens
- Traceability from requirements to code
- Living documentation system
- AI agent integration (Cursor IDE)
- Template-based structure for easy adoption

[1.0.0]: https://github.com/fareedst/stdd/releases/tag/v1.0.0

