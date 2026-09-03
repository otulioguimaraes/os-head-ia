# Guia completo do seu Sistema Operacional com IA

## Da primeira pasta ao segundo cérebro, às rotinas e ao Agentic OS

Versão 1.0 · Formação Head de IA · atualizado em 2026-09-02

---

## O que este guia faz

Este documento é o playbook de instalação e evolução do OS Head de IA. Você pode lê-lo, seguir apenas a próxima etapa ou entregar o arquivo inteiro para uma IA que trabalhe com pastas locais.

Ao final da jornada, você terá um sistema que:

- conhece seu contexto, suas prioridades e seu modo de trabalhar;
- preserva reuniões, conversas, arquivos e decisões com origem;
- encontra informação sem depender da memória de um chat;
- executa procedimentos repetíveis como skills;
- transforma cadências de trabalho em rotinas;
- mostra a memória em um segundo cérebro visual;
- pode ganhar um cockpit local para consulta e execução segura.

O objetivo não é instalar tudo de uma vez. O objetivo é construir uma camada, provar que funciona e só então avançar.

> **Tese central:** quanto mais contexto útil, organizado e rastreável o sistema acumula, menos você recomeça do zero e melhores ficam suas decisões e entregas.

---

## Como usar este guia com uma IA

### Se o arquivo já está dentro da pasta do OS

Abra a pasta inteira no Codex ou no Claude Code e envie:

```text
Leia GUIA-COMPLETO-DO-OS.md e me conduza pela próxima etapa ainda não concluída.

Antes de agir:
1. leia AGENTS.md, memoria.md e saidas/RETOMAR.md;
2. faça um diagnóstico somente dentro desta pasta;
3. não instale programas, não conecte contas e não execute ações externas sem me explicar e pedir autorização;
4. faça uma etapa por vez e valide o resultado antes de continuar;
5. ao final, atualize o estado do OS e me diga o próximo passo.
```

### Se você recebeu apenas este PDF

Anexe o PDF à conversa e envie:

```text
Este PDF é o playbook do sistema operacional que quero instalar.

Primeiro, leia o documento inteiro e me diga:
1. em qual etapa eu estou;
2. qual é a menor próxima vitória;
3. quais arquivos, aplicativos ou autorizações serão necessários;
4. o que você consegue fazer e o que eu preciso fazer manualmente.

Depois me conduza uma etapa por vez. Não invente que uma conexão existe. Use documentação oficial atual, não peça que eu cole senhas ou tokens em arquivos e pare antes de qualquer instalação, autenticação, envio ou publicação para pedir autorização.
```

### A regra de ouro

Não diga apenas “instale tudo”. Peça uma pequena vitória observável:

```text
implementar → verificar → corrigir → verificar novamente → registrar
```

---

## O mapa do OS

O sistema completo possui sete camadas. Elas formam uma escada, não uma lista de compras.

| Camada | Pergunta que resolve | Primeiro sinal de que funciona |
|---|---|---|
| 1. Base | Onde o sistema vive? | a pasta abre e pode ser escrita |
| 2. Direção | Quem sou e o que importa agora? | perfil, prioridades e primeiro projeto |
| 3. Fontes | O que o sistema consegue enxergar? | uma fonte real foi lida com autorização |
| 4. Memória | Como o contexto deixa de se perder? | bruto preservado, nota derivada e origem |
| 5. Capacidades | O que ele faz de forma confiável? | uma skill produz a mesma classe de resultado |
| 6. Ritmos | O que precisa acontecer sempre? | uma rotina manual foi validada e registrada |
| 7. Interfaces | Como consultar e operar tudo isso? | busca, segundo cérebro ou cockpit abrem a fonte certa |

```text
FONTES → CONTEXTO → MEMÓRIA → DECISÕES → SKILLS → ROTINAS → ENTREGÁVEIS
                            ↑                                   ↓
                            └──────── aprendizado registrado ──┘
```

Você pode trabalhar bem sem a última camada. Nenhuma interface bonita compensa fontes ruins, memória sem origem ou automações que ninguém validou.

---

# PARTE 1 · INSTALAÇÃO

## 1. O que você precisa

- uma cópia do OS em ZIP ou GitHub;
- uma pasta local com permissão de escrita;
- Codex ou Claude Code;
- internet para autenticar a ferramenta de IA;
- um projeto e uma fonte pequena para o primeiro teste.

Você não precisa instalar dois agentes. Escolha um.

### Links oficiais

- Codex no ChatGPT desktop: <https://help.openai.com/en/articles/11369540>
- Codex CLI: <https://help.openai.com/en/articles/11096431>
- Claude Code: <https://docs.anthropic.com/en/docs/claude-code/getting-started>
- Node.js, quando um recurso local exigir: <https://nodejs.org/en/download>
- GitHub, baixar ZIP ou clonar: <https://docs.github.com/en/repositories/working-with-files/using-files/downloading-files-from-github>

As interfaces e requisitos podem mudar. Se a tela estiver diferente, peça à IA que confira a documentação oficial antes de orientar.

## 2. Obtenha a pasta

### Rota A · ZIP, mais simples

1. Baixe o arquivo enviado pela formação.
2. Descompacte.
3. Mova a pasta para `Documentos` ou outro local gravável.
4. Não trabalhe dentro do arquivo `.zip`.

### Rota B · GitHub

Na página do repositório, use **Code → Download ZIP** ou copie o endereço HTTPS. Para clonar:

```bash
git clone https://github.com/otulioguimaraes/os-head-ia.git
```

O clone cria uma nova pasta. Não use usuário e senha do GitHub dentro de comandos ou documentos; siga o login oficial do aplicativo, GitHub Desktop, Git Credential Manager ou GitHub CLI.

## 3. Abra a raiz inteira

Selecione a pasta que contém:

```text
README.md
COMECE-AQUI.md
AGENTS.md
CLAUDE.md
memoria.md
skills/
conhecimento/
projetos/
saidas/
```

Abrir apenas um arquivo no navegador não dá à IA acesso à estrutura do sistema.

## 4. Primeira mensagem

Na primeira conversa, envie a mensagem completa. Ela funciona mesmo quando o atalho `/iniciar` ainda não foi descoberto:

```text
Leia as instruções desta pasta, prepare o OS para este aplicativo e comece meu onboarding. Não leia nada fora desta pasta, não instale programas e não conecte contas sem me explicar e pedir autorização.
```

Se a preparação funcionar, a IA deve dizer `Tudo pronto.` e começar o onboarding.

## 5. Se algo falhar

Envie:

```text
Diagnostique o meu OS sem apagar dados. Rode a verificação apropriada ao meu sistema operacional, explique em linguagem simples o que falhou e proponha apenas o próximo passo seguro.
```

Não reinstale ou apague a pasta antes de saber a causa.

---

# PARTE 2 · PRIMEIRA ATIVAÇÃO

## 6. Onboarding

Execute `/iniciar` ou continue pela conversa guiada. Você poderá:

1. criar seu OS real;
2. usar uma demonstração fictícia;
3. importar documentos fundacionais;
4. retomar uma ativação incompleta.

### Documentos fundacionais opcionais

- **M0 · Contexto do negócio:** negócio, clientes, oferta, operação, desafios e prioridades.
- **M2 · DNA:** modo de pensar, preferências, critérios, linguagem, limites e estilo de trabalho.

Se você tiver esses documentos, entregue os arquivos ou indique seus caminhos. O OS deve preservar os originais, usar apenas campos explícitos e perguntar somente o que faltar.

## 7. Primeiro projeto

Descreva uma iniciativa real em uma frase. O projeto pode estar no Lovable, GitHub, Drive ou apenas na sua cabeça.

O registro mínimo contém:

- objetivo;
- resultado esperado;
- estado atual;
- próximos passos;
- pessoas envolvidas;
- fontes e caminho do projeto, quando houver.

Código e arquivos pesados ficam fora do OS. A ficha registra o caminho e a relação.

## 8. Primeira fonte

Escolha apenas uma:

- uma reunião;
- um e-mail ou evento;
- uma conversa autorizada;
- um documento;
- uma página de projeto;
- uma importação fictícia para treino.

Não comece por automação. Comece por uma leitura pequena que consiga conferir.

## 9. Primeira saída

Depois de ingerir a fonte, execute:

```text
/briefing-manha
```

Um bom briefing declara:

- o que merece atenção;
- por que isso importa;
- quais fontes foram usadas;
- o que ainda está ausente;
- a próxima ação recomendada.

## 10. Feche a sessão

Execute:

```text
/sessao
```

O ritual registra o que mudou, decisões, aprendizados, pendências e ponto de retomada. Sem ele, parte da inteligência continua presa no chat.

> **Sempre que uma conversa produzir trabalho útil, encerre com `/sessao`.**

---

# PARTE 3 · FONTES E CONEXÕES

## 11. Conectar não é ingerir

```text
/conectar → obtém e comprova acesso a uma fonte
/ingerir  → preserva o bruto e transforma em contexto
```

Uma tela dizendo “conectado” não basta. A prova é uma leitura pequena, real, autorizada e conferida.

## 12. Ordem de conexão

1. conector ou plugin nativo;
2. MCP, API, CLI ou exportação oficial;
3. ferramenta local ativa e verificável;
4. integração personalizada;
5. importação manual quando nada disso for adequado.

Comece com permissão de leitura. Escrita, envio e automação entram depois.

## 13. Conexões já documentadas

O OS inclui playbooks para:

- Codex e Claude;
- reuniões: Fathom, Fireflies, Granola, tl;dv e Plaud;
- Google: Gmail, Calendar e Drive;
- Slack;
- WhatsApp;
- Notion e Obsidian;
- Telegram e Discord;
- GitHub;
- importação manual.

Abra `guias/conexoes/README.md` e escolha uma fonte.

## 14. Pesquisar uma conexão nova

Use:

```text
/search-connectors nome-do-aplicativo
```

A skill compara rotas atuais, requisitos, saúde, limitações e revogação. Para uma recomendação melhor, diga o objetivo:

```text
/search-connectors HubSpot. Quero ler negócios alterados nos últimos sete dias para montar um briefing comercial. Não preciso escrever nada no CRM.
```

Ela não deve instalar ou autenticar sem explicar e pedir autorização.

## 15. Checklist de uma conexão

- [ ] conta e escopo confirmados;
- [ ] documentação oficial localizada;
- [ ] permissões mínimas compreendidas;
- [ ] uma unidade real foi lida;
- [ ] origem, data e participantes foram conferidos;
- [ ] bruto foi preservado;
- [ ] `/ingerir` gerou contexto com fonte;
- [ ] fallback e revogação estão documentados;
- [ ] escrita e automação continuam desligadas até validação.

## 16. Credenciais

Nunca salve senhas, tokens, cookies ou chaves de API em Markdown, Git ou mensagens da turma. Use o login oficial no navegador, variáveis de ambiente, cofre de senhas ou armazenamento indicado pelo fornecedor.

---

# PARTE 4 · MEMÓRIA E CONTEXTO

## 17. O caminho da informação

```text
fonte original
     ↓ preservar
conhecimento/raw/
     ↓ interpretar sem apagar a origem
conhecimento/paginas/
     ↓ relacionar
pessoas · empresas · projetos · decisões · temas
     ↓ usar
briefings · planos · respostas · rotinas
```

O bruto prova. A página consolidada explica. A saída aplica.

## 18. Fato, inferência, decisão e pendência

Não misture:

- **fato:** está explícito em uma fonte;
- **inferência:** conclusão provável, mas interpretada;
- **decisão:** escolha registrada com data e justificativa;
- **pendência:** algo que ainda precisa acontecer ou ser confirmado.

Peça à IA que rotule essas categorias quando houver risco de confusão.

## 19. Proveniência

Toda nota útil deve conseguir responder:

- de onde veio;
- quando foi capturada;
- qual período representa;
- quem participou;
- o que é literal e o que foi interpretado;
- qual arquivo preserva o original.

## 20. Arquivos-roteadores

Quando a base crescer, crie mapas curtos em vez de mover tudo. Um roteador aponta cada área para o índice certo.

Prompt:

```text
Minha base cresceu. Sem reorganizar ou renomear arquivos, avalie se os roteadores atuais permitem encontrar contexto em poucos passos.

Proponha um índice mestre curto e índices por área. Cada entrada deve dizer em uma linha o que existe e para onde aponta. Preserve áreas privadas fora dos índices compartilháveis. Não escreva antes de me mostrar o mapa proposto.
```

Um índice desatualizado é pior do que nenhum. Atualize-o na mesma sessão em que um projeto ou área mudar.

## 21. Perguntas que provam a memória

- “O que mudou neste projeto nas últimas duas semanas? Cite as fontes.”
- “Quais decisões foram tomadas e qual foi a justificativa?”
- “Quais temas apareceram em reuniões e também em mensagens de trabalho?”
- “Monte uma ficha profissional deste colaborador usando apenas contexto autorizado.”
- “Onde duas fontes discordam ou deixam uma lacuna?”
- “O que estamos aprendendo repetidamente que ainda não virou processo?”

---

# PARTE 5 · SKILLS

## 22. O que é uma skill

Uma skill é um procedimento repetível que ensina a IA a produzir uma classe de resultado. Ela é a receita; API, MCP, CLI e aplicativos são ferramentas ou acessos.

Regra prática:

> Se você explicou o mesmo trabalho duas vezes, avalie transformá-lo em skill.

## 23. Skills incluídas

| Skill | Papel |
|---|---|
| `/iniciar` | onboarding e primeira vitória |
| `/registrar-projeto` | cria ou atualiza uma ficha de projeto |
| `/conectar` | escolhe, testa e registra uma fonte |
| `/search-connectors` | pesquisa formas atuais de conectar um aplicativo |
| `/ingerir` | preserva uma fonte e cria contexto derivado |
| `/consultar` | responde com evidências e lacunas |
| `/briefing-manha` | prioriza o dia |
| `/criar-rotina` | desenha um procedimento recorrente |
| `/fechar-semana` | consolida entregas, decisões e aprendizados |
| `/montar-semana` | planeja resultados dentro da capacidade |
| `/sessao` | fecha ou retoma uma sessão |

## 24. Criar uma skill própria

```text
Quero transformar um trabalho repetitivo em uma skill deste OS.

Tarefa: [descreva]
Resultado bom: [descreva]

Antes de criar arquivos, pergunte em um único bloco:
1. o que deve disparar a skill;
2. quais entradas ela precisa;
3. como reconhecer um resultado bom;
4. o que ela nunca pode fazer;
5. quais referências ou modelos já existem.

Depois proponha um contrato pequeno. Use SKILL.md como instrução ou roteador e coloque referências condicionais em arquivos separados. Não dê permissões além da tarefa. Crie primeiro na fonte canônica skills/os/, valide e rode um teste real. Só então sincronize para Codex e Claude.
```

## 25. Skills simples e skills com referências

Uma skill simples pode ter apenas `SKILL.md`. Uma skill complexa deve carregar apenas o contexto necessário:

```text
minha-skill/
├── SKILL.md
├── references/
│   ├── criterios.md
│   └── exemplos.md
├── scripts/
└── assets/
```

O arquivo principal atua como roteador. Ele não deve obrigar a IA a ler todas as referências em toda execução.

## 26. Testar uma skill

Valide comportamento, não apenas o nome do arquivo:

- pedido normal;
- entrada incompleta;
- fonte ausente;
- tentativa de ampliar escopo;
- execução em pasta limpa;
- saída observável e rastreável;
- parada antes de ação externa.

---

# PARTE 6 · ROTINAS

## 27. O que é uma rotina

Rotina é um contrato que executa uma skill ou prompt em uma cadência. Primeiro ela funciona manualmente; depois pode ser agendada.

```text
chat útil → procedimento repetível → skill validada → rotina manual → agenda
```

## 28. Três rotinas iniciais

### Briefing da manhã

Combina prioridade, agenda e comunicações já disponíveis. Não inventa informação de fontes ainda desconectadas.

### Fechamento semanal

Separa entregas, decisões, pendências, aprendizados e compromissos que precisam atravessar a semana.

### Montagem da semana

Escolhe até três resultados, considera capacidade e preserva margem para imprevistos.

## 29. Criar uma rotina

Use `/criar-rotina` e descreva:

- gatilho ou frequência;
- fontes;
- transformação;
- saída e destino;
- estados de sucesso, ausência de dados e erro;
- aprovação necessária;
- como pausar e revogar.

Toda rotina nasce em `DRAFT`.

## 30. Agendar com segurança

Só agende quando:

- a execução manual já passou;
- o computador e o runtime adequados estarão disponíveis;
- a saída tem um destino conferível;
- falhas ficam registradas;
- há forma simples de pausar;
- escrita externa ainda exige confirmação, quando houver risco.

Uma rotina local não roda com o computador desligado. Para disponibilidade contínua, será necessária uma máquina sempre ligada ou infraestrutura em nuvem. Isso é uma nova decisão de segurança, não apenas uma melhoria técnica.

Prompt:

```text
Quero agendar a rotina [nome]. Antes de configurar qualquer scheduler, confirme se ela já foi executada manualmente e mostre as evidências.

Depois me explique: frequência e fuso, pré-requisitos, destino da saída, comportamento se a máquina estiver desligada, logs, notificações, como pausar e como remover. Peça autorização antes de alterar o agendador do sistema.
```

---

# PARTE 7 · SEGUNDO CÉREBRO VISUAL

## 31. O papel da visualização

O segundo cérebro mostra como arquivos e entidades se relacionam. Ele é útil para busca, descoberta, apresentação e auditoria. Ele não substitui os Markdown.

```text
memória canônica → índice regenerável → busca/grafo → fonte original
```

## 32. Comece pequeno

V1:

- busca por nome e tema;
- filtros por tipo e período;
- lista ou grafo com poucos tipos;
- painel de detalhe;
- proveniência e caminho relativo;
- comando explícito para atualizar o índice.

Depois adicione layouts, agrupamentos e relações mais sofisticadas.

## 33. Construa com a IA

O prompt completo e os critérios de aceite estão em:

```text
guias/segundo-cerebro.md
```

Antes de construir, exija uma auditoria das entidades reais. Um gráfico com relações inventadas é decoração, não memória.

## 34. Performance

Em bases grandes:

- não anime milhares de nós sem necessidade;
- pause simulação quando não houver interação;
- filtre antes de renderizar;
- carregue detalhes sob demanda;
- mantenha lista e busca como fallback;
- informe quando o índice foi atualizado.

---

# PARTE 8 · AGENTIC OS

## 35. O que muda

O segundo cérebro ajuda a enxergar. O Agentic OS acrescenta operação:

- briefing e prioridades;
- widgets com perguntas reais;
- busca e memória;
- conexões e estado;
- rotinas e últimas saídas;
- skills executáveis;
- artefatos produzidos;
- auditoria e modo público.

## 36. O cockpit não é o OS inteiro

```text
OS = fontes + contexto + regras + memória + skills + rotinas
cockpit = uma interface local sobre esse sistema
```

Se o cockpit parar, o OS continua legível e operável pela pasta.

## 37. Ordem de construção

1. perguntas e fontes;
2. leitura e busca;
3. widgets e visualização;
4. conexões e rotinas;
5. execução de skills;
6. automação apenas depois de prova.

Nunca comece desenhando vinte widgets. Cada módulo deve responder uma pergunta e apontar para uma fonte.

## 38. Matriz antes da interface

| Pergunta | Fonte canônica | Transformação | Interface | Ação permitida |
|---|---|---|---|---|
| O que merece atenção hoje? | prioridades + briefing | ordenar e explicar | Hoje | abrir fonte |
| O que mudou no projeto? | projeto + reuniões + decisões | linha do tempo | Projetos | consultar |
| O que está conectado? | `conexoes.md` | status comprovado | Conexões | teste local |
| O que posso executar? | `skills/os/` + allowlist | catálogo de risco | Skills | prévia |
| O que o sistema produziu? | `saidas/` | ordenar e relacionar | Artefatos | abrir/remover da visualização |

## 39. Segurança mínima

- servidor apenas local em `127.0.0.1`;
- caminhos confinados à raiz do OS;
- zero CORS aberto por padrão;
- nenhuma entrada do usuário interpolada em shell;
- skills executáveis em allowlist;
- prévia, confirmação, cancelamento, relatório e auditoria;
- credenciais removidas do processo filho quando possível;
- modo público aplicado antes de enviar os dados ao navegador;
- origem visível em números, pessoas e decisões.

## 40. Prompt mestre

O prompt completo de diagnóstico, plano, construção e prova está em:

```text
guias/agentic-os.md
```

Envie esse arquivo à IA e peça uma V1 personalizada para as perguntas do seu trabalho. Não peça uma cópia visual genérica.

## 41. Instalar a camada local

Quando a IA construir o cockpit, ela deve entregar:

- `README.md`;
- arquitetura e decisões;
- comando de iniciar e parar;
- configuração de raiz e porta;
- testes automáticos;
- checklist manual;
- instalação opcional no login;
- instrução de remoção;
- registro de limitações e homologações reais pendentes.

Se usar Node.js, baixe pela fonte oficial e prefira uma versão LTS suportada pelo projeto. Não instale globalmente bibliotecas que o cockpit não precisa.

## 42. Execução por botões

Uma skill no painel deixa de ser só um botão quando existe um contrato seguro:

```text
escolher skill → preencher pedido → ver risco → gerar prévia
→ confirmar → executar → registrar saída → auditar
```

Skills que fazem perguntas no meio da execução não são boas candidatas para execução autônoma. Comece por consultas e relatórios fechados.

---

# PARTE 9 · USOS QUE GERAM VALOR

## 43. Radar multifonte

```text
Compare as atualizações profissionais disponíveis em reuniões, Slack e WhatsApp sobre [tema]. Traga apenas convergências, divergências e lacunas, cite as fontes e não exponha conteúdo pessoal.
```

## 44. Ficha de pessoa

```text
Monte uma ficha profissional de [pessoa] com papel, projetos, últimas interações de trabalho, decisões relacionadas e pendências explícitas. Use somente fontes autorizadas e marque o que for inferência.
```

## 45. Linha de decisão

```text
Reconstrua como a decisão [tema] evoluiu. Mostre origem, alternativas consideradas, quem participou, decisão final, justificativa e o que ainda falta validar.
```

## 46. Preparação de reunião

```text
Prepare meu briefing para a reunião com [pessoa/empresa]. Cruze reuniões anteriores, ficha do projeto, decisões e comunicações profissionais. Traga contexto, pontos em aberto, riscos e perguntas recomendadas.
```

## 47. Aprendizado operacional

```text
Quais problemas, dúvidas ou retrabalhos apareceram pelo menos duas vezes? Para cada padrão, recomende se deve virar decisão, checklist, skill ou rotina e cite as evidências.
```

## 48. Planejamento realista

```text
Com base nas prioridades, agenda disponível, pendências e decisões, proponha até três resultados para a semana. Explique o que ficou fora e preserve margem para operação e imprevistos.
```

---

# PARTE 10 · PRIVACIDADE, LIMITES E RECUPERAÇÃO

## 49. Modo público

Para aula, reunião ou compartilhamento de tela, use uma cópia sanitizada ou um modo público que:

- substitui pessoas e empresas por aliases;
- mascara contatos, valores, links e caminhos;
- remove estratégia sensível;
- bloqueia abertura de fonte e execução;
- não altera os originais.

Anonimização automática reduz risco, mas não substitui revisão humana nem autorização.

## 50. Ações externas

Enviar mensagem, publicar, alterar conta, comprar, instalar, apagar, mover em massa ou conceder acesso exige explicação e aprovação no momento da ação.

Autorização para ler uma fonte não autoriza escrever nela.

## 51. Plano B

Toda conexão ou demo importante precisa de fallback:

- importação manual;
- captura redigida;
- arquivo fictício marcado como DEMO;
- resposta previamente validada;
- instrução de revogação.

## 52. Quando parar

Pare e peça ajuda quando:

- a IA solicitar senha ou token em Markdown;
- uma ferramenta pedir permissão maior que o objetivo;
- não houver documentação confiável;
- a conta ou plano não suportar a função;
- o agente tentar ler fora da pasta sem autorização;
- uma automação puder enviar ou apagar algo;
- a saída misturar dados fictícios e reais.

---

# PARTE 11 · PLANO DE 14 DIAS

## Dia 1 · Base

Baixar, abrir a pasta e iniciar o onboarding.

## Dia 2 · Projeto

Registrar um projeto real e definir resultado esperado.

## Dia 3 · Primeira fonte

Importar uma reunião ou documento pequeno.

## Dia 4 · Consulta

Fazer três perguntas com fontes e lacunas.

## Dia 5 · Ritual

Trabalhar em um problema real e encerrar com `/sessao`.

## Dia 6 · Segunda fonte

Adicionar uma fonte complementar, ainda manualmente se necessário.

## Dia 7 · Fechamento

Executar `/fechar-semana`.

## Dia 8 · Planejamento

Executar `/montar-semana`.

## Dia 9 · Conector novo

Usar `/search-connectors` para pesquisar uma fonte relevante.

## Dia 10 · Primeira skill própria

Transformar um trabalho repetido em skill e testar.

## Dia 11 · Roteadores

Revisar índices e caminhos de descoberta.

## Dia 12 · Segundo cérebro

Planejar uma visualização pequena com busca e proveniência.

## Dia 13 · Rotina

Desenhar uma rotina e executá-la manualmente.

## Dia 14 · Próxima camada

Decidir, com evidências, se o próximo investimento é conexão, memória, rotina ou Agentic OS.

---

# PARTE 12 · CHECKLIST DE MATURIDADE

## Base

- [ ] pasta abre e pode ser escrita;
- [ ] agente lê as instruções;
- [ ] skills estão sincronizadas;
- [ ] existe um ponto de retomada.

## Contexto

- [ ] perfil e prioridades preenchidos;
- [ ] um projeto real registrado;
- [ ] M0 e DNA importados, se existirem;
- [ ] decisões importantes possuem data e justificativa.

## Fontes e memória

- [ ] pelo menos duas fontes autorizadas;
- [ ] bruto preservado;
- [ ] notas derivadas citam origem;
- [ ] fatos e inferências estão separados;
- [ ] uma nova sessão encontra o contexto sem reexplicação longa.

## Skills e rotinas

- [ ] uma skill própria foi testada;
- [ ] briefing da manhã é útil;
- [ ] fechamento e montagem da semana foram executados;
- [ ] rotina manual passou antes de agendamento;
- [ ] toda automação possui pausa, log e fallback.

## Visualizações

- [ ] busca encontra pessoa, projeto e decisão;
- [ ] segundo cérebro aponta para fontes reais;
- [ ] índice é regenerável;
- [ ] visualização informa data de atualização;
- [ ] modo público foi ensaiado.

## Agentic OS

- [ ] cada widget responde uma pergunta definida;
- [ ] o painel não mantém uma memória paralela;
- [ ] falha de um módulo não derruba os demais;
- [ ] skills executáveis estão em allowlist;
- [ ] ações usam prévia e confirmação;
- [ ] saídas e auditoria são preservadas;
- [ ] iniciar, parar, atualizar e remover estão documentados.

---

# APÊNDICE A · ESTRUTURA DO OS

```text
os-head-ia-v0/
├── 0-eu/                 perfil, prioridades e modo de trabalho
├── empresa/              contexto institucional
├── projetos/             fichas e referências dos projetos
├── _inbox/               entrada temporária
├── conhecimento/
│   ├── raw/              fontes preservadas
│   └── paginas/          contexto consolidado
├── decisoes/             escolhas, data e justificativa
├── conexoes/             evidência e estado das fontes
├── rotinas/              contratos recorrentes
├── saidas/               briefings, relatórios e retomada
├── skills/
│   └── os/               fonte canônica das skills
├── guias/
│   ├── conexoes/
│   ├── segundo-cerebro.md
│   └── agentic-os.md
├── ferramentas/          diagnóstico e manutenção
├── AGENTS.md              contrato geral
├── CLAUDE.md              entrada do Claude Code
├── memoria.md             estado de longo prazo
└── GUIA-COMPLETO-DO-OS.md este playbook
```

---

# APÊNDICE B · COMANDOS RÁPIDOS

```text
/iniciar
/registrar-projeto
/conectar
/search-connectors
/ingerir
/consultar
/briefing-manha
/criar-rotina
/fechar-semana
/montar-semana
/sessao
```

Você também pode pedir tudo em linguagem natural. Os comandos existem para tornar o procedimento previsível e auditável.

---

# APÊNDICE C · PROMPT DE AUDITORIA DO OS

```text
Audite este OS sem alterar arquivos.

Leia AGENTS.md, memoria.md, saidas/RETOMAR.md, os índices, conexões, rotinas e o catálogo de skills. Não leia fora desta raiz.

Avalie:
1. descoberta de contexto;
2. proveniência das fontes;
3. separação entre fato, inferência, decisão e pendência;
4. skills realmente utilizáveis;
5. rotinas testadas versus apenas planejadas;
6. conexões comprovadas versus declaradas;
7. riscos de credenciais e dados pessoais;
8. desempenho da busca e dos índices;
9. adequação para segundo cérebro e Agentic OS;
10. próxima melhoria de maior impacto e menor complexidade.

Entregue uma tabela com evidência, estado, risco e recomendação. Separe claramente: validado localmente, exige conta real, exige outro dispositivo e ainda não construído.
```

---

# APÊNDICE D · FONTES OFICIAIS

Verificadas em 2026-09-02:

- OpenAI · Codex: <https://help.openai.com/en/articles/11369540>
- OpenAI · Codex CLI: <https://help.openai.com/en/articles/11096431>
- Anthropic · Claude Code: <https://docs.anthropic.com/en/docs/claude-code/getting-started>
- Node.js: <https://nodejs.org/en/download>
- GitHub · Download ZIP: <https://docs.github.com/en/repositories/working-with-files/using-files/downloading-files-from-github>
- GitHub · Clone: <https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository>

Para conexões específicas, use `guias/conexoes/README.md`. Planos, permissões, interfaces e disponibilidade mudam; valide novamente antes de instalar ou autenticar.

---

## Fechamento

O melhor OS não é o que tem mais ferramentas. É o que preserva contexto confiável, encontra a evidência certa e melhora o próximo ciclo de trabalho.

Comece pela pasta. Dê contexto. Preserve as fontes. Feche as sessões. Transforme repetição em skill, cadência em rotina e memória em interface somente quando a camada anterior já provar valor.

```text
contexto antes de autonomia
evidência antes de confiança
ritual antes de automação
```
