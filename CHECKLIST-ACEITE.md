# Checklist de aceite do OS Head de IA v0.5

## Pacote

- [ ] ZIP abre sem erro.
- [ ] Não contém caminhos pessoais, credenciais ou dados reais do professor.
- [ ] `COMECE-AQUI.md` é visível na raiz.
- [ ] Estrutura funciona em pasta com espaços no nome.
- [ ] ZIP contém quinze skills em `.agents/skills/` e quinze em `.claude/skills/`.
- [ ] ZIP contém o squad `squads/brand-system-builder/` completo.
- [ ] ZIP do aluno não contém a skill interna `/modo-publico`.

## Runtime

- [ ] Codex lê `AGENTS.md` e executa a skill canônica.
- [ ] Claude Code lê `CLAUDE.md` e executa a skill canônica.
- [ ] Sincronização gera as quinze skills do produto mais as de `skills/minhas/` nos dois destinos locais e remove cópias obsoletas.
- [ ] Diagnóstico falha de forma acionável quando uma pasta de skills instaladas está ausente ou dessincronizada.
- [ ] Mensagem de primeiro acesso sincroniza, diagnostica e inicia o onboarding sem depender do atalho `/iniciar`.
- [ ] Diagnóstico Bash passa em macOS/Linux.
- [ ] Diagnóstico PowerShell passa em Windows ou ambiente PowerShell equivalente.

## Ativação

- [ ] `/iniciar` retoma sem repetir perguntas.
- [ ] `/iniciar` começa pela escolha entre uso real, demonstração, importação e retomada.
- [ ] `/iniciar` não lê fora da raiz sem caminho e confirmação explícitos.
- [ ] `/iniciar` não altera skills, ferramentas ou documentação durante o uso normal.
- [ ] Skill criada pelo usuário nasce em `skills/minhas/` e sobrevive à sincronização.
- [ ] `/atualizar-os` atualiza uma instalação antiga sem mudar a impressão digital dos dados do usuário.
- [ ] Perfil e prioridade ficam salvos.
- [ ] Projeto fica registrado sem copiar código para o OS.
- [ ] Fonte bruta fica preservada.
- [ ] Nota derivada cita a fonte.
- [ ] Briefing declara fontes usadas e contexto ausente.
- [ ] `/sessao` produz um próximo passo acionável.
- [ ] `/iniciar` aceita M0 e DNA sem repetir campos já preenchidos.
- [ ] Ciclo com material DEMO termina como `onboarding: concluído com DEMO`, sem promover conteúdo fictício a estado real.
- [ ] Depois dos dados principais, o usuário escolhe uma primeira fonte por objetivo, sem precisar conhecer termos técnicos.
- [ ] Uma conexão ou importação manual comprova a primeira vitória sem instalação obrigatória.
- [ ] Catálogo diferencia conector oficial, exportação, ferramenta local e integração personalizada.
- [ ] `/conectar` roteia para Slack, reuniões, Notion/Obsidian e Telegram/Discord sem inventar instalação.
- [ ] `/search-connectors` pesquisa uma fonte atual, prioriza opções oficiais e não instala sem autorização.
- [ ] `/mapear-fontes` entrevista sem jargão, separa pessoal/profissional e produz uma prioridade sem acessar contas.
- [ ] `/design-system` diferencia marca existente de criação/rebranding e para nos gates de aprovação.
- [ ] O squad de design system pode ser conduzido sem exigir um runtime AIOX.
- [ ] Cada playbook possui teste mínimo, fallback e caminho de revogação.

## Segurança

- [ ] Nenhuma ação externa ocorre sem aprovação.
- [ ] Nenhum segredo entra no Git.
- [ ] Fontes demo permanecem marcadas.
- [ ] Conexão com falha cai para importação manual.
- [ ] Conexões externas usam domínio e documentação oficial e começam por leitura.
- [ ] Rotina nova começa em DRAFT.

## Aula

- [ ] Fluxo completo cabe em 30 minutos com dados demo.
- [ ] Projeto real pode substituir o demo sem mudar o procedimento.
- [ ] Monitoria tem diagnóstico e contingência.
- [ ] Exercício de casa separa conexões específicas por sistema operacional.
