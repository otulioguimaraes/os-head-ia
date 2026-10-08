---
name: ingerir
description: Preserva uma fonte bruta e cria notas derivadas rastreáveis e ligadas entre si (a fonte, cada pessoa e cada empresa citada). Use em /ingerir, ao receber transcrições, atas, e-mails, PDFs, textos, exportações ou arquivos que precisem virar contexto organizado.
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

## 3. Produzir as notas derivadas

Uma fonte vira **três tipos de nota, ligadas entre si**. É isso que faz o OS cruzar uma reunião com outra.

### 3.1 A nota da fonte (sempre)

Em `conhecimento/paginas/temas/`, uma nota sobre o que a fonte trata: a reunião, o e-mail, o documento. Estruture:

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

### 3.2 Uma página por pessoa citada (sempre que houver papel ou compromisso)

Para cada pessoa que aparece com **nome e papel, decisão, pedido ou prazo**, crie ou atualize `conhecimento/paginas/pessoas/<nome-sobrenome>.md`:

```markdown
# Nome Sobrenome

- empresa e papel:
- atualizado em:
- fontes:

## O que sabemos (com data e fonte)

## Compromissos e prazos

## Relações
```

- **Atualize, nunca duplique.** Antes de criar, procure em `pessoas/` pelo nome e por variações ("Dr. Henrique", "Henrique Sato"). Se já existir, acrescente o fato novo com a data e a fonte.
- Só fatos de trabalho ditos na fonte: papel, decisões, pedidos, prazos. Nada de opinião sobre a pessoa, saúde, salário ou vida pessoal.
- Pessoa citada só de passagem, sem papel nem compromisso, fica só mencionada na nota da fonte.

### 3.3 Uma página por empresa citada

Para cada empresa ou organização com papel na fonte (cliente, fornecedor, parceiro, a própria empresa do usuário), crie ou atualize `conhecimento/paginas/empresas/<nome>.md`, com o mesmo cuidado de **atualizar, nunca duplicar**: o que a empresa é, as pessoas dela que aparecem, o histórico com data e fonte, e o que está em aberto.

### 3.4 Ligar tudo

Em `## Relações`, ligue as notas com links relativos de Markdown, nos dois sentidos:

- a nota da fonte aponta para cada pessoa e cada empresa;
- a pessoa aponta para a empresa dela e para as fontes em que aparece;
- a empresa aponta para as suas pessoas e para as fontes;
- quando a fonte nova muda algo de uma fonte anterior (uma decisão, um prazo), escreva a mudança com as duas datas e ligue as duas notas.

Cite caminhos relativos para a fonte bruta. Não transforme inferência em fato. Preserve timestamps quando forem úteis.

Se a fonte for `DEMO`, marque **todas** as notas criadas (fonte, pessoas e empresas) como demonstração, com `(DEMO)` no título e no nome do arquivo. Mantenha decisões e compromissos fictícios só nessas notas. Não os registre em `decisoes/log.md` nem os apresente como estado real do usuário.

## 4. Registrar o processamento

Atualize:

- `conhecimento/processados.md` com bruto, derivado e status;
- `conhecimento/index.md` com as páginas novas e atualizadas (fonte, pessoas, empresas);
- `conhecimento/log.md` com a ação;
- a ficha do projeto relacionado, quando houver.

## 5. Validar

Antes de concluir, confira:

- o bruto existe e permanece íntegro;
- a nota aponta para a origem;
- cada pessoa e cada empresa com papel na fonte tem página, sem duplicata;
- as páginas estão ligadas nos dois sentidos em `## Relações`;
- fatos, síntese e lacunas estão separados;
- nenhuma credencial foi gravada;
- a fonte está marcada como real ou demo.

Apresente o resultado: a fonte preservada, a nota da fonte e a lista de pessoas e empresas criadas ou atualizadas.
