---
name: mapear-fontes
description: Entrevista uma pessoa não técnica sobre onde seu trabalho acontece, identifica fontes de contexto úteis, prioriza as primeiras conexões e prepara um plano simples antes de instalar ou autenticar qualquer coisa. Use em /mapear-fontes, depois do onboarding ou quando o usuário não souber o que conectar ao OS.
---

# Mapear fontes de trabalho

Ajude o usuário a descobrir **quais fontes realmente valem ser conectadas** antes de falar em tecnologia. O resultado é um mapa priorizado; esta skill não instala, autentica nem conecta contas.

## Experiência obrigatória

- Fale sobre o trabalho real: reuniões, conversas, arquivos, decisões e entregas.
- Faça no máximo três perguntas curtas por mensagem.
- Não apresente uma lista enorme de aplicativos no começo.
- Traduza API, MCP, CLI e OAuth somente quando uma rota escolhida exigir isso.
- Recomende uma primeira fonte e explique o motivo em uma frase.
- Separe fontes pessoais e profissionais. Nunca presuma autorização para ler ambas.
- Comece por leitura, menor escopo e uma unidade de teste.

## 1. Entender o resultado desejado

Comece com duas perguntas:

```text
1. O que você gostaria que o OS conseguisse responder ou preparar por você?
2. Qual trabalho hoje mais depende de você lembrar, procurar ou juntar informações manualmente?
```

Transforme a resposta em até três casos de uso observáveis, como:

- preparar o dia com agenda e comunicações;
- recuperar decisões de reuniões;
- acompanhar um projeto entre mensagens e documentos;
- montar um fechamento semanal;
- encontrar contexto sobre cliente, parceiro ou colaborador.

## 2. Mapear onde o trabalho acontece

Percorra somente as categorias relevantes, em pequenos blocos:

1. **Conversas:** e-mail, WhatsApp, Slack, Teams, Telegram, Discord ou outro.
2. **Reuniões:** calendário, Meet/Zoom, Fathom, Fireflies, Granola, tl;dv, Plaud ou gravações.
3. **Arquivos e conhecimento:** computador, Drive, Notion, Obsidian, Dropbox ou outro.
4. **Projetos e execução:** GitHub, Lovable, ClickUp, Trello, Asana, CRM ou sistema próprio.
5. **Dados de negócio:** vendas, atendimento, financeiro, marketing ou operação.

Para cada fonte mencionada, descubra apenas:

- qual informação útil existe ali;
- para qual resultado ela serviria;
- se é pessoal, profissional ou mista;
- quem controla o acesso;
- frequência de uso;
- se basta leitura ou se escrita seria desejada depois;
- um recorte pequeno e seguro para o primeiro teste.

Não peça credenciais. Não leia a fonte durante esta etapa.

## 3. Classificar sem jargão

Classifique cada fonte em quatro dimensões de `1` a `3`:

- **valor:** quanto melhora uma decisão ou entrega;
- **frequência:** quanto esse contexto aparece;
- **facilidade:** quão simples é provar uma primeira leitura;
- **sensibilidade:** quanto cuidado exige.

Use a pontuação somente para apoiar a recomendação. Uma fonte sensível não é automaticamente proibida; ela exige menor escopo, leitura primeiro e separação clara.

## 4. Escolher a rota mínima

Para cada fonte priorizada, proponha uma rota nesta ordem:

1. arquivo, texto ou exportação fornecida pelo usuário;
2. conector nativo já disponível no aplicativo;
3. MCP, API, CLI ou exportação oficial;
4. ferramenta comunitária ativa e verificável;
5. integração personalizada somente quando necessária.

Consulte `guias/conexoes/README.md`. Se houver playbook, cite-o. Se não houver, indique `/search-connectors <aplicativo>` como próxima etapa. Não invente capacidade, link ou comando.

## 5. Produzir o mapa

Crie ou atualize `conexoes/MAPA-DE-FONTES.md` usando `skills/os/mapear-fontes/assets/mapa-de-fontes-template.md`.

O mapa deve conter:

- objetivos do usuário;
- inventário das fontes mencionadas;
- limites pessoais/profissionais;
- prioridade `AGORA`, `DEPOIS` ou `NÃO CONECTAR`;
- rota mínima recomendada;
- primeiro teste;
- aprovação necessária;
- lacunas ainda não respondidas.

Atualize `conexoes.md` apenas para adicionar fontes que o usuário realmente confirmou. Mantenha o estado `NAO_CONFIGURADO` até existir um teste.

## 6. Encerrar com uma decisão

Mostre no máximo três recomendações:

```text
Seu mapa de fontes está pronto.

Começar agora: [fonte]
Por quê: [valor concreto]
Primeiro teste: [uma unidade pequena]
Caminho: /conectar [fonte]

Depois: [até duas fontes]
Fora do escopo: [fontes pessoais, sensíveis ou sem autorização]
```

Pergunte se o usuário quer iniciar **somente a primeira conexão**. Se aceitar, leia e execute `skills/os/conectar/SKILL.md`. Instalação, autenticação e escrita continuam exigindo explicação e aprovação próprias.

## Critério de pronto

- os casos de uso vêm do trabalho real do usuário;
- fontes pessoais e profissionais estão separadas;
- existe uma prioridade recomendada e um primeiro teste pequeno;
- cada rota é honesta sobre maturidade, permissão e esforço;
- o mapa foi salvo sem credenciais;
- nenhuma conta foi acessada durante o diagnóstico.
