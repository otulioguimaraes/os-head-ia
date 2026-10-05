# OS Head de IA

Um sistema operacional pessoal e profissional para trabalhar com agentes de IA sem perder contexto.

Ele transforma arquivos, reuniões, decisões e projetos em uma base organizada que pode ser consultada e reutilizada ao longo do tempo. Não é um aplicativo fechado: é uma pasta legível por você, pelo Codex e pelo Claude Code.

## Obtenha o OS

Para quem já usa Git:

```bash
git clone https://github.com/otulioguimaraes/os-head-ia.git
```

Também é possível usar **Code → Download ZIP** na [página do repositório](https://github.com/otulioguimaraes/os-head-ia). O Git não é obrigatório para usar o OS.

## Comece aqui

1. Abra [COMECE-AQUI.md](COMECE-AQUI.md).
2. Abra esta pasta no Codex ou no Claude Code.
3. Envie a **mensagem de primeiro acesso** indicada no guia; ela prepara o OS em segundo plano e começa uma conversa guiada.
4. Ao terminar, confira `saidas/RETOMAR.md`.

Nas sessões seguintes, use `/iniciar`. Se você já tiver o Documento de Contexto do Negócio (M0) ou o Documento de DNA (M2), entregue-os no onboarding. O sistema preservará os originais, aproveitará os campos explícitos e perguntará somente o que faltar.

Se ainda não tiver um ambiente instalado, use [GUIA-INSTALACAO.md](GUIA-INSTALACAO.md).

Para a jornada completa depois da aula, abra [GUIA-COMPLETO-DO-OS.md](GUIA-COMPLETO-DO-OS.md) ou envie `GUIA-COMPLETO-DO-OS.pdf` para a sua IA. O guia conduz instalação, onboarding, conexões, memória, skills, rotinas, segundo cérebro e construção de um Agentic OS.

## Primeiro resultado esperado

Em até 30 minutos, você terá:

- seu perfil e sua prioridade atual;
- um projeto real registrado;
- uma primeira fonte escolhida pelo resultado que você deseja;
- uma fonte importada sem alterar o original;
- um briefing produzido a partir do contexto disponível;
- um ponto exato de retomada.

## Como o sistema pensa

```text
fontes -> contexto organizado -> decisões -> rotinas -> entregáveis
```

O sistema preserva a origem, separa fato de interpretação e registra o que mudou. O onboarding ajuda a escolher reuniões, e-mail/agenda, WhatsApp, projetos ou arquivos sem exigir termos técnicos. Automações entram somente depois que o fluxo simples estiver funcionando.

O primeiro ciclo operacional tem três rotinas: briefing da manhã, fechamento semanal e montagem da semana. Todas começam manuais, declaram as fontes usadas e não produzem efeitos externos sem aprovação.

## Estrutura essencial

- `0-eu/`: perfil, prioridades e modo de trabalho.
- `empresa/`: contexto institucional.
- `projetos/`: fichas dos projetos; código e arquivos pesados ficam fora do OS.
- `_inbox/`: entrada temporária para triagem.
- `conhecimento/`: fontes preservadas e páginas consolidadas.
- `decisoes/`: decisões com data e justificativa.
- `rotinas/`: contratos das rotinas recorrentes.
- `saidas/`: entregáveis, registros diários e ponto de retomada.
- `skills/`: `skills/os/` traz as skills do produto; `skills/minhas/` guarda as que você cria.
- `exercicios/`: exercícios e arquivos DEMO de cada encontro.
- `squads/`: papéis, tarefas e checkpoints para construções maiores.
- `guias/`: instruções humanas, inclusive conexões.

O índice [guias/conexoes/README.md](guias/conexoes/README.md) explica quais fontes possuem conector oficial, exportação ou rota local e como testar cada uma sem começar por programação.

Quando uma fonte não estiver no catálogo, use `/search-connectors <aplicativo>`. A skill pesquisa opções atuais, prioriza o fornecedor oficial e para antes de instalar ou autenticar sem autorização.

Se você ainda não souber o que conectar, use `/mapear-fontes`. A entrevista parte do seu trabalho real, separa fontes pessoais e profissionais e entrega uma ordem segura de conexão.

O comando `/design-system` oferece dois caminhos: documentar a identidade que já existe ou conduzir o `brand-system-builder`, um squad completo para criar ou reformular estratégia, identidade, tokens, componentes e preview.

As visualizações avançadas possuem guias próprios:

- [Segundo cérebro visual](guias/segundo-cerebro.md);
- [Como construir um Agentic OS](guias/agentic-os.md).

## Compatibilidade

O conteúdo funciona em macOS, Windows e Linux. Os scripts são auxiliares; as rotinas principais continuam utilizáveis apenas conversando com o agente.

## Segurança

- Não coloque senhas, tokens ou chaves de API em arquivos Markdown.
- Use variáveis de ambiente ou um gerenciador de segredos.
- Nenhum envio, mensagem, alteração externa ou gasto deve ocorrer sem aprovação explícita.
- Não edite uma fonte bruta para “limpá-la”; produza uma versão derivada.
- Ao terminar uma sessão útil, use `/sessao` para transformar o chat em memória operacional.
