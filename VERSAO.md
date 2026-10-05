# Versão do OS Head de IA

- versão: `0.6.2`
- data: `2026-10-06`
- estágio: piloto da Formação Head de IA

## Mudanças da versão 0.6.2

- **conserto para pastas sincronizadas (iCloud "Mesa e Documentos", OneDrive, Dropbox):** a sincronização de skills e a atualização deixam de apagar e recriar pastas e passam a atualizar arquivo por arquivo, no lugar. Apagar e recriar gerava cópias de conflito como `sessao 2`, que derrubavam o diagnóstico. A sincronização também remove essas cópias quando já existem.

## Mudanças da versão 0.6.1

- exercício 1 ganha três reuniões DEMO ligadas entre si (proposta da Clínica Horizonte, reunião semanal do time, diagnóstico da Clínica Vida), para a consulta cruzar fontes;
- `AGENTS.md` ganha a regra de atualização: trocar só o que mudou e nunca remover trabalho do usuário.

## Mudanças da versão 0.6.0 (Encontro 4)

- **suas skills ganham pasta própria:** `skills/minhas/<nome>/`. A sincronização copia as skills do produto e as suas para o Claude e o Codex. Antes, uma skill criada direto em `.claude/skills/` sumia na sincronização seguinte;
- `AGENTS.md` ensina o modelo a criar skill do usuário no lugar certo e a sincronizar;
- nova skill `/atualizar-os` com os scripts `ferramentas/atualizar-os.sh` e `.ps1`: atualizam uma instalação antiga trocando só arquivos do produto, movem os antigos para `_arquivo/` e conferem que a impressão digital dos dados do usuário não mudou;
- nova skill `/conectar-treg`: objetivo do usuário → documentação atual → cadastro feito pelo usuário (US$ 1 de crédito na primeira equipe) → primeira chamada com preço aprovado → registro sem chave;
- `/criar-rotina` ganhou a etapa de escolha do nível de autonomia, com o novo guia `guias/rotinas/niveis-de-autonomia.md` (nomes conferidos em 2026-10-05: Routines do Claude Desktop, Scheduled tasks do ChatGPT desktop app);
- nova pasta `exercicios/encontro-4/` com reunião DEMO, duas faturas DEMO (conferíveis ao centavo) e o roteiro dos quatro exercícios;
- diagnóstico, verificador e empacotador passam a esperar quinze skills do produto.

## Mudanças da versão 0.5.0


- nova skill `/mapear-fontes`, com entrevista não técnica, separação pessoal/profissional, priorização e primeiro teste seguro;
- onboarding agora recomenda o mapa de fontes depois da primeira vitória, antes de ampliar conexões;
- nova skill `/design-system`, com roteamento entre extração de marca existente e criação/rebranding;
- squad completo `brand-system-builder` incorporado com quatro papéis, dezesseis tarefas, pipeline de sete fases, templates, scripts e checklists;
- execução do squad adaptada ao OS: não exige runtime específico, não instala dependências e não usa API paga sem aprovação;
- pacote do aluno ampliado para treze skills sincronizadas;

- novo guia completo do OS em Markdown e PDF, utilizável como playbook por uma IA;
- novos guias para segundo cérebro visual e construção segura de um Agentic OS;
- nova skill `/search-connectors`, adaptada ao contrato de documentação oficial, permissão mínima e leitura pequena;
- catálogo de conexões criado com rotas por objetivo, maturidade e fallback;
- novos playbooks oficiais para Codex/Claude, Slack, Fireflies, Granola, tl;dv, Plaud, Notion, Obsidian, Telegram e Discord;
- `/conectar` agora roteia cada fonte para o menor caminho oficial e não inventa endpoints ou instalações;
- todos os playbooks começam por leitura, testam uma unidade e documentam revogação;
- onboarding redesenhado para pessoas não técnicas, começando por modo, dados principais e uma conexão orientada pelo objetivo;
- `/conectar` agora oferece o caminho mais simples por fonte e trata apenas uma conexão por vez;
- leitura fora da raiz, instalação, autenticação e edição de arquivos do produto exigem autorização explícita;
- `/modo-publico` permanece fora do pacote do aluno e preservado somente no kit interno de demonstração;
- ZIP e futuro repositório agora incluem as skills instaladas em `.agents/skills/` e `.claude/skills/`;
- novo bootstrap sincroniza as skills, diagnostica o ambiente e encaminha o onboarding no primeiro contato;
- o diagnóstico agora detecta cópias ausentes ou dessincronizadas, em vez de validar somente a fonte canônica;
- datas da fonte e da captura agora possuem regras distintas e verificáveis na ingestão;
- projetos demonstrativos recebem natureza `DEMO` e não disparam clonagem ou verificação externa;
- decisões fictícias permanecem isoladas dos logs reais do usuário;
- ativação didática completa usa o estado explícito `onboarding: concluído com DEMO`;
- `/iniciar` aceita M0 (contexto do negócio) e M2 (DNA) como entradas fundacionais opcionais;
- `/sessao` relê conversa e arquivos alterados para preservar inteligência operacional;
- treze skills do aluno validadas e sincronizáveis para Codex e Claude Code;
