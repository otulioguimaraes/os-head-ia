# Versão do OS Head de IA

- versão: `0.4.0`
- data: `2026-09-02`
- estágio: piloto da Formação Head de IA

## Mudanças desta versão

- novo guia completo do OS em Markdown e PDF, utilizável como playbook por uma IA;
- novos guias para segundo cérebro visual e construção segura de um Agentic OS;
- nova skill `/search-connectors`, adaptada ao contrato de documentação oficial, permissão mínima e leitura pequena;
- pacote do aluno ampliado para onze skills sincronizadas;
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
- onze skills do aluno validadas e sincronizáveis para Codex e Claude Code;
