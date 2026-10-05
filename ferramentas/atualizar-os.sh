#!/usr/bin/env bash
set -euo pipefail

# Atualiza um OS Head de IA já em uso a partir DESTA pasta (a versão nova).
#
# Uso (rodar de dentro da pasta da versão nova):
#   bash ferramentas/atualizar-os.sh "<pasta-do-seu-os>"            # só mostra o plano
#   bash ferramentas/atualizar-os.sh "<pasta-do-seu-os>" --aplicar  # aplica
#
# Troca só arquivos do PRODUTO, um a um. Nunca toca nos seus dados:
#   0-eu/ empresa/ conhecimento/ decisoes/ saidas/ memoria.md conexoes.md dados/ entrada/
#   projetos/ (exceto README) _inbox/ (exceto README) rotinas/ (exceto modelos e README)
#   conexoes/ (exceto MODELO.md) skills/minhas/
# Skills que VOCÊ criou (em skills/os/, .claude/skills/ ou .agents/skills/) são resgatadas
# para skills/minhas/. Arquivos extras seus dentro de pastas do produto ficam onde estão.
# Todo arquivo do produto que for trocado é COPIADO antes para _arquivo/atualizacao-<data>/ e sobrescrito no lugar.

NEW_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if command -v shasum >/dev/null 2>&1; then sha() { shasum -a 256 "$@"; }
else sha() { sha256sum "$@"; }
fi

if [[ $# -lt 1 ]]; then
  echo "Uso: bash ferramentas/atualizar-os.sh \"<pasta-do-seu-os>\" [--aplicar]" >&2
  exit 2
fi

TARGET="$(cd "$1" 2>/dev/null && pwd)" || { echo "ERRO: pasta não encontrada: $1" >&2; exit 1; }
APPLY=0
[[ "${2:-}" == "--aplicar" ]] && APPLY=1

[[ "$TARGET" != "$NEW_ROOT" ]] || { echo "ERRO: a pasta do seu OS é a mesma da versão nova. Descompacte a versão nova em outro lugar." >&2; exit 1; }
[[ -f "$TARGET/memoria.md" && -f "$TARGET/AGENTS.md" ]] || { echo "ERRO: $TARGET não parece um OS Head de IA (faltam memoria.md/AGENTS.md)." >&2; exit 1; }
[[ -f "$NEW_ROOT/VERSAO.md" && -d "$NEW_ROOT/skills/os" ]] || { echo "ERRO: esta pasta não é um pacote do OS Head de IA." >&2; exit 1; }

version_of() { grep -m1 -E '^- versão:' "$1/VERSAO.md" 2>/dev/null | sed -E 's/.*`([^`]+)`.*/\1/' || true; }
OLD_V="$(version_of "$TARGET")"; NEW_V="$(version_of "$NEW_ROOT")"
echo "OS Head de IA — atualização"
echo "Seu OS:      $TARGET (versão ${OLD_V:-desconhecida})"
echo "Versão nova: $NEW_ROOT (versão ${NEW_V:-desconhecida})"
echo

# Toda skill que já veio no pacote, em qualquer versão (0.3 a 0.6).
KNOWN_PRODUCT_SKILLS=" iniciar registrar-projeto ingerir consultar sessao conectar mapear-fontes search-connectors briefing-manha criar-rotina fechar-semana montar-semana design-system atualizar-os conectar-treg modo-publico "
is_product_skill() { [[ "$KNOWN_PRODUCT_SKILLS" == *" $1 "* || -d "$NEW_ROOT/skills/os/$1" ]]; }

PRODUCT_DIRS=(skills/os ferramentas guias squads dados-demo exercicios rotinas/modelos)
PRODUCT_FILES=(
  AGENTS.md CLAUDE.md README.md VERSAO.md COMANDOS.md COMECE-AQUI.md CHECKLIST-ACEITE.md
  GUIA-COMPLETO-DO-OS.md GUIA-COMPLETO-DO-OS.pdf GUIA-DO-ALUNO.md GUIA-INSTALACAO.md GUIA-MONITORIA.md
  .gitignore .env.example
  skills/README.md skills/sync-skills.sh skills/sync-skills.ps1 skills/minhas/README.md
  rotinas/README.md projetos/README.md _inbox/README.md conexoes/MODELO.md
)
USER_PATHS=(0-eu empresa conhecimento decisoes saidas projetos _inbox rotinas conexoes dados entrada memoria.md conexoes.md)

fingerprint() {
  (cd "$TARGET" && for p in "${USER_PATHS[@]}"; do
     [[ -e "$p" ]] || continue
     find "$p" -type f ! -name '.DS_Store' \
       ! -path 'projetos/README.md' ! -path '_inbox/README.md' ! -path 'rotinas/README.md' \
       ! -path 'rotinas/modelos/*' ! -path 'conexoes/MODELO.md' -print
   done | LC_ALL=C sort | while IFS= read -r f; do
     printf '%s  %s\n' "$(sha "$f" | cut -d' ' -f1)" "$f"
   done) | sha | cut -d' ' -f1
}

# 1) Skills do usuário a resgatar.
RESCUE_SRC=(); RESCUE_NAME=()
add_rescue() {
  local src="$1" name="$2" i
  [[ -d "$TARGET/skills/minhas/$name" ]] && return 0
  for i in "${RESCUE_NAME[@]+"${RESCUE_NAME[@]}"}"; do [[ "$i" == "$name" ]] && return 0; done
  RESCUE_SRC+=("$src"); RESCUE_NAME+=("$name")
}
if [[ -d "$TARGET/skills/os" ]]; then
  for sd in "$TARGET"/skills/os/*; do
    [[ -d "$sd" ]] || continue
    n="$(basename "$sd")"; is_product_skill "$n" || add_rescue "$sd" "$n"
  done
fi
for gen in .claude/skills .agents/skills; do
  [[ -d "$TARGET/$gen" ]] || continue
  for sd in "$TARGET/$gen"/*; do
    [[ -d "$sd" && -f "$sd/SKILL.md" ]] || continue
    n="$(basename "$sd")"; is_product_skill "$n" || add_rescue "$sd" "$n"
  done
done

# 2) Arquivos do produto que mudam (comparação arquivo a arquivo).
CHANGED=(); EXTRAS=()
for d in "${PRODUCT_DIRS[@]}"; do
  [[ -d "$NEW_ROOT/$d" ]] || continue
  while IFS= read -r rel; do
    if [[ ! -f "$TARGET/$rel" ]] || ! cmp -s "$NEW_ROOT/$rel" "$TARGET/$rel"; then CHANGED+=("$rel"); fi
  done < <(cd "$NEW_ROOT" && find "$d" -type f ! -name '.DS_Store' | LC_ALL=C sort)
  if [[ -d "$TARGET/$d" ]]; then
    while IFS= read -r rel; do
      [[ -f "$NEW_ROOT/$rel" ]] && continue
      if [[ "$d" == "skills/os" ]]; then
        n="$(echo "$rel" | cut -d/ -f3)"; is_product_skill "$n" || continue
      fi
      EXTRAS+=("$rel")
    done < <(cd "$TARGET" && find "$d" -type f ! -name '.DS_Store' | LC_ALL=C sort)
  fi
done
for f in "${PRODUCT_FILES[@]}"; do
  [[ -f "$NEW_ROOT/$f" ]] || continue
  if [[ ! -f "$TARGET/$f" ]] || ! cmp -s "$NEW_ROOT/$f" "$TARGET/$f"; then CHANGED+=("$f"); fi
done

if [[ ${#CHANGED[@]} -eq 0 && ${#RESCUE_NAME[@]} -eq 0 ]]; then
  echo "Nada a atualizar: seu OS já está igual à versão nova."
  exit 0
fi

echo "Plano:"
echo "  Arquivos do produto novos ou atualizados: ${#CHANGED[@]}"
if [[ ${#CHANGED[@]} -gt 0 ]]; then
  printf '%s\n' "${CHANGED[@]}" | awk -F/ '{ if (NF<=2) print $1; else print $1"/"$2 }' | LC_ALL=C sort -u | sed 's/^/    - /'
fi
if [[ ${#RESCUE_NAME[@]} -gt 0 ]]; then
  echo "  Skills SUAS que serão guardadas em skills/minhas/: ${RESCUE_NAME[*]}"
fi
if [[ ${#EXTRAS[@]} -gt 0 ]]; then
  echo "  Arquivos que não existem na versão nova e ficam onde estão (não são apagados):"
  printf '    - %s\n' "${EXTRAS[@]}"
fi
echo
echo "  Não serão tocados: ${USER_PATHS[*]} skills/minhas"
for f in AGENTS.md CLAUDE.md; do
  if [[ -f "$TARGET/$f" ]] && ! cmp -s "$NEW_ROOT/$f" "$TARGET/$f"; then
    echo
    echo "— Diferença em $f (linhas que saem com '-', que entram com '+'):"
    diff -u "$TARGET/$f" "$NEW_ROOT/$f" | sed -n '3,400p' || true
  fi
done

if [[ $APPLY -eq 0 ]]; then
  echo
  echo "Nada foi alterado. Para aplicar: bash ferramentas/atualizar-os.sh \"$TARGET\" --aplicar"
  exit 0
fi

BEFORE="$(fingerprint)"
STAMP="$(date +%Y-%m-%d-%H%M%S)"
BACKUP="$TARGET/_arquivo/atualizacao-$STAMP"
mkdir -p "$BACKUP"

# Resgate primeiro (cópia); a origem em skills/os/ sai do caminho do produto (vai para o backup).
mkdir -p "$TARGET/skills/minhas"
if [[ ${#RESCUE_NAME[@]} -gt 0 ]]; then
  for i in "${!RESCUE_NAME[@]}"; do
    cp -R "${RESCUE_SRC[$i]}" "$TARGET/skills/minhas/${RESCUE_NAME[$i]}"
    if [[ "${RESCUE_SRC[$i]}" == "$TARGET/skills/os/"* ]]; then
      mkdir -p "$BACKUP/skills/os"
      mv "${RESCUE_SRC[$i]}" "$BACKUP/skills/os/${RESCUE_NAME[$i]}"
    fi
  done
fi

if [[ ${#CHANGED[@]} -gt 0 ]]; then
  for rel in "${CHANGED[@]}"; do
    # copia o antigo para o backup e sobrescreve NO LUGAR (sem apagar e recriar:
    # em pasta sincronizada com iCloud/OneDrive isso gera cópias de conflito "nome 2")
    if [[ -e "$TARGET/$rel" ]]; then
      mkdir -p "$BACKUP/$(dirname "$rel")"
      cp -p "$TARGET/$rel" "$BACKUP/$rel"
    fi
    mkdir -p "$TARGET/$(dirname "$rel")"
    cat "$NEW_ROOT/$rel" > "$TARGET/$rel"
    [[ -x "$NEW_ROOT/$rel" ]] && chmod +x "$TARGET/$rel"
  done
fi
chmod +x "$TARGET"/skills/*.sh "$TARGET"/ferramentas/*.sh 2>/dev/null || true

AFTER="$(fingerprint)"
if [[ "$BEFORE" != "$AFTER" ]]; then
  echo "ERRO: seus dados mudaram durante a atualização. Nada foi apagado; a cópia do produto antigo está em $BACKUP." >&2
  exit 1
fi

echo
echo "OK: seus dados estão intactos (impressão digital $BEFORE)."
echo "Arquivos antigos do produto guardados em: _arquivo/atualizacao-$STAMP/"
if [[ ${#RESCUE_NAME[@]} -gt 0 ]]; then
  echo "Skills suas guardadas em skills/minhas/: ${RESCUE_NAME[*]}"
fi
bash "$TARGET/skills/sync-skills.sh"
bash "$TARGET/ferramentas/doctor.sh" || true
echo
echo "OK: OS atualizado para a versão ${NEW_V:-nova}."
echo "Feche esta conversa e abra uma nova na pasta do OS: as skills novas só aparecem numa conversa nova."
