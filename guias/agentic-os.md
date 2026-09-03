# Como construir um Agentic OS

Um Agentic OS é a camada visual e operacional sobre o OS. Ele transforma memória, conexões, skills, rotinas e saídas em uma central de consulta e execução. Ele não substitui a pasta e não cria um banco paralelo.

## Pré-requisitos

Antes do cockpit, confirme:

- onboarding concluído;
- fontes preservadas e notas derivadas;
- `/sessao` usado com frequência;
- pelo menos uma skill validada manualmente;
- pelo menos uma rotina com saída previsível;
- segundo cérebro ou índices capazes de localizar o contexto;
- runtime local autenticado, quando houver execução de skills.

## Arquitetura recomendada

```text
fontes canônicas do OS
        ↓ adaptadores somente de leitura
estado operacional e catálogo derivado
        ↓ API local confinada
cockpit visual
        ↓ prévia + confirmação
Codex ou Claude autenticado localmente
        ↓
relatório + artefato + auditoria
```

Construa em `ferramentas/agentic-os/`. O cockpit deve abrir em `127.0.0.1`, ler caminhos relativos dentro do OS e continuar funcionando parcialmente quando uma fonte estiver ausente.

## V1 em quatro entregas

### 1. Leitura e busca

- briefing atual;
- prioridades;
- busca em pessoas, empresas, projetos, reuniões e decisões;
- origem e data de cada informação;
- estados vazio, desatualizado e erro.

### 2. Painel e visualização

- widgets que respondem perguntas reais;
- segundo cérebro pesquisável;
- layout persistente e restaurável;
- biblioteca para remover e recuperar widgets;
- modo público aplicado antes dos dados chegarem à tela.

### 3. Conexões e rotinas

- catálogo de conexões com status comprovado;
- playbook e teste local por fonte;
- rotina mostra agenda, última execução, próxima execução e saída;
- nenhuma tela diz “conectado” sem uma pequena leitura real.

### 4. Skills executáveis

- allowlist explícita;
- provedor, modelo, esforço, pedido e risco visíveis;
- prévia do comando e das áreas que podem mudar;
- confirmação literal antes da execução;
- uma execução simultânea;
- cancelamento, relatório e auditoria;
- sem `bypassPermissions`, shell interpolado ou chaves de API no processo filho.

## Prompt mestre para a IA

```text
Quero construir um Agentic OS local e personalizado sobre esta pasta.

Leia primeiro AGENTS.md, memoria.md, saidas/RETOMAR.md, conexoes.md, rotinas/, skills/os/ e os guias do OS. Não leia fora desta raiz. Não copie dados para um banco paralelo e não altere fontes canônicas.

Fase 1 - diagnóstico, sem escrever:
1. mapeie as perguntas que o painel precisa responder;
2. identifique as fontes reais para cada resposta;
3. liste skills e rotinas que já foram testadas;
4. identifique dados sensíveis, lacunas e dependências;
5. proponha uma arquitetura local, reversível e tolerante a falhas.

Fase 2 - plano:
- crie uma matriz pergunta → fonte → transformação → interface → ação;
- separe V1, depois e fora de escopo;
- defina estados vazio, carregando, desatualizado, erro e modo público;
- defina critérios de aceite observáveis e plano de remoção;
- aguarde minha aprovação antes de instalar ou criar arquivos.

Fase 3 - construção aprovada:
- crie tudo dentro de ferramentas/agentic-os/;
- vincule o servidor apenas a 127.0.0.1;
- use os Markdown e saídas existentes como fonte da verdade;
- confine abertura e escrita à raiz do OS;
- implemente primeiro leitura e busca, depois visualização, depois ações;
- qualquer skill executável usa allowlist, prévia, confirmação, cancelamento, relatório e auditoria;
- implemente modo público no servidor, não apenas escondendo elementos com CSS;
- documente iniciar, parar, atualizar, testar e desinstalar em README.md.

Fase 4 - prova:
- rode testes automáticos;
- teste uma busca, uma entidade, um widget vazio e uma falha de fonte;
- teste modo público;
- teste uma skill inofensiva com minha confirmação;
- mostre o resultado, as limitações e o que ainda exige ambiente real.
```

## O que nunca fazer

- tornar o painel a nova fonte da verdade;
- expor o servidor na rede por padrão;
- executar qualquer skill descoberta na pasta sem allowlist;
- usar shell com entrada do usuário interpolada;
- marcar conexão como ativa sem leitura comprovada;
- esconder dados sensíveis apenas no navegador;
- automatizar escrita externa antes do fluxo manual estar validado;
- prometer execução 24/7 em uma máquina que pode estar desligada.

## Critérios de aceite

- o painel responde perguntas definidas antes da interface;
- cada número e item abre sua origem;
- busca e módulos degradam separadamente;
- modo público mascara dados e bloqueia ações sensíveis;
- layout pode ser restaurado;
- toda execução informa risco e produz relatório;
- instalação e remoção são documentadas por sistema operacional;
- o OS continua legível e utilizável sem o cockpit.

## Evolução responsável

Depois da V1, avalie rotinas locais, máquina sempre ligada, sincronização entre dispositivos e agente em nuvem. Cada avanço aumenta disponibilidade e também superfície de risco. Contexto útil vem antes de autonomia; autonomia vem depois de prova, limites e revogação.
