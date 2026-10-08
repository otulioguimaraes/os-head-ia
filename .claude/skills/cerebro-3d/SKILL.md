---
name: cerebro-3d
description: Cria a visão 3D do segundo cérebro do usuário — um globo interativo, local, com cada nota colorida pela categoria, os links entre notas como conexões e uma animação do cérebro crescendo de uma ideia até o todo. Use em /cerebro-3d, "quero ver meu cérebro em 3D", "visualizar meu segundo cérebro", "mapa 3D do OS".
---

# Cérebro 3D

Transforma as notas do OS numa visão 3D que roda no computador do usuário. Usa o aplicativo pronto em `assets/template/` — não redesenhe a cena, não troque por outro gráfico e não gere imagem com IA.

Base: skill `3d-brain` do projeto AIS-OS (Nate Herk, licença MIT — ver `LICENSE-AIS-OS.txt`), com a interface traduzida para o português.

Todos os caminhos desta skill são relativos à pasta dela (`skills/os/cerebro-3d/`). O OS do usuário é a pasta que contém `AGENTS.md`.

## 1. Conferir o Node.js (obrigatório, antes de tudo)

Rode `node --version`. Precisa ser **22 ou mais novo**.

Se não tiver, ou se for mais velho, pare e explique em linguagem simples:

- **Windows:** abrir o PowerShell e rodar `winget install OpenJS.NodeJS.LTS`, ou baixar o instalador "LTS" em https://nodejs.org. Depois **fechar e abrir de novo** o Claude/ChatGPT para ele enxergar o Node.
- **Mac:** baixar o instalador "LTS" em https://nodejs.org (ou `brew install node`, se o usuário já usa Homebrew).

Não instale nada sem o usuário aprovar. Não siga sem Node 22+.

## 2. Descobrir as pastas com notas

```text
node skills/os/cerebro-3d/scripts/descobrir.mjs --root .
```

O script lista só caminhos e quantidades de arquivos `.md`/`.txt`. Ele não lê o conteúdo.

## 3. Perguntar o nome e as categorias

Pergunte uma coisa de cada vez. Reaproveite o que o usuário já disse.

1. **Nome:** "Como você quer chamar o seu cérebro 3D?" (ex.: "Cérebro da Ana", "Mente da Clínica Vida"). Use exatamente o nome dado.
2. **Categorias:** mostre as categorias que o script encontrou, cada uma com a pasta e a quantidade de notas. Sugira de 3 a 7 (o máximo é 12). O usuário pode renomear, juntar, tirar ou incluir outras.

Recomendação padrão: Pessoas, Empresas, Temas, Projetos, Decisões e Empresa. `conhecimento/raw/` (bruto: transcrições, exportações) **fica de fora por padrão**. Ofereça só se o usuário pedir, avisando que deixa o desenho poluído e pode mostrar conteúdo sensível.

Categoria com pasta desconhecida: pergunte onde estão os arquivos. Nunca adivinhe pastas fora do OS.

Mostre o mapa final (nome · categoria → pasta) e siga sem pedir outra confirmação.

## 4. Gerar o aplicativo

O aplicativo nasce em `apps/cerebro-3d/`. Essa pasta é do usuário: a `/atualizar-os` não mexe nela.

Se `apps/cerebro-3d/` já existir, leia o `brain.config.json` dela e reaproveite. Para refazer do zero, mova a pasta antiga para `_arquivo/` (nunca apague).

Escreva a configuração num arquivo temporário (fora de `apps/`), no formato de `references/config.md`:

```json
{
  "name": "Cérebro da Ana",
  "port": 4640,
  "sources": [
    {"id":"pessoas","label":"Pessoas","paths":["conhecimento/paginas/pessoas"]},
    {"id":"empresas","label":"Empresas","paths":["conhecimento/paginas/empresas"]},
    {"id":"temas","label":"Temas","paths":["conhecimento/paginas/temas"]},
    {"id":"projetos","label":"Projetos","paths":["projetos"]},
    {"id":"decisoes","label":"Decisões","paths":["decisoes"],"staleDays":null}
  ]
}
```

Use só pastas que existem e que o usuário escolheu. `id` em minúsculas, sem acento.

```text
node skills/os/cerebro-3d/scripts/scaffold.mjs --root . --config <arquivo-temporario.json>
cd apps/cerebro-3d
node build.mjs
node serve.mjs
```

- `node serve.mjs` fica rodando. Inicie em segundo plano (no Windows, sem abrir janela extra).
- Porta padrão 4640. Se estiver ocupada, escolha outra, grave no `brain.config.json` e suba de novo. **Nunca derrube um programa do usuário.**
- O servidor só aceita acesso do próprio computador (`127.0.0.1`).

Leia os números reais que o build imprimiu. Pasta vazia aparece vazia — nunca invente nota. OS recém-criado tem poucas notas; diga que o cérebro cresce com o uso (`/ingerir`, `/sessao`).

## 5. Conferir antes de entregar

1. Abra `http://localhost:4640` (ou a porta escolhida) e confira o nome no topo e as categorias à esquerda.
2. Clique numa nota e veja se o texto abre.
3. Clique em **Ver crescer** e confira que a animação vai até o total de notas.
4. Se não der para olhar o navegador, diga exatamente o que ficou sem conferir.

## 6. Entregar

Diga ao usuário, em poucas linhas:

- o link local e a pasta `apps/cerebro-3d/`;
- quantas notas e categorias entraram;
- como usar: **Ver crescer** (animação), **Cinema** (tela limpa para apresentar), arrastar para girar, rolar para zoom, `/` para buscar;
- como abrir de novo depois: `cd apps/cerebro-3d` e `node serve.mjs`;
- para atualizar com notas novas: botão de recarregar no topo, ou `node build.mjs`.

Registre no `conhecimento/log.md`: data, nome do cérebro, categorias e contagem.

## Nunca

- Nunca publique o cérebro na internet nem faça deploy. Ele é local.
- **Antes de compartilhar a tela ou gravar:** o modo Cinema esconde os botões, **não** esconde informação. Títulos e trechos das notas aparecem. Se houver nota sensível (pessoas, clientes, valores), tire a categoria do desenho antes de mostrar.
- Nunca suba `apps/cerebro-3d/brain.config.json` nem a pasta `data/` para um repositório público (o `.gitignore` do app já protege).
- Nunca leia arquivos fora das pastas aprovadas.
- Para mudar o visual: `npm ci`, editar `src/`, `npm run build:js`. Mantenha o `THIRD-PARTY-NOTICES.txt` junto.
