# Segundo cérebro visual

O segundo cérebro é uma **visualização** da memória do OS. Ele ajuda a localizar pessoas, empresas, projetos, reuniões, decisões e relações, mas nunca vira uma segunda fonte da verdade.

## Quando construir

Construa depois que o OS já tiver:

- páginas reais em `conhecimento/`;
- projetos registrados;
- decisões e fontes com origem;
- índices ou arquivos-roteadores úteis;
- pelo menos duas semanas de uso.

Antes disso, a visualização tende a mostrar uma pasta vazia com aparência de produto pronto.

## Contrato mínimo

```text
arquivos canônicos em Markdown
        ↓ leitura local
índice regenerável com nós e relações
        ↓
visualização pesquisável
        ↓ clique
fonte, resumo, relações e caminho relativo
```

O índice é derivado e pode ser recriado. Não mova nem renomeie os arquivos apenas para o gráfico parecer organizado.

## Prompt para construir com a IA

```text
Quero criar um segundo cérebro visual para este OS.

Primeiro, leia AGENTS.md, memoria.md, conhecimento/index.md e a estrutura real da pasta. Não leia fora desta raiz. Faça uma auditoria somente de leitura e me mostre:
1. quais entidades e relações realmente existem;
2. quais pastas devem entrar ou ficar fora;
3. quais dados são sensíveis;
4. como gerar um índice derivado sem mudar as fontes.

Depois proponha uma V1 local e simples em ferramentas/segundo-cerebro/ com:
- busca por pessoa, empresa, projeto, reunião, decisão e tema;
- filtros por tipo, período e área;
- visualização em grafo e lista;
- painel de detalhe com resumo, relações, proveniência e caminho relativo;
- script explícito para atualizar o índice;
- estados vazio, carregando e erro;
- modo público que mascara dados antes de renderizar;
- zero envio de memória para serviços externos apenas para montar a interface.

Use os arquivos Markdown como fonte da verdade. O índice e o HTML devem ser regeneráveis. Antes de criar arquivos, apresente arquitetura, riscos e critérios de aceite e aguarde minha aprovação.
```

## Critérios de aceite

- uma busca conhecida encontra o arquivo certo;
- cada item mostra sua origem;
- relações não são inventadas;
- o gráfico continua útil com centenas de nós;
- dados sensíveis não entram no modo público;
- apagar o índice não apaga a memória;
- há instrução clara para atualizar, iniciar e remover a visualização.

## Escala

Comece com lista e busca. Adicione o grafo quando houver relações suficientes. Em bases grandes, renderize sob demanda, limite animações, pause a física quando a tela estiver parada e ofereça filtros antes de tentar desenhar tudo ao mesmo tempo.
