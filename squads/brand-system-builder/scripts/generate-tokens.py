#!/usr/bin/env python3
"""generate-tokens.py — Export design tokens from brand-config.yaml

Reads brand-config.yaml and generates:
- brand-output/tokens/colors.json
- brand-output/tokens/typography.json
- brand-output/tokens/tokens.css

Usage:
    python3 generate-tokens.py [--config brand-config.yaml] [--output brand-output/tokens/]
"""

import json
import sys
import os
from pathlib import Path

try:
    import yaml
except ImportError:
    print("Error: PyYAML required. Install with: pip install pyyaml")
    sys.exit(1)


def load_config(config_path: str) -> dict:
    """Load and validate brand-config.yaml."""
    path = Path(config_path)
    if not path.exists():
        print(f"Error: {config_path} not found.")
        print("Run init-brand.sh first or create brand-config.yaml manually.")
        sys.exit(1)

    with open(path, 'r', encoding='utf-8') as f:
        config = yaml.safe_load(f)

    if not config or 'brand' not in config:
        print("Error: Invalid brand-config.yaml. Missing 'brand' key.")
        sys.exit(1)

    return config['brand']


def generate_colors_json(brand: dict, output_dir: Path):
    """Generate colors.json from brand config."""
    colors = brand.get('colors', {})
    tokens = {
        "primary": {
            "default": colors.get('primary', ''),
            "light": colors.get('primary_light', ''),
            "dark": colors.get('primary_dark', ''),
        },
        "secondary": colors.get('secondary', ''),
        "cream": colors.get('cream', ''),
        "accent": colors.get('accent', ''),
        "neutrals": colors.get('neutrals', {}),
        "semantic": colors.get('semantic', {}),
    }

    output = output_dir / 'colors.json'
    with open(output, 'w', encoding='utf-8') as f:
        json.dump(tokens, f, indent=2, ensure_ascii=False)
    print(f"  ✓ {output}")


def generate_typography_json(brand: dict, output_dir: Path):
    """Generate typography.json from brand config."""
    typo = brand.get('typography', {})
    tokens = {
        "families": {
            "heading": typo.get('heading', ''),
            "body": typo.get('body', ''),
            "mono": typo.get('mono', ''),
        },
        "weights": {
            "heading": typo.get('heading_weights', [700, 800]),
            "body": typo.get('body_weights', [400, 500, 600]),
            "mono": typo.get('mono_weights', [400, 600]),
        },
        "scale": {
            "ratio": typo.get('scale_ratio', 1.25),
            "base": typo.get('base_size', '1rem'),
        },
    }

    output = output_dir / 'typography.json'
    with open(output, 'w', encoding='utf-8') as f:
        json.dump(tokens, f, indent=2, ensure_ascii=False)
    print(f"  ✓ {output}")


def generate_tokens_css(brand: dict, output_dir: Path):
    """Generate tokens.css with CSS custom properties."""
    colors = brand.get('colors', {})
    typo = brand.get('typography', {})
    neutrals = colors.get('neutrals', {})
    semantic = colors.get('semantic', {})

    css_lines = [
        "/* tokens.css — Generated from brand-config.yaml */",
        f"/* Brand: {brand.get('name', 'Unknown')} | v{brand.get('version', '1.0')} */",
        "",
        ":root {",
        "  /* Colors — Primary */",
        f"  --color-primary: {colors.get('primary', '#000')};",
        f"  --color-primary-light: {colors.get('primary_light', '#333')};",
        f"  --color-primary-dark: {colors.get('primary_dark', '#000')};",
        f"  --color-secondary: {colors.get('secondary', '#666')};",
        f"  --color-cream: {colors.get('cream', '#F5F0E8')};",
        f"  --color-accent: {colors.get('accent', '#F00')};",
        "",
        "  /* Colors — Neutrals */",
    ]

    for key in ['n950', 'n900', 'n800', 'n700', 'n600', 'n500', 'n400', 'n300', 'n200', 'n100', 'n50']:
        value = neutrals.get(key, '')
        css_lines.append(f"  --color-{key}: {value};")

    css_lines.extend([
        "",
        "  /* Colors — Semantic */",
        f"  --color-success: {semantic.get('success', '#22C55E')};",
        f"  --color-warning: {semantic.get('warning', '#F59E0B')};",
        f"  --color-error: {semantic.get('error', '#EF4444')};",
        f"  --color-info: {semantic.get('info', '#3B82F6')};",
        "",
        "  /* Typography */",
        f"  --font-heading: '{typo.get('heading', 'system-ui')}', system-ui, sans-serif;",
        f"  --font-body: '{typo.get('body', 'system-ui')}', system-ui, sans-serif;",
        f"  --font-mono: '{typo.get('mono', 'monospace')}', monospace;",
        "",
        "  /* Spacing (4px base) */",
        "  --space-0: 0;",
        "  --space-1: 0.25rem;",
        "  --space-2: 0.5rem;",
        "  --space-3: 0.75rem;",
        "  --space-4: 1rem;",
        "  --space-5: 1.25rem;",
        "  --space-6: 1.5rem;",
        "  --space-8: 2rem;",
        "  --space-10: 2.5rem;",
        "  --space-12: 3rem;",
        "  --space-16: 4rem;",
        "  --space-20: 5rem;",
        "  --space-24: 6rem;",
        "",
        "  /* Border Radius */",
        "  --radius-sm: 0.25rem;",
        "  --radius-md: 0.5rem;",
        "  --radius-lg: 0.75rem;",
        "  --radius-xl: 1rem;",
        "  --radius-full: 9999px;",
        "",
        "  /* Shadows */",
        "  --shadow-xs: 0 1px 2px rgba(0,0,0,0.2);",
        "  --shadow-sm: 0 2px 4px rgba(0,0,0,0.2);",
        "  --shadow-md: 0 4px 8px rgba(0,0,0,0.2);",
        "  --shadow-lg: 0 8px 16px rgba(0,0,0,0.2);",
        "  --shadow-xl: 0 16px 32px rgba(0,0,0,0.2);",
        "",
        "  /* Motion */",
        "  --duration-fast: 150ms;",
        "  --duration-normal: 300ms;",
        "  --duration-slow: 500ms;",
        "  --duration-slower: 800ms;",
        "  --ease-out: cubic-bezier(0.16, 1, 0.3, 1);",
        "  --ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);",
        "",
        "  /* Layout */",
        "  --container-max: 1200px;",
        "  --nav-height: 64px;",
        "}",
    ])

    output = output_dir / 'tokens.css'
    with open(output, 'w', encoding='utf-8') as f:
        f.write('\n'.join(css_lines) + '\n')
    print(f"  ✓ {output}")


def main():
    import argparse
    parser = argparse.ArgumentParser(description='Generate design tokens from brand-config.yaml')
    parser.add_argument('--config', default='brand-config.yaml', help='Path to brand-config.yaml')
    parser.add_argument('--output', default='brand-output/tokens/', help='Output directory')
    args = parser.parse_args()

    print(f"Reading {args.config}...")
    brand = load_config(args.config)
    print(f"Brand: {brand.get('name', 'Unknown')}")
    print()

    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    print("Generating tokens:")
    generate_colors_json(brand, output_dir)
    generate_typography_json(brand, output_dir)
    generate_tokens_css(brand, output_dir)

    print()
    print(f"Done! Tokens written to {output_dir}/")


if __name__ == '__main__':
    main()
