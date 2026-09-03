---
name: ingerir
description: Preserva uma fonte bruta e cria uma nota derivada rastreável para o conhecimento do OS. Use em /ingerir, ao receber transcrições, atas, e-mails, PDFs, textos, exportações ou arquivos que precisem virar contexto organizado.
---

# Ingerir uma fonte

Transforme entrada em contexto sem apagar a origem e sem misturar evidência com interpretação.

## 1. Identificar a entrada

Determine:

- tipo e origem;
- data da fonte, se conhecida;
- projeto ou tema relacionado;
- se contém dados sensíveis;
- se é real ou material de demonstração.

Se houver informação sensível desnecessária, avise antes de copiá-la e proponha uma versão redigida. Nunca mova credenciais para o OS.

## 2. Preservar o bruto

Crie `conhecimento/raw/AAAA-MM-DD-<slug>/` e copie a fonte sem reescrevê-la. Use a **data da própria fonte** no nome da pasta quando ela estiver explícita e for confiável. Se a fonte não tiver data, use a data de captura e marque essa escolha no `LEIA-ME.md`. Para texto colado, salve uma transcrição literal em `fonte.md` e registre que a origem foi a conversa.

Adicione um `LEIA-ME.md` no mesmo diretório com:

- origem ou URL permanente;
- data da fonte, quando conhecida;
- data de captura pelo OS;
- tipo de conteúdo;
- relação com projeto/tema;
- ressalvas de completude;
- indicação de demo, quando aplicável.

Não salve URLs assinadas temporárias como referência principal.

## 3. Produzir a nota derivada

Escolha `conhecimento/paginas/temas/`, `pessoas/` ou `empresas/` e crie ou atualize uma nota. Estruture:

```markdown
# Título

- atualizado em:
- fontes:

## Fatos observados

## Síntese

## Decisões mencionadas

## Pendências e perguntas

## Relações
```

Cite caminhos relativos para a fonte bruta. Não transforme inferência em fato. Preserve timestamps quando forem úteis.

Se a fonte for `DEMO`, mantenha decisões e compromissos fictícios somente na nota derivada marcada como demonstração. Não os registre em `decisoes/log.md` nem os apresente como estado real do usuário.

## 4. Registrar o processamento

Atualize:

- `conhecimento/processados.md` com bruto, derivado e status;
- `conhecimento/index.md` com a nova página;
- `conhecimento/log.md` com a ação;
- a ficha do projeto relacionado, quando houver.

## 5. Validar

Antes de concluir, confira:

- o bruto existe e permanece íntegro;
- a nota aponta para a origem;
- fatos, síntese e lacunas estão separados;
- nenhuma credencial foi gravada;
- a fonte está marcada como real ou demo.

Apresente os dois caminhos: fonte preservada e nota útil.
