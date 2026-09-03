---
name: search-connectors
description: Pesquisa e compara formas atuais de conectar qualquer aplicativo ao OS, priorizando conectores oficiais, menor permissão e uma leitura pequena antes de instalar ou autenticar. Use em /search-connectors, ao procurar API, MCP, plugin, CLI, exportação ou integração para um serviço.
---

# Search Connectors

Encontre o menor caminho confiável para o OS ler uma fonte. Esta skill pesquisa; ela não instala, autentica, conecta nem altera arquivos do produto sem pedido e autorização explícitos.

## Entrada

Aceite `/search-connectors <aplicativo>` ou uma pergunta equivalente. Se o objetivo não estiver claro, pergunte apenas qual informação ou ação o usuário quer obter daquele aplicativo.

## Ordem de pesquisa

1. Conector ou plugin nativo da ferramenta de IA usada pelo usuário.
2. MCP, API, CLI ou exportação mantidos oficialmente pelo fornecedor.
3. Ferramenta local ou comunitária ativa, com código e licença verificáveis.
4. Integração personalizada somente quando as rotas anteriores não cumprem o objetivo.

Pesquise informação atual. Para produtos e APIs, prefira documentação oficial e repositórios do próprio fornecedor. Para projetos comunitários, use o repositório original e confirme se está arquivado, licença, última atividade, releases e instruções reais de instalação. Tente variações do nome antes de concluir que uma categoria não existe.

## Segurança e adequação

- Comece por leitura e pelo menor escopo de autorização.
- Não peça senha, token, cookie ou chave para ser gravado no OS.
- Diferencie conexão disponível de conexão comprovada nesta conta, plano e sistema operacional.
- Aponte requisitos de administrador, plano pago, desktop, terminal ou servidor.
- Não apresente comando de instalação que não esteja documentado na fonte escolhida.
- Antes de instalar ou autenticar, explique origem, permissões, efeito, como testar, como revogar e peça autorização.
- Depois de conectar, prove apenas uma leitura pequena e autorizada; então encaminhe o conteúdo para `/ingerir`.

## Resposta

Entregue uma comparação curta com até duas opções por categoria:

```text
Conectores para <aplicativo>

Objetivo: <resultado desejado>
Oficiais: <opções, links e requisitos>
Alternativas verificadas: <opções, saúde e limitações>
Recomendação: <uma rota e por quê>
Primeiro teste: <uma leitura pequena>
Revogação/fallback: <como sair ou importar manualmente>
```

Se não houver rota segura, diga isso e recomende `guias/conexoes/importacao-manual.md`. Salve pesquisa em `saidas/conectores/` somente se o usuário pedir. Registre em `conexoes.md` apenas após um teste real bem-sucedido.

## Instalação opcional

Se o usuário aprovar uma opção, releia a fonte oficial, apresente o plano e instale apenas o necessário. Verifique com uma versão, diagnóstico ou leitura inofensiva. Pare antes de escrita externa, envio, publicação, gasto ou ampliação de escopo.
