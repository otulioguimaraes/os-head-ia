#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

REQUIRED=(
  README.md COMECE-AQUI.md AGENTS.md CLAUDE.md COMANDOS.md memoria.md
  0-eu/perfil.md 0-eu/prioridades.md projetos/README.md
  conhecimento/index.md conhecimento/log.md conhecimento/processados.md
  decisoes/log.md conexoes.md rotinas/modelos/contrato.md saidas/RETOMAR.md
  skills/sync-skills.sh ferramentas/bootstrap.sh ferramentas/bootstrap.ps1
  ferramentas/doctor.sh ferramentas/doctor.ps1 ferramentas/verificar-template-limpo.sh
)

for item in "${REQUIRED[@]}"; do
  [[ -f "$OS_ROOT/$item" ]] || { echo "ERRO: arquivo obrigatório ausente: $item" >&2; exit 1; }
done

EXPECTED_SKILLS=(iniciar registrar-projeto ingerir consultar sessao conectar mapear-fontes search-connectors briefing-manha criar-rotina fechar-semana montar-semana design-system)
for skill in "${EXPECTED_SKILLS[@]}"; do
  [[ -f "$OS_ROOT/skills/os/$skill/SKILL.md" ]] || { echo "ERRO: skill ausente: $skill" >&2; exit 1; }
done

SQUAD_REQUIRED=(
  squads/brand-system-builder/README.md
  squads/brand-system-builder/PLAYBOOK.md
  squads/brand-system-builder/squad.yaml
  squads/brand-system-builder/workflows/brand-system-pipeline.yaml
  squads/brand-system-builder/agents/brand-strategist.yaml
  squads/brand-system-builder/agents/visual-designer.yaml
  squads/brand-system-builder/agents/component-builder.yaml
  squads/brand-system-builder/agents/brand-assembler.yaml
)
for item in "${SQUAD_REQUIRED[@]}"; do
  [[ -f "$OS_ROOT/$item" ]] || { echo "ERRO: arquivo obrigatório do squad ausente: $item" >&2; exit 1; }
done

if grep -RIl --exclude-dir=dist --exclude='verificar-template.sh' '\[TODO' "$OS_ROOT" | grep -q .; then
  echo "ERRO: há marcadores TODO de template." >&2
  exit 1
fi

if grep -RIlE --exclude-dir=dist --exclude='verificar-template.sh' '/Users/[^/]+/|[A-Za-z]:\\Users\\[^\\]+' "$OS_ROOT" | grep -q .; then
  echo "ERRO: há caminho pessoal no pacote." >&2
  exit 1
fi

if find "$OS_ROOT" -type f \( -name '*.pyc' -o -path '*/__pycache__/*' \) -not -path '*/dist/*' -print -quit | grep -q .; then
  echo "ERRO: há cache Python no pacote." >&2
  exit 1
fi

bash -n "$OS_ROOT/skills/sync-skills.sh"
bash -n "$OS_ROOT/ferramentas/bootstrap.sh"
bash -n "$OS_ROOT/ferramentas/doctor.sh"
bash -n "$OS_ROOT/ferramentas/status.sh"
bash -n "$OS_ROOT/ferramentas/verificar-template-limpo.sh"

"$OS_ROOT/ferramentas/doctor.sh"
"$OS_ROOT/ferramentas/verificar-template-limpo.sh"
echo "OK: template estruturalmente válido."
