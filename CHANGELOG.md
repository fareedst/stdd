# STDD Methodology Changelog

All notable changes to the STDD (Semantic Token-Driven Development) methodology will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.5.0] - 2026-02-07

### Added

- **YAML Database Indexes** [PROC-YAML_DB_OPERATIONS]: Transformed all three index files from Markdown tables to YAML database files for improved programmatic access and append-only semantics
  - `requirements.template.yaml` - YAML database with all requirement records (replaces Markdown tables in requirements.template.md)
  - `architecture-decisions.template.yaml` - YAML database with all architecture decision records (replaces Markdown tables in architecture-decisions.template.md)
  - `implementation-decisions.template.yaml` - YAML database with all implementation decision records (replaces Markdown tables in implementation-decisions.template.md)
  - Each YAML file includes comprehensive header documentation and template blocks for easy appending
  - Schema tailored per type: Requirements have `satisfaction_criteria` and `validation_criteria`; Architecture has `alternatives_considered` and `implementation_approach`; Implementation has `code_markers` and `implementation_approach`
  - Append-only design: copy template block from bottom, paste at end, fill fields
  - Enables programmatic querying with `yq`, `grep`, Python `yaml.safe_load()`, and other YAML tools

- **YAML Operations Process Documentation** [PROC-YAML_DB_OPERATIONS]: Comprehensive process guide in `processes.template.md`
  - Appending new records (manual and scripted)
  - Reading specific records (`yq`, `grep`, Python)
  - Filtering by status/priority
  - Validating YAML syntax
  - Listing all tokens
  - Checking cross-references
  - Complete examples for all operations

- **YAML Index Migration Guide** (`migrate-to-yaml-indexes.md`): Comprehensive migration instructions for projects moving from Markdown table indexes to YAML indexes
  - Pre-migration checklist
  - Step-by-step migration for all three index types
  - Manual and scripted conversion approaches
  - Cross-reference updates
  - YAML syntax validation
  - Traceability verification
  - Post-migration checklist
  - Rollback procedure
  - Troubleshooting section

### Changed

- **`.template.md` files**: Now serve as **guide files** explaining how to use YAML indexes
  - `requirements.template.md` - Removed Markdown tables, added YAML file references and "How to Append" instructions
  - `architecture-decisions.template.md` - Removed Markdown tables, added YAML file references and "How to Append" instructions
  - `implementation-decisions.template.md` - Removed Markdown tables, added YAML file references and "How to Append" instructions
  - All three files maintain detail file templates and documentation structure

- **`copy_files.sh`**: Updated to copy YAML template files
  - Added `requirements.template.yaml` to TEMPLATE_FILES array
  - Added `architecture-decisions.template.yaml` to TEMPLATE_FILES array
  - Added `implementation-decisions.template.yaml` to TEMPLATE_FILES array

- **`semantic-tokens.template.md`**: Updated all references to mention `.yaml` index files alongside `.md` guide files
  - Added `[PROC-YAML_DB_OPERATIONS]` to Process Tokens Registry

- **`AGENTS.md`**: Updated Key Files table and Section 2 to reference `.yaml` index files
  - Index files listed as YAML databases with `.md` files as guides

- **`ai-principles.md`**: Comprehensive updates throughout
  - Documentation Structure section updated to reference `.yaml` files
  - Related Documents section updated with `.yaml` file references
  - Feature documentation format updated to use `.yaml` file references
  - Critical reminders updated to reference `.yaml` files
  - Change Impact Tracking matrix updated to use `.yaml` files
  - All checklist items updated to reference `.yaml` files

- **`STDD.md`**: Updated references to mention YAML index format in documentation outputs and template file listings

- **Version Alignment**: Updated all methodology files to STDD v1.5.0

### Benefits

- **Programmatic Access**: Query, filter, and validate indexes using standard YAML tools (`yq`, Python, etc.)
- **Append-Only Semantics**: Add new records by copying template block and pasting at end - reduces merge conflicts
- **Structured Data**: YAML provides proper data types (lists, multi-line strings) vs. Markdown table text
- **Easier Validation**: `yq '.' file.yaml` validates syntax; custom scripts can validate cross-references
- **Better Tooling**: Standard YAML parsers available in all languages
- **Consistent Format**: No Markdown table formatting issues or alignment problems
- **Preserve Detail Files**: Detail `.md` files remain unchanged - only indexes converted to YAML

### Rationale

Markdown tables become unwieldy for programmatic operations (filtering, querying, validation). YAML provides:
1. **Machine-readable structure** while maintaining human readability
2. **Append-only workflow** that minimizes merge conflicts
3. **Rich data types** (lists, multi-line strings) vs. plain text in table cells
4. **Standard tooling** available across all programming languages
5. **Easier validation** of both syntax and semantic consistency

The `.md` guide files explain how to use the YAML indexes, while the YAML files themselves serve as the canonical database. Detail files remain in Markdown for narrative documentation.

---

## [1.4.0] - 2026-02-06

### Added

- **Scalable Requirements Structure**: Transformed `requirements.template.md` from a monolithic file into an index + detail files pattern for scalability
  - Main file now serves as a lightweight **index** with a table of all requirements
  - Individual requirements stored in `requirements.template/` directory as separate files (e.g., `REQ-STDD_SETUP.md`)
  - Mirrors the architecture-decisions (v1.3.0) and implementation-decisions (v1.2.0) structure
  - Status tracking per requirement: ✅ Implemented, ⏳ Planned, Template
  - Optional domain-based grouping for very large projects

- **Requirements Migration Guide** (`migrate-requirements.md`): Comprehensive AI agent instructions for migrating existing projects from monolithic requirements files to the new scalable structure
  - Pre-migration checklist
  - Step-by-step migration process with commands
  - Post-migration verification
  - Handling special cases (missing tokens, duplicates, cross-references)
  - Complete worked example
  - Rollback procedure

- **Example Requirements Detail Files** (`requirements.template/`): Complete reference implementations
  - `REQ-STDD_SETUP.md`
  - `REQ-MODULE_VALIDATION.md`
  - `REQ-IDENTIFIER.md` (template example)

### Changed

- **`requirements.template.md`**: Now contains index table, detail file template, and instructions for the new structure
- **`copy_files.sh`**: Updated to copy requirements detail files from `requirements.template/` directory
- **`semantic-tokens.template.md`**: Updated Requirements Tokens Registry reference to point to both index and detail files directory
- **Cross-references**: Updated `ai-principles.md`, `AGENTS.md`, `README.md`, and `STDD.md` to reflect new requirements structure
- **Version Alignment**: Updated all methodology files to STDD v1.4.0

### Rationale

As projects grow, monolithic requirements files become unwieldy for both humans and AI agents. This change (completing the pattern started with implementation-decisions in v1.2.0 and architecture-decisions in v1.3.0) preserves all information while enabling:
- Faster navigation and context loading
- Cleaner git history per-requirement
- Reduced merge conflicts
- Domain-based organization for large projects
- Consistent pattern across all STDD documentation types (requirements, architecture, implementation)

---

## [1.3.0] - 2026-01-17

### Added

- **Unified Semantic Token Format**: Standardized all semantic tokens from colon format (`[TYPE:IDENTIFIER]`) to hyphen format (`[TYPE-IDENTIFIER]`)
  - Enables single regex pattern for both text and filenames
  - Consistent mental model - tokens look the same everywhere
  - Simplified tooling - no format translation needed
  - Easier searchability - agents can use one pattern for all contexts

- **Scalable Architecture Decisions Structure**: Transformed `architecture-decisions.template.md` from a monolithic file into an index + detail files pattern for scalability
  - Main file now serves as a lightweight **index** with a table of all architecture decisions
  - Individual decisions stored in `architecture-decisions/` directory as separate files (e.g., `ARCH-STDD_STRUCTURE.md`)
  - Mirrors the implementation-decisions structure from v1.2.0
  - Status tracking per decision: Active, Deprecated, Template, Superseded
  - Optional domain-based grouping for very large projects

- **Token Format Migration Guide** (`migrate-semantic-token-format.md`): Comprehensive AI agent instructions for migrating existing projects from colon-based tokens to hyphen-based tokens
  - Pre-migration checklist
  - Automated sed/grep commands for bulk replacement
  - Universal migration script
  - Post-migration verification steps
  - Rollback procedure

- **Architecture Decisions Migration Guide** (`migrate-architecture-decisions.md`): Comprehensive AI agent instructions for migrating existing projects from monolithic architecture-decisions files to the new scalable structure
  - Pre-migration checklist
  - Step-by-step migration process with commands
  - Post-migration verification
  - Handling special cases (missing tokens, duplicates, cross-references)
  - Complete worked example
  - Rollback procedure

- **Example Architecture Detail Files** (`architecture-decisions.template/`): Complete reference implementations
  - `ARCH-STDD_STRUCTURE.md`
  - `ARCH-MODULE_VALIDATION.md`
  - `ARCH-EXAMPLE_DECISION.md`

### Changed

- **All Documentation Files**: Updated to use hyphen-based token format (`[TYPE-IDENTIFIER]`)
- **`architecture-decisions.template.md`**: Now contains index table, detail file template, and instructions for the new structure
- **`semantic-tokens.template.md`**: Updated Architecture Tokens Registry reference to point to both index and detail files directory
- **Version Alignment**: Updated all methodology files to STDD v1.3.0

### Rationale

**Token Format Change**: The colon (`:`) character is invalid in filenames on many operating systems. Previously this required different patterns for tokens in text vs. filenames. The hyphen format unifies both, enabling single-pattern matching and simplified tooling.

**Architecture Decisions Structure**: As projects grow, monolithic documentation files become unwieldy for both humans and AI agents. This change (mirroring the v1.2.0 implementation-decisions change) preserves all information while enabling faster navigation, cleaner git history, reduced merge conflicts, and domain-based organization.

---

## [1.2.0] - 2026-01-17

### Added

- **Scalable Implementation Decisions Structure**: Transformed `implementation-decisions.template.md` from a monolithic file into an index + detail files pattern for scalability
  - Main file now serves as a lightweight **index** with a table of all implementation decisions
  - Individual decisions stored in `implementation-decisions/` directory as separate files (e.g., `IMPL-CONFIG_STRUCT.md`)
  - Filename convention: Replace `:` with `-` to handle OS filename restrictions (`[IMPL-TOKEN]` → `IMPL-TOKEN.md`)
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

- **Processes as a Primary STDD Pillar** [PROC-PROJECT_SURVEY_AND_SETUP] [PROC-BUILD_PIPELINE_VALIDATION]: Elevated processes from optional guidance to a core methodology component so operational rituals remain traceable to requirements, architecture, and implementation tokens.

### Changed

- **Version Alignment**: Updated every methodology guide, template, and project copy to cite STDD v1.1.0 so downstream projects instantly inherit the processes-first workflow expectations.

### Rationale

Adding processes to the primary STDD methodology is a major capability improvement that affects every consumer of these templates, necessitating a version bump.

## [1.0.2] - 2025-01-27

### Added

- **Module Validation Requirement** [REQ-MODULE_VALIDATION]: Mandatory requirement for independent module validation before integration
  - Logical modules must be validated independently before integration into code satisfying specific requirements
  - Each module must have clear boundaries, interfaces, and validation criteria defined before development
  - Modules must pass independent validation (unit tests with mocks, integration tests with test doubles, contract validation, edge case testing, error handling validation) before integration
  - Integration only occurs after module validation passes
  - **Rationale**: Eliminates bugs related to code complexity by ensuring each module works correctly in isolation before combining with other modules

- **Module Validation Architecture Decision** [ARCH-MODULE_VALIDATION]: Architecture decision documenting the module validation strategy
  - Module identification requirements
  - Validation approach (unit testing, integration testing with test doubles, contract validation, edge case testing, error handling validation)
  - Integration requirements
  - Alternatives considered and rationale for rejection

- **Module Validation Implementation Decision** [IMPL-MODULE_VALIDATION]: Implementation decision documenting how module validation is implemented
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
- **Requirements Documentation** - Template file (`requirements.template.md`) for documenting requirements with `[REQ-*]` tokens
- **Architecture Decisions** - Template file (`architecture-decisions.template.md`) for documenting architecture decisions with `[ARCH-*]` tokens
- **Implementation Decisions** - Template file (`implementation-decisions.template.md`) for documenting implementation decisions with `[IMPL-*]` tokens
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

