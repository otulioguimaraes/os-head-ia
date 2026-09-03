#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

printf 'OS Head de IA — preparação do primeiro acesso\n\n'
"$OS_ROOT/skills/sync-skills.sh"
"$OS_ROOT/ferramentas/doctor.sh"

printf '\nOK: ambiente local preparado.\n'
printf 'Próximo passo: leia skills/os/iniciar/SKILL.md e inicie o onboarding.\n'
