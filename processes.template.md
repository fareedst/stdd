# STDD Processes

**STDD Methodology Version**: 1.4.0

Process documentation is the missing link that keeps tooling, rituals, and expectations traceable back to requirements. This guide defines how to record repeatable processes with semantic tokens so that every operational step you take is measurable, auditable, and associated with the intent that drove it.

## Process Tokens

Introduce `[PROC-*]` tokens whenever you describe how work happens.
Each token declares the process, its scope, and the requirements it serves. Because processes often span multiple artifacts, each entry should refer to:

- **Requirements** (`[REQ-*]`) to show whose intent the process satisfies
- **Architecture** (`[ARCH-*]`) or **Implementation** (`[IMPL-*]`) decisions that depend on the process outcome
- **Tests** (`[TEST-*]`) or other validation steps triggered by the process

Process entries become first-class trace nodes that explain **how** to survey, build, test, deploy, and otherwise steward the requirements themselves.

## Process Entry Template

Use the structure below for every process you document. Each entry should be kept current, reference the controlling requirements, and mention the deliverables or artifacts it produces.

### `[PROC-PROCESS_NAME]`
- **Purpose** — Describe the problem or requirement this process satisfies, ideally referencing a `[REQ-*]` token.
- **Scope** — Describe the boundaries of the process (teams, code areas, environments, or lifecycle phases).
- **Token references** — List `[REQ-*]`, `[ARCH-*]`, `[IMPL-*]`, or `[TEST-*]` tokens that the process continuously touches.
- **Status** — Active, deprecated, or scheduled for automation.

#### Core Activities
1. **Survey the Project**
   - Identify the existing intent (documentation, tokens, diagrams) tied to the requirement.
   - Capture discovery artifacts (notes, system maps, dependency lists) labeled with `[PROC-PROJECT_SURVEY]` or a more specific process token.
2. **Build Work**
   - Describe how to prepare the build environment, dependencies, and packages.
   - Reference architecture or implementation tokens that the process must observe before running the build.
3. **Test Work**
   - List the mandatory validation suites, acceptance tests, or checkpoints.
   - Include examples of test names that reference the requirement token (e.g., `TestFoo_REQ_BAR`).
4. **Deploy Work**
   - Outline the deployment targets, release artifacts, and approvals required.
   - Mention any CI/CD pipelines or configuration tokens that guarantee traceability.
5. **Requirements Stewardship**
   - State how the process collects feedback, updates requirements, and revalidates tokens.
   - Explain how this process keeps the `[REQ-*]` token fresh (review cadence, stakeholders, reporting).

#### Artifacts & Metrics
- **Artifacts** — Document the files, checklists, or dashboards produced during the process.
- **Success Metrics** — Name how you know the process satisfied the requirement (e.g., updated token table, green builds, automated audits).

### Example: `[PROC-PROJECT_SURVEY_AND_SETUP]`
- **Purpose** — Capture the context for `[REQ-STDD_SETUP]` before any new feature work.
- **Scope** — Applied to every new module or team onboarding cycle.
- **Token references** — `[REQ-STDD_SETUP]`, `[ARCH-STDD_STRUCTURE]`, `[IMPL-STDD_FILES]`.
- **Status** — Active.

#### Core Activities
1. **Survey**
   - Read `STDD.md`, `semantic-tokens.yaml`, `semantic-tokens.md`, and recent requirements to understand intent.
   - Tag findings with `[PROC-PROJECT_SURVEY_AND_SETUP]` and record them in the project knowledge base.
2. **Build**
   - Confirm required toolchains (language runtime, STDD tooling) are installed and share the list on the onboarding checklist.
   - Validate any `[ARCH-*]` constraints (folder layout, manifests) before manipulating files.
3. **Test**
   - Run smoke tests that include `[REQ-MODULE_VALIDATION]` to prove tracing works for a new module.
   - Check that tokens surfaced during survey show up in test names and code comments.
4. **Deploy**
   - Ensure deployment documentation references the same requirement tokens and that automated jobs run at least once to prove the configuration.
5. **Requirements Stewardship**
   - Record missing `[REQ-*]` tokens discovered during the survey and assign owners to author them.
   - Tag conclusions in the knowledge base with the `[PROC-PROJECT_SURVEY_AND_SETUP]` token so future reviews can trace the reasoning.

#### Artifacts & Metrics
- **Artifacts** — Onboarding checklist, environment matrix, token discovery log.
- **Success Metrics** — Every new module has `[REQ-*]` tokens defined, token registry updated, and build/test/deploy pipelines run at least once.

---

## `[PROC-YAML_DB_OPERATIONS]` YAML Database Operations

### Purpose
Provides succinct guidance for reading, writing, querying, and validating the YAML index files (`requirements.yaml`, `architecture-decisions.yaml`, `implementation-decisions.yaml`, `semantic-tokens.yaml`).

### Scope
Applies to all STDD YAML index files in the `stdd/` directory.

### Token references
- `[REQ-STDD_SETUP]` — YAML indexes are part of STDD methodology setup
- `[ARCH-STDD_STRUCTURE]` — YAML indexes are part of project structure

### Status
Active

### Core Activities

#### 1. Appending a New Record

**Manual Append:**
1. Open the YAML file (e.g., `stdd/requirements.yaml`)
2. Scroll to the bottom and find the commented template block
3. Copy the template block
4. Paste it at the end with a blank line before it
5. Replace the token identifier (e.g., `REQ-IDENTIFIER` → `REQ-NEW_FEATURE`)
6. Fill in all fields (name, category, priority, status, rationale, etc.)
7. Update the `detail_file` path
8. Save the file

**Scripted Append:**
```bash
# Append a new requirement (v1.5.0 schema)
cat >> stdd/requirements.yaml << 'EOF'

REQ-NEW_FEATURE:
  name: New Feature Name
  category: Functional
  priority: P1
  status: "Planned"
  rationale:
    why: "Primary reason for this requirement"
    problems_solved:
      - "Problem 1"
    benefits:
      - "Benefit 1"
  satisfaction_criteria:
    - criterion: "Criterion description"
      metric: "Measurable target"
  validation_criteria:
    - method: "Unit tests"
      coverage: "All core functions"
  traceability:
    architecture:
      - ARCH-NEW_FEATURE
    implementation:
      - IMPL-NEW_FEATURE
    tests:
      - testNewFeature_REQ_NEW_FEATURE
    code_annotations:
      - REQ-NEW_FEATURE
  related_requirements:
    depends_on: []
    related_to: []
    supersedes: []
  detail_file: requirements/REQ-NEW_FEATURE.md
  metadata:
    created:
      date: 2026-02-06
      author: "Your Name"
    last_updated:
      date: 2026-02-06
      author: "Your Name"
      reason: "Initial creation"
    last_validated:
      date: 2026-02-06
      validator: "Your Name"
      result: "pass"
EOF
```

#### 2. Reading and Querying Records

**Read Entire File:**
```bash
cat stdd/requirements.yaml
```

**Read Specific Record (with yq):**
```bash
# Install yq if not already: https://github.com/mikefarah/yq
yq '.REQ-STDD_SETUP' stdd/requirements.yaml
yq '.["ARCH-STDD_STRUCTURE"]' stdd/architecture-decisions.yaml
```

**Read Specific Record (with grep):**
```bash
# Quick lookup for humans
grep -A 30 '^REQ-STDD_SETUP:' stdd/requirements.yaml
grep -A 30 '^ARCH-STDD_STRUCTURE:' stdd/architecture-decisions.yaml
```

**Filter by Status:**
```bash
# List all active architecture decisions
yq 'to_entries | map(select(.value.status == "Active")) | from_entries' stdd/architecture-decisions.yaml

# List all implemented requirements
yq 'to_entries | map(select(.value.status == "Implemented")) | from_entries' stdd/requirements.yaml
```

**Query with Python:**
```python
import yaml

# Read YAML file
with open('stdd/requirements.yaml', 'r') as f:
    requirements = yaml.safe_load(f)

# Access specific requirement
req = requirements['REQ-STDD_SETUP']
print(f"Name: {req['name']}")
print(f"Status: {req['status']}")
print(f"Priority: {req['priority']}")

# Filter by status
implemented = {k: v for k, v in requirements.items() 
               if v.get('status') == 'Implemented'}
```

**Query with jq (alternative to yq):**
```bash
# Convert YAML to JSON first, then use jq
yq -o=json '.' stdd/requirements.yaml | jq '.["REQ-STDD_SETUP"]'
```

#### 3. Updating an Existing Record

**Best Practice:** Edit the YAML file directly in your editor. YAML preserves formatting and comments better than programmatic edits.

**Programmatic Update (Python):**
```python
import yaml

# Read
with open('stdd/requirements.yaml', 'r') as f:
    data = yaml.safe_load(f)

# Update
data['REQ-STDD_SETUP']['last_updated'] = '2026-02-06'
data['REQ-STDD_SETUP']['last_validator'] = 'New Validator'

# Write back
with open('stdd/requirements.yaml', 'w') as f:
    yaml.dump(data, f, default_flow_style=False, sort_keys=False)
```

**Note:** Programmatic updates may lose formatting and comments. Manual editing is recommended for YAML files.

#### 4. Validating YAML Syntax

**Validate with yq:**
```bash
yq '.' stdd/requirements.yaml > /dev/null && echo "✅ Valid YAML" || echo "❌ Invalid YAML"
yq '.' stdd/architecture-decisions.yaml > /dev/null && echo "✅ Valid YAML" || echo "❌ Invalid YAML"
yq '.' stdd/implementation-decisions.yaml > /dev/null && echo "✅ Valid YAML" || echo "❌ Invalid YAML"
```

**Validate with Python:**
```bash
python3 -c "import yaml, sys; yaml.safe_load(open('stdd/requirements.yaml'))" && echo "✅ Valid" || echo "❌ Invalid"
```

**Validate with yamllint (if installed):**
```bash
yamllint stdd/requirements.yaml
yamllint stdd/architecture-decisions.yaml
yamllint stdd/implementation-decisions.yaml
```

#### 5. Listing All Tokens

**List all requirement tokens:**
```bash
yq 'keys' stdd/requirements.yaml
# or with grep:
grep '^[A-Z].*:$' stdd/requirements.yaml | sed 's/:$//'
```

**List all architecture decision tokens:**
```bash
yq 'keys' stdd/architecture-decisions.yaml
```

**List all implementation decision tokens:**
```bash
yq 'keys' stdd/implementation-decisions.yaml
```

**List all semantic tokens:**
```bash
yq 'keys' stdd/semantic-tokens.yaml
```

**Filter semantic tokens by type:**
```bash
# List all REQ tokens
yq 'to_entries | map(select(.value.type == "REQ")) | from_entries' stdd/semantic-tokens.yaml

# List all ARCH tokens
yq 'to_entries | map(select(.value.type == "ARCH")) | from_entries' stdd/semantic-tokens.yaml

# List all PROC tokens
yq 'to_entries | map(select(.value.type == "PROC")) | from_entries' stdd/semantic-tokens.yaml
```

**Check if a token exists:**
```bash
yq '.["REQ-STDD_SETUP"]' stdd/semantic-tokens.yaml
```

**Get token metadata:**
```bash
# Get token type and status
yq '.REQ-STDD_SETUP | {type: .type, status: .status}' stdd/semantic-tokens.yaml

# Get source index for full details
yq '.REQ-STDD_SETUP.source_index' stdd/semantic-tokens.yaml
```

#### 6. Checking Cross-References (v1.5.0 Schema)

**Find all requirements referenced by an architecture decision:**
```bash
yq '.ARCH-STDD_STRUCTURE.cross_references[]' stdd/architecture-decisions.yaml
```

**Find all architecture/requirement tokens referenced by an implementation:**
```bash
yq '.IMPL-MODULE_VALIDATION.cross_references[]' stdd/implementation-decisions.yaml
```

**Query structured traceability (v1.5.0):**
```bash
# Get architecture dependencies for a requirement
yq '.REQ-STDD_SETUP.traceability.architecture[]' stdd/requirements.yaml

# Get tests for a requirement
yq '.REQ-STDD_SETUP.traceability.tests[]' stdd/requirements.yaml

# Get implementation dependencies for an architecture decision
yq '.ARCH-STDD_STRUCTURE.traceability.implementation[]' stdd/architecture-decisions.yaml

# Get code locations for an implementation
yq '.IMPL-STDD_FILES.code_locations.files[].path' stdd/implementation-decisions.yaml
```

**Query structured content (v1.5.0):**
```bash
# Get satisfaction criteria for a requirement
yq '.REQ-STDD_SETUP.satisfaction_criteria[].criterion' stdd/requirements.yaml

# Get alternatives considered for an architecture decision
yq '.ARCH-STDD_STRUCTURE.alternatives_considered[].name' stdd/architecture-decisions.yaml

# Get implementation approach summary
yq '.IMPL-MODULE_VALIDATION.implementation_approach.summary' stdd/implementation-decisions.yaml

# Get metadata
yq '.REQ-STDD_SETUP.metadata.last_validated.result' stdd/requirements.yaml
```

### Artifacts & Metrics
- **Artifacts**: YAML index files (requirements.yaml, architecture-decisions.yaml, implementation-decisions.yaml, semantic-tokens.yaml)
- **Success Metrics**: YAML files are valid, all records have required fields, cross-references are consistent
