# STDD Methodology Changelog

All notable changes to the STDD (Semantic Token-Driven Development) methodology will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
  - `semantic-tokens.template.md` - Template for semantic token registry
  - `tasks.template.md` - Template for task tracking
- Cursor IDE rules for AI agents (`.cursorrules` template)
- Comprehensive README with getting started guide and template usage instructions
- Version file (`VERSION`) containing methodology version

### Methodology Components
- **Requirements Documentation** - Template file (`requirements.template.md`) for documenting requirements with `[REQ:*]` tokens
- **Architecture Decisions** - Template file (`architecture-decisions.template.md`) for documenting architecture decisions with `[ARCH:*]` tokens
- **Implementation Decisions** - Template file (`implementation-decisions.template.md`) for documenting implementation decisions with `[IMPL:*]` tokens
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

