#!/usr/bin/env bash
#
# copy_files.sh
#
# Copies the STDD template files from the directory containing this script
# into a target project's `stdd/` directory.
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
mkdir -p "${STDD_DIR}"

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