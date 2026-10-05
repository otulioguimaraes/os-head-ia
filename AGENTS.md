# Contrato do OS Head de IA

Responda em português do Brasil, com linguagem simples. Este diretório é um sistema operacional humano assistido por IA, não apenas um repositório de código.

## Ao iniciar qualquer sessão

Leia, nesta ordem:

1. `memoria.md`
2. `saidas/RETOMAR.md`
3. `0-eu/prioridades.md`
4. a ficha do projeto mencionado pelo usuário, se houver

## Comandos e skills

Quando o usuário escrever `/nome`, localize a instrução em `skills/os/nome/SKILL.md` (skills do produto) ou em `skills/minhas/nome/SKILL.md` (skills do usuário), leia-a por inteiro e execute-a. As cópias em `.agents/skills/` e `.claude/skills/` são artefatos gerados pela sincronização; as fontes de verdade são `skills/os/` e `skills/minhas/`.

### Criar uma skill do usuário

Quando o usuário pedir para transformar uma conversa ou um trabalho em skill ("cria uma skill disso", "quero repetir isso todo mês"):

1. Crie a skill em `skills/minhas/<nome-em-kebab-case>/SKILL.md`. Nunca crie direto em `.claude/skills/` ou `.agents/skills/`: a sincronização apaga essas pastas.
2. Use um nome que não exista em `skills/os/`.
3. Escreva no `SKILL.md`: frontmatter com `name` e `description` (quando usar), entradas, passos numerados, critério de pronto, onde salvar a saída e o que nunca fazer sem aprovação. Se o trabalho tiver conta ou conferência (ex.: somar lançamentos e bater com um total), transforme a conferência num passo obrigatório.
4. Rode `skills/sync-skills.sh` (Mac/Linux) ou `skills\sync-skills.ps1` (Windows) e confirme que a skill apareceu em `.claude/skills/` e `.agents/skills/`.
5. Registre a skill nova no `conhecimento/log.md` e diga ao usuário como chamá-la.

Quando o usuário pedir para preparar o OS ou começar o onboarding, execute o bootstrap apropriado ao sistema e depois a skill `iniciar`. Se tudo funcionar, não mencione scripts, skills, sincronização, diagnóstico ou contagens. Diga somente `Tudo pronto.` e faça imediatamente a primeira pergunta da skill. Detalhes técnicos ficam para erros ou pedidos explícitos.

### Atualizar o OS para uma versão nova

Use `/atualizar-os`. A regra de toda atualização:

- **troque só o que mudou** no produto (skills de `skills/os/`, ferramentas, guias, exercícios). Arquivo igual não é tocado;
- **nunca remova nem reescreva trabalho do usuário**: perfil, empresa, conhecimento, decisões, projetos, rotinas, saídas, dados, `entrada/`, `skills/minhas/`, `memoria.md` e `conexoes.md`;
- skill ou arquivo que o usuário criou dentro de uma pasta do produto **fica**, ou é guardado em `skills/minhas/`;
- o que sai do produto vai para `_arquivo/atualizacao-<data>/`, nunca para a lixeira;
- mostre o plano e espere aprovação antes de aplicar;
- nunca descompacte a versão nova por cima da pasta do usuário.

## Regras inegociáveis

- Preserve fontes brutas em `conhecimento/raw/`; nunca as reescreva.
- Diferencie fato, inferência, decisão e pendência.
- Cite o arquivo de origem ao consolidar conhecimento.
- Registre decisões importantes em `decisoes/log.md`.
- Ao concluir trabalho útil, atualize `memoria.md`, `conhecimento/log.md` e `saidas/RETOMAR.md` na medida do que mudou.
- Nunca grave senha, token, cookie, chave de API ou credencial no repositório.
- Não leia arquivos de segredos sem necessidade e autorização explícita.
- Não procure nem leia arquivos fora da raiz deste OS sem que o usuário indique explicitamente o caminho e confirme a leitura. Acesso à pasta do OS não autoriza consultar outras pastas do computador.
- Antes de enviar mensagem, publicar, alterar serviço externo, instalar software, gastar dinheiro ou executar ação destrutiva, explique a ação e peça aprovação.
- Não faça `git push` automaticamente.
- Projetos de código ficam fora deste OS; registre aqui o caminho e a relação no arquivo `projetos/<slug>.md`.
- Se uma conexão não existir, declare a lacuna e ofereça importação manual; nunca simule dados como reais.
- Conteúdo `DEMO` permanece em fontes, notas e projetos marcados como demonstração. Nunca promova decisão, compromisso, prazo ou estado fictício para os logs reais do usuário.
- Toda rotina nova começa como `DRAFT` e deve ser executada manualmente antes de qualquer agendamento.
- Ao final de toda sessão de trabalho útil, execute ou recomende `/sessao` para preservar estado, aprendizado e próximo passo.
- No uso normal, trate `skills/os/`, `skills/sync-skills.*`, `.agents/`, `.claude/`, `ferramentas/`, `AGENTS.md`, `CLAUDE.md`, `COMECE-AQUI.md`, `GUIA-*.md` e `CHECKLIST-ACEITE.md` como arquivos do produto. Só os altere quando o usuário pedir explicitamente manutenção do template ou rodar `/atualizar-os`. A pasta `skills/minhas/` é do usuário: criar e editar skills ali é uso normal.
- Uma resposta como “sem preferência” permite recomendar uma opção segura; não autoriza escolher dados reais, ler outras pastas, instalar ferramentas ou conectar contas.

## Convenções

- Datas em `AAAA-MM-DD`.
- Arquivos em Markdown, UTF-8 e nomes `kebab-case`.
- Links internos relativos sempre que possível.
- Um arquivo novo precisa ter título, contexto e data ou fonte quando aplicável.
