# Extrair uma marca existente

## Entradas aceitas

Em ordem de qualidade:

1. URL do site;
2. arquivos oficiais de marca;
3. screenshot ou imagem;
4. PDF ou apresentação existente;
5. descrição do responsável, identificada como fonte declarada.

Sem nenhuma referência, não extraia. Volte à decisão inicial e ofereça o modo CONSTRUIR.

## Extração

Colete somente o que puder sustentar:

- cores recorrentes e seus usos, distinguindo marca de ruído de interface;
- fontes e pesos;
- logo e assinaturas existentes;
- tema, superfícies, bordas, raios, sombras e densidade;
- estilo de ícones e imagens;
- componentes recorrentes;
- tagline, princípios e tom somente quando estiverem documentados.

Em sites, o HTML pode ser apenas um shell. Se necessário, examine os CSS carregados e variáveis `--primary`, `--brand`, `--accent`, `--background` e `--foreground`. Considere valores hex, RGB, HSL e `color()`.

## Checkpoint de confirmação

Mostre os achados em linguagem simples:

```text
Achei estas decisões visuais:
- cor principal: [valor] — usada em [lugar]
- cor secundária: [valor] — usada em [lugar]
- títulos: [fonte/peso]
- textos: [fonte/peso]
- logo: [vetor confirmado | arquivo raster | ausente]
- direção visual: [descrição curta]

O que é realmente da marca e o que veio apenas do template do site?
```

Pergunte somente as lacunas. Trave cores, tipografia, logo e seções antes de gerar a referência final.

## Estrutura da entrega

O `DESIGN-SYSTEM.md` e o `design-system.html` podem conter:

1. identidade e fontes;
2. hierarquia de cores;
3. tipografia;
4. espaçamento, grid e superfícies;
5. componentes observados;
6. ícones e imagens;
7. assinaturas e usos do logo;
8. exemplos corretos e incorretos;
9. pendências declaradas.

Remova seções sem evidência. O objetivo é uma referência verdadeira, não um manual preenchido por aparência.
