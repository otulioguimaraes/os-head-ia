# Google — Gmail, Calendar e Drive

Objetivo: permitir briefings e planejamento com e-mail, agenda e documentos, começando por leitura e por um intervalo curto.

Referência usada neste template: `gog`, CLI local-first do ecossistema OpenClaw: <https://gogcli.sh/quickstart.html>

## Caminho recomendado para a aula

Não configurar ao vivo para toda a turma. Use uma exportação pequena ou `dados-demo/` e deixe a conexão real como exercício acompanhado.

## Opção manual

- Agenda: exporte ou copie os compromissos da semana.
- Gmail: copie apenas e-mails relevantes, removendo assinaturas e dados sensíveis.
- Drive: baixe o documento necessário e execute `/ingerir`.

## Opção CLI com `gog`

O `gog` suporta Gmail, Calendar, Drive e outros serviços do Google Workspace. A configuração exige um cliente OAuth no Google Cloud e autorização no navegador; não é apenas “colar uma API”.

No macOS ou Linux com Homebrew:

```bash
brew install openclaw/tap/gogcli
gog --version
```

Depois siga o quickstart oficial para criar/selecionar o projeto Google Cloud, obter o cliente OAuth de aplicativo desktop e autorizar somente os serviços necessários.

Antes de criar projeto, habilitar APIs ou abrir autenticação, inspecione o plano quando a versão instalada oferecer o modo dry-run indicado na documentação:

```bash
gog auth setup voce@exemplo.com --gcloud-project meu-projeto --dry-run --json --no-input
```

Exemplo de escopo inicial:

```bash
gog auth add voce@exemplo.com --services gmail,calendar,drive
```

Windows: use o ZIP oficial descrito na página de instalação do projeto. Não tente adaptar comandos Homebrew.

## Princípios

- leitura antes de escrita;
- uma conta e três serviços no máximo no primeiro teste;
- um dia de agenda e até dez e-mails no teste inicial;
- credenciais OAuth no armazenamento do sistema/ferramenta, nunca no repositório;
- nenhum envio ou alteração de agenda sem aprovação explícita.

## Teste de aceite

- listar a agenda de hoje;
- buscar no máximo dez mensagens recentes;
- ingerir uma amostra preservando a origem;
- confirmar que o OS não contém credenciais;
- registrar limitações em `conexoes.md`.

