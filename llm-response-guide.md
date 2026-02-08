# LLM Response Guide

This document describes how AI assistants should respond when working with the STDD methodology.

## AI Agent Instructions

All operational checklists and acknowledgement requirements for AI assistants now live in `AGENTS.md`. Use `.cursorrules` only as a loader that redirects Cursor to this canonical guide.

## Getting Started with a New Project

### Step 1: Understand STDD

Read these documents in order:
1. `STDD.md` - Overview of STDD methodology
2. `ai-principles.md` - Complete STDD principles and process guide
3. `stdd-language-spec.md` - STDD language specification (optional, for advanced users)
4. `conversation.template.md` - Example conversation showing STDD in practice (recommended)
5. `AGENTS.md` - Canonical AI agent rules (required if collaborating with AI assistants)
6. `.cursorrules` - Cursor IDE loader (if using Cursor)

### Step 3: Customize for Your Project

1. **Define Requirements** (`requirements.md`)
   - List all functional and non-functional requirements
   - Assign `[REQ-*]` tokens to each requirement
   - Mark status: ⏳ Planned or ✅ Implemented
   - Customize the template structure for your project's needs

2. **Document Architecture Decisions** (`architecture-decisions.md`)
   - Document high-level design choices
   - Assign `[ARCH-*]` tokens
   - Cross-reference `[REQ-*]` tokens
   - Add language/framework-specific architecture decisions

3. **Document Implementation Decisions** (`implementation-decisions.md`)
   - Document low-level implementation choices
   - Assign `[IMPL-*]` tokens
   - Cross-reference both `[ARCH-*]` and `[REQ-*]` tokens
   - Add language-specific implementation patterns

4. **Maintain Token Registry** (`semantic-tokens.yaml`)
   - Register all tokens used in your project
   - Keep metadata current (status, cross-references, source index)
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
- **IMMEDIATELY** update `semantic-tokens.yaml` with new tokens
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
- **MANDATORY**: After you finish any code or test changes, verify semantic tokens in the modified source, tests, and documentation still align with the same `[REQ-*]`, `[ARCH-*]`, `[IMPL-*]`, and `[TEST-*]` tokens, and refresh `semantic-tokens.yaml` before claiming completion.
- Mark tasks complete in `tasks.md` as you finish them
## Documentation Requirements

### ⚠️ CRITICAL: Documentation is MANDATORY, Not Optional

**Documentation updates are REQUIRED at every stage of development. They are not optional or deferrable.**

### Required Sections in Your Project

1. **Requirements** - with `[REQ-*]` tokens (in `requirements.md`)
2. **Architecture Decisions** - with `[ARCH-*]` tokens (in `architecture-decisions.md`)
   - **MUST** be recorded IMMEDIATELY when made
   - **MUST** cross-reference `[REQ-*]` tokens
3. **Implementation Decisions** - with `[IMPL-*]` tokens (in `implementation-decisions.md`)
   - **MUST** be recorded IMMEDIATELY when made
   - **MUST** cross-reference both `[ARCH-*]` and `[REQ-*]` tokens
4. **Semantic Token Registry** - maintained in `semantic-tokens.yaml`
   - **MUST** be updated immediately when creating new tokens
   - Provides structured token metadata (type, status, cross-references, source index)
5. **Task Planning** - maintained in `tasks.md`
   - **MUST** be updated when planning new work or completing tasks

