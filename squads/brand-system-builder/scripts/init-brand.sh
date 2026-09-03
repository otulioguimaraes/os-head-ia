#!/usr/bin/env bash
# init-brand.sh — Scaffold a new brand system project
# Usage: ./init-brand.sh [brand-name]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SQUAD_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$SQUAD_DIR/templates"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}═══════════════════════════════════════════${NC}"
echo -e "${BLUE}  Brand System Builder — Project Init${NC}"
echo -e "${BLUE}═══════════════════════════════════════════${NC}"
echo

# Get brand name
if [ -n "${1:-}" ]; then
  BRAND_NAME="$1"
else
  read -rp "Brand name: " BRAND_NAME
fi

if [ -z "$BRAND_NAME" ]; then
  echo -e "${RED}Error: Brand name is required.${NC}"
  exit 1
fi

# Sanitize for directory name
BRAND_SLUG=$(echo "$BRAND_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
OUTPUT_DIR="brand-output"

echo -e "${YELLOW}Brand:${NC} $BRAND_NAME"
echo -e "${YELLOW}Output:${NC} $OUTPUT_DIR/"
echo

# Create directory structure
echo -e "${GREEN}Creating directory structure...${NC}"

mkdir -p "$OUTPUT_DIR/docs/01-strategy"
mkdir -p "$OUTPUT_DIR/docs/02-identity"
mkdir -p "$OUTPUT_DIR/docs/03-foundations"
mkdir -p "$OUTPUT_DIR/docs/04-components"
mkdir -p "$OUTPUT_DIR/docs/05-delivery"
mkdir -p "$OUTPUT_DIR/tokens"
mkdir -p "$OUTPUT_DIR/preview"
mkdir -p "$OUTPUT_DIR/site"
mkdir -p "$OUTPUT_DIR/mockups"

echo -e "  ${GREEN}✓${NC} docs/ (5 subdirectories)"
echo -e "  ${GREEN}✓${NC} tokens/"
echo -e "  ${GREEN}✓${NC} preview/"
echo -e "  ${GREEN}✓${NC} site/"
echo -e "  ${GREEN}✓${NC} mockups/"

# Copy brand-config template
echo
echo -e "${GREEN}Creating brand-config.yaml...${NC}"

if [ -f "$TEMPLATES_DIR/brand-config-tmpl.yaml" ]; then
  cp "$TEMPLATES_DIR/brand-config-tmpl.yaml" "brand-config.yaml"
  # Replace brand name placeholder
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/^  name: \"\"/  name: \"$BRAND_NAME\"/" "brand-config.yaml"
  else
    sed -i "s/^  name: \"\"/  name: \"$BRAND_NAME\"/" "brand-config.yaml"
  fi
  echo -e "  ${GREEN}✓${NC} brand-config.yaml created with brand name: $BRAND_NAME"
else
  echo -e "  ${YELLOW}⚠${NC} brand-config-tmpl.yaml not found. Creating minimal config..."
  cat > "brand-config.yaml" << EOF
# brand-config.yaml — Single Source of Truth
brand:
  name: "$BRAND_NAME"
  full_name: ""
  tagline: ""
  description: ""
  year: $(date +%Y)
  version: "1.0"
  language: "pt-BR"

  colors:
    primary: ""
    cream: ""
    accent: ""

  typography:
    heading: ""
    body: ""
    mono: ""
EOF
  echo -e "  ${GREEN}✓${NC} Minimal brand-config.yaml created"
fi

# Summary
echo
echo -e "${BLUE}═══════════════════════════════════════════${NC}"
echo -e "${GREEN}Project scaffolded successfully!${NC}"
echo
echo -e "Next steps:"
echo -e "  1. Fill in ${YELLOW}brand-config.yaml${NC} with your brand details"
echo -e "  2. Return to the OS and run:"
echo -e "     ${BLUE}/design-system construir${NC}"
echo -e "${BLUE}═══════════════════════════════════════════${NC}"
