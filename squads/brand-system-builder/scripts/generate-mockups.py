#!/usr/bin/env python3
"""generate-mockups.py — Generate AI mockup prompts from brand-config.yaml

Reads brand-config.yaml and generates mockup prompts for AI image generation
tools (Midjourney, DALL-E, Stable Diffusion, etc.).

Usage:
    python3 generate-mockups.py [--config brand-config.yaml] [--output brand-output/mockups/]
"""

import sys
import os
from pathlib import Path

try:
    import yaml
except ImportError:
    print("Error: PyYAML required. Install with: pip install pyyaml")
    sys.exit(1)


MOCKUP_TEMPLATES = [
    {
        "id": "business-card",
        "name": "Business Card",
        "prompt": 'Minimalist business card mockup on dark surface, brand "{name}" with logo "{logo}", colors {primary} and {cream}, clean typography {heading_font}, professional photography, 8k, studio lighting',
    },
    {
        "id": "laptop-screen",
        "name": "Laptop Screen",
        "prompt": 'MacBook Pro showing website with "{name}" brand, hero section with "{tagline}", color scheme {primary} on dark background {n950}, modern UI design, {heading_font} typography, realistic mockup, 8k',
    },
    {
        "id": "mobile-app",
        "name": "Mobile App",
        "prompt": 'iPhone mockup showing mobile app for "{name}", dark mode UI with {primary} accent color, {heading_font} headings, clean interface, floating on gradient background, 8k, studio shot',
    },
    {
        "id": "social-media",
        "name": "Social Media Post",
        "prompt": 'Instagram post mockup for "{name}" brand, quote card with "{tagline}", {primary} accent on {n950} background, {heading_font} typography, minimalist design, square format',
    },
    {
        "id": "tshirt",
        "name": "T-Shirt",
        "prompt": 'Black t-shirt mockup with "{logo}" logo in {primary} color, minimalist design, folded on marble surface, professional product photography, 8k',
    },
    {
        "id": "mug",
        "name": "Coffee Mug",
        "prompt": 'Matte black coffee mug with "{logo}" logo in {primary} color, minimalist branding, on wooden desk, morning light, professional product photography, 8k',
    },
    {
        "id": "letterhead",
        "name": "Letterhead",
        "prompt": 'Corporate letterhead and envelope mockup for "{name}", logo "{logo}" in {primary}, cream paper {cream}, {heading_font} typography, minimalist design, flat lay, 8k',
    },
    {
        "id": "billboard",
        "name": "Billboard",
        "prompt": 'Urban billboard mockup displaying "{name}" advertisement, headline "{tagline}", {primary} on {n950} background, bold {heading_font} typography, city environment, photorealistic, 8k',
    },
    {
        "id": "presentation",
        "name": "Presentation Slide",
        "prompt": 'Keynote presentation slide for "{name}", title slide with logo "{logo}", {primary} accent on dark {n950} background, {heading_font} headings, clean corporate design, widescreen 16:9',
    },
    {
        "id": "packaging",
        "name": "Product Packaging",
        "prompt": 'Premium product box packaging for "{name}" brand, matte black with {primary} accent, logo "{logo}", minimalist design, {heading_font} typography, studio photography, 8k',
    },
]


def load_config(config_path: str) -> dict:
    """Load brand-config.yaml."""
    path = Path(config_path)
    if not path.exists():
        print(f"Error: {config_path} not found.")
        sys.exit(1)

    with open(path, 'r', encoding='utf-8') as f:
        config = yaml.safe_load(f)

    if not config or 'brand' not in config:
        print("Error: Invalid brand-config.yaml.")
        sys.exit(1)

    return config['brand']


def generate_prompts(brand: dict) -> list:
    """Generate mockup prompts from brand config."""
    colors = brand.get('colors', {})
    typo = brand.get('typography', {})
    logo = brand.get('logo', {})
    neutrals = colors.get('neutrals', {})

    replacements = {
        'name': brand.get('name', 'Brand'),
        'tagline': brand.get('tagline', ''),
        'logo': logo.get('primary', brand.get('name', '')),
        'primary': colors.get('primary', '#000'),
        'cream': colors.get('cream', '#FFF'),
        'n950': neutrals.get('n950', '#0A0A0A'),
        'heading_font': typo.get('heading', 'Sans-serif'),
    }

    prompts = []
    for template in MOCKUP_TEMPLATES:
        prompt = template['prompt']
        for key, value in replacements.items():
            prompt = prompt.replace('{' + key + '}', str(value))
        prompts.append({
            'id': template['id'],
            'name': template['name'],
            'prompt': prompt,
        })

    return prompts


def main():
    import argparse
    parser = argparse.ArgumentParser(description='Generate AI mockup prompts from brand-config.yaml')
    parser.add_argument('--config', default='brand-config.yaml', help='Path to brand-config.yaml')
    parser.add_argument('--output', default='brand-output/mockups/', help='Output directory')
    args = parser.parse_args()

    brand = load_config(args.config)
    prompts = generate_prompts(brand)

    output_dir = Path(args.output)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Write prompts file
    output_file = output_dir / 'mockup-prompts.md'
    lines = [
        f"# Mockup Prompts — {brand.get('name', 'Brand')}",
        "",
        f"Generated from brand-config.yaml | {len(prompts)} mockups",
        "",
        "Use these prompts with AI image generation tools (Midjourney, DALL-E, etc.).",
        "",
    ]

    for i, p in enumerate(prompts, 1):
        lines.extend([
            f"## {i}. {p['name']}",
            "",
            f"**ID:** `{p['id']}`",
            "",
            f"```",
            p['prompt'],
            f"```",
            "",
        ])

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    print(f"Generated {len(prompts)} mockup prompts → {output_file}")


if __name__ == '__main__':
    main()
