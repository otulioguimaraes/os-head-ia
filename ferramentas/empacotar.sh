#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIST_DIR="$OS_ROOT/dist"
PACKAGE_DIR_NAME="os-head-ia-v0"
RELEASE_NAME="os-head-ia-v0.5"
STAGING_DIR="$(mktemp -d)"
trap 'rm -rf -- "$STAGING_DIR"' EXIT

"$OS_ROOT/ferramentas/verificar-template.sh"

mkdir -p "$STAGING_DIR/$PACKAGE_DIR_NAME"
find "$OS_ROOT" -mindepth 1 -maxdepth 1 \
  ! -name dist ! -name .git ! -name .agents ! -name .claude \
  -exec cp -R {} "$STAGING_DIR/$PACKAGE_DIR_NAME/" \;

# As skills canônicas vivem em skills/os/, mas os clientes descobrem os
# atalhos de projeto nas pastas abaixo. Gere cópias novas dentro do pacote para
# que /iniciar funcione já na primeira abertura, sem bootstrap manual.
mkdir -p \
  "$STAGING_DIR/$PACKAGE_DIR_NAME/.agents/skills" \
  "$STAGING_DIR/$PACKAGE_DIR_NAME/.claude/skills"
cp -R "$OS_ROOT/skills/os/." "$STAGING_DIR/$PACKAGE_DIR_NAME/.agents/skills/"
cp -R "$OS_ROOT/skills/os/." "$STAGING_DIR/$PACKAGE_DIR_NAME/.claude/skills/"

for target in .agents/skills .claude/skills; do
  COUNT="$(find "$STAGING_DIR/$PACKAGE_DIR_NAME/$target" -mindepth 2 -maxdepth 2 -name SKILL.md -type f | wc -l | tr -d ' ')"
  [[ "$COUNT" -eq 13 ]] || { echo "ERRO: pacote teria $COUNT skills em $target; esperava 13." >&2; exit 1; }
  diff -qr "$OS_ROOT/skills/os" "$STAGING_DIR/$PACKAGE_DIR_NAME/$target" >/dev/null || {
    echo "ERRO: skills empacotadas em $target estão dessincronizadas." >&2
    exit 1
  }
done

mkdir -p "$DIST_DIR"
ARCHIVE="$DIST_DIR/$RELEASE_NAME.zip"
rm -f -- "$ARCHIVE" "$ARCHIVE.sha256"

if command -v zip >/dev/null 2>&1; then
  (cd "$STAGING_DIR" && zip -qr "$ARCHIVE" "$PACKAGE_DIR_NAME")
else
  echo "ERRO: utilitário zip não encontrado." >&2
  exit 1
fi

if command -v shasum >/dev/null 2>&1; then
  (cd "$DIST_DIR" && shasum -a 256 "$RELEASE_NAME.zip" > "$RELEASE_NAME.zip.sha256")
elif command -v sha256sum >/dev/null 2>&1; then
  (cd "$DIST_DIR" && sha256sum "$RELEASE_NAME.zip" > "$RELEASE_NAME.zip.sha256")
fi

unzip -tq "$ARCHIVE"
echo "OK: pacote criado em $ARCHIVE"
