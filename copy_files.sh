#!/usr/bin/env bash
#
# copy_files.sh
#
# Copies the STDD template files from the directory containing this script
# into a target project's `stdd/` directory.
#
# Creates:
#   - Base files (.cursorrules, AGENTS.md, ai-principles.md) in project root
#   - Template files (requirements.md, etc.) in stdd/
#   - implementation-decisions/ directory in stdd/ with example detail files
#   - Migration guide for converting monolithic implementation-decisions files
#
# Designed for macOS (Bash 3.2+) and Ubuntu (Bash 5.x+).
#
# Usage:
#   ./copy_files.sh /path/to/project
#   ./copy_files.sh            # copies into the current working directory

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_PROJECT_DIR="${1:-$(pwd)}"

if [[ ! -d "${TARGET_PROJECT_DIR}" ]]; then
  echo "Target project directory does not exist: ${TARGET_PROJECT_DIR}" >&2
  exit 1
fi

STDD_DIR="${TARGET_PROJECT_DIR}/stdd"
IMPL_DECISIONS_DIR="${STDD_DIR}/implementation-decisions"
mkdir -p "${STDD_DIR}"
mkdir -p "${IMPL_DECISIONS_DIR}"

BASE_FILES=(
  ".cursorrules"
  "AGENTS.md"
  "ai-principles.md"
)

for template in "${BASE_FILES[@]}"; do
  src="${SCRIPT_DIR}/${template}"
  dest="${TARGET_PROJECT_DIR}/${template}"

  if [[ ! -f "${src}" ]]; then
    echo "Missing base file: ${src}" >&2
    exit 1
  fi

  if [[ ! -f "${dest}" ]]; then
    cp -p "${src}" "${dest}"
  fi
done

echo "Copied ${#BASE_FILES[@]} base files into ${TARGET_PROJECT_DIR}."

TEMPLATE_FILES=(
  "requirements.template.md"
  "architecture-decisions.template.md"
  "implementation-decisions.template.md"
  "processes.template.md"
  "semantic-tokens.template.md"
  "tasks.template.md"
)

for template in "${TEMPLATE_FILES[@]}"; do
  src="${SCRIPT_DIR}/${template}"
  dest="${STDD_DIR}/${template%.template.md}.md"

  if [[ ! -f "${src}" ]]; then
    echo "Missing template file: ${src}" >&2
    exit 1
  fi

  if [[ ! -f "${dest}" ]]; then
    cp -p "${src}" "${dest}"
  fi
done

echo "Copied ${#TEMPLATE_FILES[@]} template files into ${STDD_DIR}."

# Copy implementation decision detail file examples
IMPL_TEMPLATE_DIR="${SCRIPT_DIR}/implementation-decisions.template"
if [[ -d "${IMPL_TEMPLATE_DIR}" ]]; then
  impl_count=0
  for detail_file in "${IMPL_TEMPLATE_DIR}"/*.md; do
    if [[ -f "${detail_file}" ]]; then
      filename="$(basename "${detail_file}")"
      dest="${IMPL_DECISIONS_DIR}/${filename}"
      if [[ ! -f "${dest}" ]]; then
        cp -p "${detail_file}" "${dest}"
        ((impl_count++)) || true
      fi
    fi
  done
  if [[ ${impl_count} -gt 0 ]]; then
    echo "Copied ${impl_count} implementation decision example(s) into ${IMPL_DECISIONS_DIR}."
  fi
fi

# Copy migration guide (reference document)
MIGRATION_GUIDE="${SCRIPT_DIR}/migrate-implementation-decisions.md"
MIGRATION_DEST="${STDD_DIR}/migrate-implementation-decisions.md"
if [[ -f "${MIGRATION_GUIDE}" && ! -f "${MIGRATION_DEST}" ]]; then
  cp -p "${MIGRATION_GUIDE}" "${MIGRATION_DEST}"
  echo "Copied migration guide into ${STDD_DIR}."
fi