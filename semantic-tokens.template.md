# Semantic Tokens Directory

**STDD Methodology Version**: 1.0.1

## Overview
This document serves as the **central directory/registry** for all semantic tokens used in the project. Semantic tokens (`[REQ:*]`, `[ARCH:*]`, `[IMPL:*]`) provide a consistent vocabulary and traceability mechanism that ties together all documentation, code, and tests.

**For detailed information about tokens, see:**
- **Requirements tokens**: See `requirements.md` for full descriptions, rationale, satisfaction criteria, and validation criteria
- **Architecture tokens**: See `architecture-decisions.md` for architectural decisions, rationale, and alternatives considered
- **Implementation tokens**: See `implementation-decisions.md` for implementation details, code structures, and algorithms

## Token Format

```
[TYPE:IDENTIFIER]
```

## Token Types

- `[REQ:*]` - Requirements (functional/non-functional) - **The source of intent**
- `[ARCH:*]` - Architecture decisions - **High-level design choices that preserve intent**
- `[IMPL:*]` - Implementation decisions - **Low-level choices that preserve intent**
- `[TEST:*]` - Test specifications - **Validation of intent**

## Token Naming Convention

- Use UPPER_SNAKE_CASE for identifiers
- Be descriptive but concise
- Example: `[REQ:DUPLICATE_PREVENTION]` not `[REQ:DP]`

## Cross-Reference Format

When referencing other tokens:

```markdown
[IMPL:EXAMPLE] Description [ARCH:DESIGN] [REQ:REQUIREMENT]
```

## Requirements Tokens Registry

**📖 Full details**: See `requirements.md`

### Immutable Requirements

### Core Functional Requirements
- `[REQ:STDD_SETUP]` - STDD methodology setup
- `[REQ:EXAMPLE_FEATURE]` - Example feature requirement
- Add your requirements tokens here

### Non-Functional Requirements
- `[REQ:PERFORMANCE]` - Performance requirements
- `[REQ:RELIABILITY]` - Reliability requirements
- `[REQ:MAINTAINABILITY]` - Maintainability requirements
- `[REQ:USABILITY]` - Usability requirements

## Architecture Tokens Registry

**📖 Full details**: See `architecture-decisions.md`

- `[ARCH:LANGUAGE_SELECTION]` - Language and runtime selection
- `[ARCH:PROJECT_STRUCTURE]` - Project structure decision
- `[ARCH:STDD_STRUCTURE]` - STDD project structure [REQ:STDD_SETUP]
- `[ARCH:EXAMPLE_DECISION]` - Example architecture decision [REQ:EXAMPLE_FEATURE]
- Add your architecture tokens here

## Implementation Tokens Registry

**📖 Full details**: See `implementation-decisions.md`

- `[IMPL:CONFIG_STRUCT]` - Configuration structure implementation [ARCH:CONFIG_STRUCTURE] [REQ:CONFIGURATION]
- `[IMPL:STDD_FILES]` - STDD file creation [ARCH:STDD_STRUCTURE] [REQ:STDD_SETUP]
- `[IMPL:EXAMPLE_IMPLEMENTATION]` - Example implementation [ARCH:EXAMPLE_DECISION] [REQ:EXAMPLE_FEATURE]
- Add your implementation tokens here

## Token Relationships

### Hierarchical Relationships
- `[REQ:PARENT_FEATURE]` contains `[REQ:SUB_FEATURE_1]`, `[REQ:SUB_FEATURE_2]`
- `[ARCH:FEATURE]` includes `[ARCH:COMPONENT_1]`, `[ARCH:COMPONENT_2]`

### Flow Relationships
- `[REQ:FEATURE]` → `[ARCH:DESIGN]` → `[IMPL:IMPLEMENTATION]` → Code + Tests

### Dependency Relationships
- `[IMPL:FEATURE]` depends on `[ARCH:DESIGN]` and `[REQ:FEATURE]`
- `[ARCH:DESIGN]` depends on `[REQ:FEATURE]`

## Usage Examples

### In Code Comments
```[your-language]
// [REQ:EXAMPLE_FEATURE] Implementation of example feature
// [IMPL:EXAMPLE_IMPLEMENTATION] [ARCH:EXAMPLE_DECISION] [REQ:EXAMPLE_FEATURE]
function exampleFunction() {
    // ...
}
```

### In Tests
```[your-language]
// Test validates [REQ:EXAMPLE_FEATURE] is met
func TestExampleFeature_REQ_EXAMPLE_FEATURE(t *testing.T) {
    // ...
}
```

### In Documentation
```markdown
The feature uses [ARCH:ARCHITECTURE_NAME] to fulfill [REQ:FEATURE_NAME].
Implementation details are documented in [IMPL:IMPLEMENTATION_NAME].
```

## Token Validation Guidelines

### Cross-Layer Token Consistency

Every feature must have proper token coverage across all layers:

1. **Requirements Layer**: Feature must have `[REQ:*]` token in `requirements.md`
2. **Architecture Layer**: Architecture decisions must have `[ARCH:*]` tokens in `architecture-decisions.md`
3. **Implementation Layer**: Implementation must have `[IMPL:*]` tokens in code comments
4. **Test Layer**: Tests must reference `[REQ:*]` tokens in test names/comments
5. **Documentation Layer**: All documentation must cross-reference tokens consistently

### Token Format Validation

1. **Token Format**: Must follow `[TYPE:IDENTIFIER]` pattern exactly
2. **Token Types**: Must use valid types (`REQ`, `ARCH`, `IMPL`, `TEST`)
3. **Identifier Format**: Must use UPPER_SNAKE_CASE
4. **Cross-References**: Implementation tokens must reference architecture and requirement tokens

### Token Traceability Validation

1. Every requirement in `requirements.md` must have corresponding implementation tokens
2. Every architecture decision must have corresponding implementation tokens
3. Every test must link to specific requirements via `[REQ:*]` tokens
4. All tokens must be discoverable through automated validation

## Token Creation Requirements

When implementing features:
1. **ALWAYS** create `[REQ:*]` token in `requirements.md` first
2. **ALWAYS** create `[ARCH:*]` token in `architecture-decisions.md` for design decisions
3. **ALWAYS** add `[IMPL:*]` tokens to code comments
4. **ALWAYS** reference `[REQ:*]` tokens in test names/comments
5. **ALWAYS** update `semantic-tokens.md` registry when creating new tokens
