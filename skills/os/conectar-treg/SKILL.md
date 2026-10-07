---
name: conectar-treg
description: Conecta o OS à TREG, um catálogo de milhares de APIs (busca no Google, empresas, redes sociais, anúncios, imagem e voz) com uma conta só e preço por chamada. Entende o que o usuário quer fazer, lê a documentação atual, guia o cadastro (com US$ 1 de crédito na primeira equipe), escolhe o caminho mais simples para o computador dele e faz a primeira chamada com preço aprovado. Use em /conectar-treg, "quero usar a treg", "preciso de dados de fora", "enriquecer uma lista".
---

# Conectar a TREG

A TREG dá ao OS acesso a dados de fora: busca no Google, dados de empresa por site, perfis de redes sociais, bibliotecas de anúncios, geração de imagem e voz. Uma conta só, saldo pré-pago, preço visível antes de cada chamada. A chave de cada fornecedor fica no servidor da TREG, nunca no computador do usuário.

Regra de ouro desta skill: **diga o preço antes de gastar, e só gaste com OK.**

## 1. Entender o objetivo

Pergunte, uma coisa por vez:

1. O que você quer fazer com dados de fora? Dê exemplos se ele travar: completar uma lista de fornecedores ou clientes com site e contato; ver o que os concorrentes anunciam; achar empresas de um ramo numa cidade; pesquisar uma palavra no Google; olhar um perfil do Instagram.
2. Isso é uma vez só ou vai se repetir? (Se repetir, no fim vira skill em `skills/minhas/`.)
3. Qual app você usa para o OS: Claude Desktop, Claude Code no terminal, ChatGPT desktop app (antigo Codex) ou outro? E qual sistema: Mac, Windows ou Linux?

Registre o objetivo em uma frase.

## 2. Ler a documentação atual

A TREG muda rápido. Antes de orientar, leia a versão atual (se houver acesso à web):

- `https://treg.to/llms.txt` — visão geral, rotas de conexão e custos;
- `https://treg.to/skill.md` — regras de uso, crédito e preço.

Se não houver acesso à web, use o resumo abaixo (conferido em 2026-10-05) e avise que ele pode estar desatualizado.

**Resumo de 2026-10-05:**

- Conta nova verificada ganha **US$ 1,00 de crédito uma vez**, ao criar a **primeira equipe** elegível. Equipes extras começam sem crédito.
- Cadastro: Google, GitHub ou código de 6 dígitos por e-mail.
- Conector (MCP): endereço `https://treg.to/mcp/`, autorização pelo navegador (OAuth). Na tela de consentimento a pessoa escolhe de qual equipe sai o gasto.
- Linha de comando (CLI): só Mac e Linux, `curl -fsSL https://treg.to/install.sh | sh`, depois `treg login`. Não há instalador para Windows. O CLI guarda a credencial sozinho em `~/.treg/config.json`.
- Preço: aparece antes da chamada (`catalog_get` no conector, `treg catalog get <id>` no CLI). Chamada que falha não é cobrada.

## 3. Escolher o caminho mais simples

| Situação | Caminho |
|---|---|
| Claude Desktop ou claude.ai, qualquer sistema | **Conector personalizado** (recomendado; nada para instalar) |
| ChatGPT desktop app / ChatGPT | **Conector personalizado**, só se o plano dele permitir (no ChatGPT pode exigir plano pago ou modo desenvolvedor; confira na tela dele antes) |
| Claude Code no terminal ou Codex no terminal, Mac/Linux | CLI ou `treg mcp install` depois do login |
| Windows sem conector | Plantão / suporte: o CLI não tem instalador para Windows |

**Conector personalizado (passo a passo para o usuário fazer):**

1. Abrir as configurações do app → **Conectores** → **Adicionar conector personalizado**.
2. Nome: `TREG`. Endereço: `https://treg.to/mcp/`.
3. Clicar em conectar. O navegador abre a TREG.
4. Entrar com Google, GitHub ou código por e-mail. O primeiro login cria a conta.
5. Criar a **própria equipe** (é nela que cai o crédito de US$ 1).
6. Na tela de consentimento, escolher essa equipe e autorizar.
7. Voltar ao app e abrir uma conversa nova dentro da pasta do OS.

Os nomes dos menus mudam entre versões dos apps. Se o usuário não achar, peça um print e oriente pelo que aparece na tela dele.

**CLI (Mac/Linux):** explique que o comando instala um programa e peça aprovação antes de rodar `curl -fsSL https://treg.to/install.sh | sh`. Depois, o **usuário** roda `treg login` (abre o navegador) e cria a equipe com `treg org create "<nome>"` se o login não tiver pedido.

**O usuário faz o cadastro com as próprias mãos.** Nunca preencha senha, nunca copie código de e-mail, nunca crie conta em nome dele.

## 4. Conferir que funcionou

- Conector: chame `balance`. CLI: `treg balance`.
- Mostre o saldo. Esperado numa conta nova: cerca de US$ 1,00.
- Se o saldo vier zerado, explique a regra do crédito (só a primeira equipe de uma conta verificada) e não force nada.

## 5. A primeira chamada, com preço aprovado

1. Busque no catálogo pelo **objetivo**, não pelo nome de fornecedor: `catalog_search` (conector) ou `treg catalog search "<objetivo>"` (CLI). Buscar é grátis.
2. Para as 2 ou 3 melhores opções, leia `catalog_get` / `treg catalog get <id>` e mostre numa tabela: o que faz, entradas que pede, **preço**, taxa de sucesso.
3. Escolha pela ordem: (a) a opção que aceita as entradas que o usuário **tem**; (b) a mais confiável; (c) a mais barata.
4. Diga: *"Esta chamada custa até US$ X. Posso fazer uma?"* Espere o OK.
5. **Resultado do Brasil? Diga o país e o idioma na chamada.** Sem isso, muitos fornecedores devolvem resultados dos **Estados Unidos, em inglês**. No caminho automático `treg.google.serp.organic`, passe `country: "br"` e `language: "pt"`. Em fornecedor que pede local, passe a cidade, por exemplo `location_name: "Goiania,State of Goias,Brazil"` e `language_code: "pt"`. Exemplo testado em 2026-10-05: `dataforseo.google.serp.organic`, busca "ótica em Goiânia", custou US$ 0,002 e trouxe 9 resultados de Goiânia.
6. Faça **uma** chamada. Se o modo de chamada permitir um teto de custo (cabeçalho `X-Treg-Route-Max-Cost`), use `0.05`.
7. Mostre o resultado em linguagem simples e o **custo real** devolvido pela chamada.

Para mais de uma chamada (uma lista inteira, por exemplo), calcule o total antes (`preço × quantidade`) e peça OK para o total.

## 6. Registrar

Em `conexoes.md`, acrescente:

```markdown
## TREG
- estado: CONECTADO
- rota: conector personalizado | CLI
- equipe: <nome da equipe do usuário>
- escopo: leitura de dados externos; gasto do saldo pré-pago, com preço aprovado por chamada
- conferido em: AAAA-MM-DD (saldo inicial US$ X)
- revogar: remover o conector no app ou `treg logout`; a equipe é gerenciada em treg.to
- credencial: guardada pelo app ou pelo CLI; não fica neste OS
```

Registre no `conhecimento/log.md`. Se o objetivo se repete, ofereça transformar a chamada numa skill em `skills/minhas/<nome>/`, com o preço e o teto escritos nos passos.

## Nunca

- Gravar token, chave ou código de login em qualquer arquivo do OS.
- Usar o token de outra pessoa, ou entrar na equipe de outra empresa para gastar o saldo dela.
- Fazer chamadas em sequência (laço) sem o OK do total.
- Enviar dado pessoal sensível de terceiros (CPF, dados de saúde, dados financeiros) para enriquecimento.
- Prometer que um fornecedor cobre o Brasil sem testar: vários catálogos são fortes nos EUA e fracos aqui.
