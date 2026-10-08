# Comandos do OS

| Comando | Para quê serve | Principal saída |
|---|---|---|
| `/iniciar` | Configurar o OS e completar a primeira vitória | perfil, projeto, fonte, briefing e retomada |
| `/registrar-projeto` | Criar ou atualizar a ficha de um projeto | `projetos/<slug>.md` |
| `/ingerir` | Preservar uma fonte e transformá-la em contexto | `conhecimento/raw/` + nota derivada |
| `/consultar` | Responder com base nas evidências do OS | resposta com fontes e lacunas |
| `/sessao` | Fechar ou retomar uma sessão de trabalho | `memoria.md` + `saidas/RETOMAR.md` |
| `/conectar` | Escolher e testar uma fonte pelo caminho mais simples | primeira fonte + registro em `conexoes.md` |
| `/mapear-fontes` | Entrevistar, priorizar e preparar as fontes que valem ser conectadas | `conexoes/MAPA-DE-FONTES.md` |
| `/search-connectors` | Pesquisar formas atuais de conectar qualquer aplicativo | comparação oficial, recomendação e primeiro teste |
| `/briefing-manha` | Priorizar o dia com o contexto disponível | `saidas/diario/AAAA-MM-DD-briefing.md` |
| `/criar-rotina` | Desenhar uma rotina repetível e testável | `rotinas/<slug>.md` em estado DRAFT |
| `/design-system` | Extrair uma marca existente ou conduzir a construção de um sistema visual | `projetos/<slug>/design-system/` |

Você também pode pedir em linguagem natural.

**Suas skills:** quando uma conversa der certo, peça *"crie uma skill para isso"*. Ela nasce em `skills/minhas/<nome>/` e aparece aqui do mesmo jeito. Veja [skills/minhas/README.md](skills/minhas/README.md). Os comandos existem para tornar o procedimento previsível e auditável.

## Depois da primeira ativação

| Comando | Para quê serve | Principal saída |
|---|---|---|
| `/fechar-semana` | Transformar evidências em avanços, decisões, pendências e aprendizados | `saidas/rotinas/fechamento-semanal/AAAA-Sww.md` |
| `/montar-semana` | Planejar até três resultados dentro da capacidade real | `saidas/rotinas/montar-semana/AAAA-Sww.md` |

| `/atualizar-os` | Atualizar este OS para uma versão nova sem tocar nos seus dados | plano de atualização + `_arquivo/atualizacao-<data>/` |
| `/conectar-treg` | Conectar a TREG (catálogo de APIs com preço por chamada) e fazer a primeira chamada com preço aprovado | registro em `conexoes.md` |
| `/cerebro-3d` | Ver o segundo cérebro em 3D: cada nota vira um ponto, os links viram conexões, com animação de crescimento e modo Cinema (precisa de Node.js 22+) | app local em `apps/cerebro-3d/` |

Esses comandos ficam fora da primeira tela do onboarding. Eles aparecem depois que o aluno já provou perfil, projeto, fonte, briefing e retomada.

Exercícios dos encontros: [exercicios/](exercicios/README.md).

Para evoluir o sistema além da primeira ativação, leia [GUIA-COMPLETO-DO-OS.md](GUIA-COMPLETO-DO-OS.md). Ele inclui segundo cérebro, Agentic OS, conexões, skills e rotinas.
