# STDD Methodology Template

**STDD Methodology Version**: 1.0.2

This repository ([https://github.com/fareedst/stdd](https://github.com/fareedst/stdd)) contains the **Semantic Token-Driven Development (STDD)** methodology template that can be used as a base for development projects in any language.

## What is STDD?

**Semantic Token-Driven Development (STDD)** uses semantic tokens to create a traceable chain from requirements through architecture and implementation to tests and code. This ensures that the original purpose and reasoning are never lost, even as the codebase evolves.

### Key Benefits

- **Traceability**: Every code decision can be traced back to its requirement
- **Context Preservation**: The "why" behind decisions is never lost
- **Living Documentation**: Documentation stays connected to code via tokens
- **Onboarding**: New developers can understand intent quickly
- **Refactoring Confidence**: Changes can be validated against original intent

## Repository Structure

This repository contains:

### Methodology Documentation (Reference Only)
- `STDD.md` - STDD methodology overview (for beginners, intermediate, and experts)
- `ai-principles.md` - Complete STDD principles and process guide
- `stdd-language-spec.md` - STDD language specification (pseudo-code templates with semantic tokens)
- `conversation-template.md` - Template conversation demonstrating STDD workflow
- `AGENTS.md` - Canonical AI agent operating guide
- `.cursorrules` - Cursor IDE loader that points to `AGENTS.md`
- `CHANGELOG.md` - Version history of the STDD methodology
- `VERSION` - Current methodology version

### Project Template Files (Copy to Your Project)
- `requirements.template.md` - Template for project requirements
- `architecture-decisions.template.md` - Template for architecture decisions
- `implementation-decisions.template.md` - Template for implementation decisions
- `semantic-tokens.template.md` - Template for semantic token registry
- `tasks.template.md` - Template for task tracking

## Getting Started with a New Project

### Step 1: Understand STDD

Read these documents in order:
1. `STDD.md` - Overview of STDD methodology
2. `ai-principles.md` - Complete STDD principles and process guide
3. `stdd-language-spec.md` - STDD language specification (optional, for advanced users)
4. `conversation-template.md` - Example conversation showing STDD in practice (recommended)
5. `AGENTS.md` - Canonical AI agent rules (required if collaborating with AI assistants)
6. `.cursorrules` - Cursor IDE loader (if using Cursor)

### Step 2: Copy Templates to Your Project

Copy the template files from the [STDD repository](https://github.com/fareedst/stdd) to your project root and remove the `.template` suffix:

```bash
# In your project directory (after cloning/downloading the STDD repository)
cp requirements.template.md stdd/requirements.md
cp architecture-decisions.template.md stdd/architecture-decisions.md
cp implementation-decisions.template.md stdd/implementation-decisions.md
cp semantic-tokens.template.md stdd/semantic-tokens.md
cp tasks.template.md stdd/tasks.md
cp AGENTS.md AGENTS.md              # Copy canonical AI agent guide
cp .cursorrules .cursorrules        # Copy Cursor loader if using Cursor
```

**Important**: Each project should have its own copies of these files. The template files remain in the [STDD repository](https://github.com/fareedst/stdd) as reference templates.

### Step 3: Customize for Your Project

1. **Define Requirements** (`requirements.md`)
   - List all functional and non-functional requirements
   - Assign `[REQ:*]` tokens to each requirement
   - Mark status: ⏳ Planned or ✅ Implemented
   - Customize the template structure for your project's needs

2. **Document Architecture Decisions** (`architecture-decisions.md`)
   - Document high-level design choices
   - Assign `[ARCH:*]` tokens
   - Cross-reference `[REQ:*]` tokens
   - Add language/framework-specific architecture decisions

3. **Document Implementation Decisions** (`implementation-decisions.md`)
   - Document low-level implementation choices
   - Assign `[IMPL:*]` tokens
   - Cross-reference both `[ARCH:*]` and `[REQ:*]` tokens
   - Add language-specific implementation patterns

4. **Maintain Token Registry** (`semantic-tokens.md`)
   - Register all tokens used in your project
   - Document token relationships
   - Keep it updated as you create new tokens
   - Add project-specific token categories

5. **Track Tasks** (`tasks.md`)
   - Break work into trackable tasks
   - Assign priorities: P0 (Critical) > P1 (Important) > P2 (Nice-to-Have) > P3 (Future)
   - Include semantic token references in task descriptions
   - Customize task structure for your project workflow

### Step 4: Follow the Development Process

#### Phase 1: Requirements → Pseudo-Code
- Expand requirements into pseudo-code and decisions
- **IMMEDIATELY** identify logical modules and document module boundaries
- **IMMEDIATELY** document architecture decisions in `architecture-decisions.md`
- **IMMEDIATELY** document implementation decisions in `implementation-decisions.md`
- **IMMEDIATELY** update `semantic-tokens.md` with new tokens
- **IMMEDIATELY** create tasks in `tasks.md`
- **NO code changes yet**

#### Phase 2: Pseudo-Code → Tasks
- Break down into discrete tasks in `tasks.md`
- **IMMEDIATELY** create separate tasks for module development, module validation, and integration
- Assign priorities to all tasks
- Include semantic token references
- **DO NOT** start implementation until tasks are documented

#### Phase 3: Tasks → Implementation
- Work on highest priority tasks first
- **MANDATORY**: Develop each logical module independently
- **MANDATORY**: Validate each module independently (unit tests with mocks, contract tests, edge cases, error handling) before integration
- **MANDATORY**: Only integrate modules after validation passes
- Use semantic tokens in code comments
- Use semantic tokens in test names/comments
- Update documentation AS YOU WORK (not at the end)
- **MANDATORY**: After you finish any code or test changes, verify semantic tokens in the modified source, tests, and documentation still align with the same `[REQ:*]`, `[ARCH:*]`, `[IMPL:*]`, and `[TEST:*]` tokens, and refresh `semantic-tokens.md` before claiming completion.
- Mark tasks complete in `tasks.md` as you finish them

## Project File Structure

After copying templates, your project should have:

```
your-project/
├── AGENTS.md                 # Canonical AI agent instructions
├── .cursorrules              # Cursor IDE loader (optional, if using Cursor)
├── requirements.md           # Your project requirements with [REQ:*] tokens
├── architecture-decisions.md # Your project architecture decisions with [ARCH:*] tokens
├── implementation-decisions.md # Your project implementation decisions with [IMPL:*] tokens
├── semantic-tokens.md        # Your project's semantic token registry
├── tasks.md                  # Your project's active task tracking
└── [your source code]        # Your actual project code
```

**Note**: The methodology documentation files (`STDD.md`, `ai-principles.md`) remain in the [STDD repository](https://github.com/fareedst/stdd) as reference. You don't need to copy them to your project unless you want local copies.

## Key Principles

1. **Semantic Token Cross-Referencing**
   - All code, tests, requirements, architecture, and implementation decisions MUST be cross-referenced using semantic tokens

2. **Documentation-First Development**
   - Requirements MUST be expanded into pseudo-code and architectural decisions before implementation
   - No code changes until requirements are fully specified with semantic tokens

3. **Independent Module Validation Before Integration**
   - Logical modules MUST be validated independently before integration into code satisfying specific requirements
   - Each module must have clear boundaries, interfaces, and validation criteria defined before development
   - Modules must pass independent validation (unit tests with mocks, integration tests with test doubles, contract validation, edge case testing, error handling validation) before integration
   - Integration only occurs after module validation passes
   - **Rationale**: Eliminates bugs related to code complexity by ensuring each module works correctly in isolation before combining with other modules

4. **Test-Driven Documentation**
   - Tests MUST reference the requirements they validate using semantic tokens
   - Test names should include semantic tokens

5. **Incremental Task Tracking**
   - Every requirement implementation MUST be broken down into trackable tasks
   - Tasks have explicit priorities: P0 > P1 > P2 > P3

6. **Complete Task Completion**
   - When all subtasks for a task are complete, remove subtasks and mark the parent task complete
   - Maintain a clean task list showing only active work

## Documentation Requirements

### ⚠️ CRITICAL: Documentation is MANDATORY, Not Optional

**Documentation updates are REQUIRED at every stage of development. They are not optional or deferrable.**

### Required Sections in Your Project

1. **Requirements** - with `[REQ:*]` tokens (in `requirements.md`)
2. **Architecture Decisions** - with `[ARCH:*]` tokens (in `architecture-decisions.md`)
   - **MUST** be recorded IMMEDIATELY when made
   - **MUST** cross-reference `[REQ:*]` tokens
3. **Implementation Decisions** - with `[IMPL:*]` tokens (in `implementation-decisions.md`)
   - **MUST** be recorded IMMEDIATELY when made
   - **MUST** cross-reference both `[ARCH:*]` and `[REQ:*]` tokens
4. **Semantic Token Registry** - maintained in `semantic-tokens.md`
   - **MUST** be updated immediately when creating new tokens
5. **Task Planning** - maintained in `tasks.md`
   - **MUST** be updated when planning new work or completing tasks

## Example Workflow

1. **User Request**: "Add user authentication"
2. **AI Response (Planning Phase - NO CODE YET)**: 
   - Creates `[REQ:USER_AUTH]` token in `requirements.md`
   - Expands into pseudo-code and decisions
   - **IMMEDIATELY** documents architecture decisions in `architecture-decisions.md` with `[ARCH:*]` tokens
   - **IMMEDIATELY** documents implementation decisions in `implementation-decisions.md` with `[IMPL:*]` tokens
   - **IMMEDIATELY** updates `semantic-tokens.md` with all new tokens
   - **IMMEDIATELY** creates tasks in `tasks.md` with priorities and semantic token references
   - **NO code changes yet**
3. **User Approval**: User reviews and approves planning documents
4. **Implementation Phase**: 
   - Implement tasks, starting with highest priority
   - **DURING implementation**: Update documentation as decisions are made or refined
   - **DURING implementation**: Update `tasks.md` as subtasks are completed
5. **Completion Phase**: 
- Verify all documentation is up-to-date and mirrors the semantic tokens referenced by the finished code and tests
- Mark tasks complete in `tasks.md`
- Remove completed subtasks
- Ensure the semantic tokens registered in `semantic-tokens.md` match the tokens used across code, tests, and documentation for these changes


## AI Agent Instructions

All operational checklists and acknowledgement requirements for AI assistants now live in `AGENTS.md`. Use `.cursorrules` only as a loader that redirects Cursor to this canonical guide.

## Language-Specific Notes

The STDD methodology is language-agnostic. When customizing templates for your project:

- **Language‑specific projects**: Update code examples in templates to match your chosen language
- **Language‑specific projects**: Update code examples in templates to match your chosen language
- **Language‑specific projects**: Update code examples in templates to match your chosen language
- **Language‑specific projects**: Update code examples in templates to match your chosen language
- **Other languages**: Adapt the templates to your language's conventions

The semantic token system and development process remain the same regardless of language.

## Resources

### Methodology Documentation (Reference)
- `STDD.md` - STDD methodology overview (for beginners, intermediate, and experts)
- `ai-principles.md` - Complete STDD principles and process guide
- `stdd-language-spec.md` - STDD language specification (pseudo-code templates with semantic tokens)
- `conversation-template.md` - Template conversation demonstrating STDD workflow
- `CHANGELOG.md` - Version history

### Template Files (Copy to Your Project)
- `requirements.template.md` - Template for requirements with `[REQ:*]` tokens
- `architecture-decisions.template.md` - Template for architecture decisions with `[ARCH:*]` tokens
- `implementation-decisions.template.md` - Template for implementation decisions with `[IMPL:*]` tokens
- `semantic-tokens.template.md` - Template for semantic token registry
- `tasks.template.md` - Template for task tracking
- `AGENTS.md` - Canonical AI agent operating guide (copy as-is)
- `.cursorrules` - Template for Cursor IDE loader (optional)

## Repository

**STDD Methodology Repository**: [https://github.com/fareedst/stdd](https://github.com/fareedst/stdd)

## License

[Add your license information here]
