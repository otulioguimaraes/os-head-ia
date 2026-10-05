# Instalação — macOS, Windows e Linux

Escolha **uma** rota. Você não precisa instalar Codex e Claude Code ao mesmo tempo.

## Rota A — Codex no aplicativo desktop

Recomendada para quem prefere uma interface visual.

Referência oficial: <https://help.openai.com/en/articles/11369540-getting-started-with-codex>

### macOS e Windows

1. Instale ou atualize o aplicativo ChatGPT para desktop pela fonte oficial da OpenAI.
2. Entre com sua conta ChatGPT.
3. Selecione **Codex** no menu do aplicativo.
4. Crie uma nova tarefa local e escolha **Abrir pasta**.
5. Selecione a pasta descompactada `os-head-ia-v0.6`.
6. Autorize somente o acesso necessário a essa pasta.
7. Envie a mensagem de primeiro acesso disponível em `COMECE-AQUI.md`.

Se a opção Codex não estiver disponível, isso pode depender de versão, plano ou política do workspace. Use a rota Claude Code ou peça ajuda no plantão; não compartilhe sua senha.

## Rota B — Codex CLI

Útil no macOS e Linux; no Windows, prefira o aplicativo desktop ou WSL se já souber usá-lo.

Referência oficial: <https://help.openai.com/en/articles/11096431>

Com Node.js e npm já instalados:

```bash
npm install -g @openai/codex
codex
```

Siga o login oficial exibido pela ferramenta. Depois navegue até a pasta do OS e execute `codex` nela. Não cole chave de API em Markdown ou em mensagens da turma.

## Rota C — Claude Code

Referência oficial: <https://docs.anthropic.com/en/docs/claude-code/getting-started>

Requisitos e métodos podem mudar; confirme a documentação antes da aula. A rota clássica exige Node.js 18 ou superior:

```bash
npm install -g @anthropic-ai/claude-code
claude doctor
```

Depois:

```bash
cd "/caminho/para/os-head-ia-v0.6"
claude
```

Entre pela opção compatível com sua assinatura. Não use `sudo npm install -g`.

### Windows

Claude Code suporta Windows com WSL ou Git Bash conforme a documentação oficial. Para alunos sem familiaridade com terminal, use Codex Desktop como rota principal e deixe Claude Code para o plantão.

## Verificar somente se algo falhar

Normalmente você não precisa executar nenhum comando: a primeira mensagem prepara o OS. Use os comandos abaixo apenas se a monitoria pedir.

macOS ou Linux:

```bash
bash ferramentas/bootstrap.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File ferramentas/bootstrap.ps1
```

A verificação pode avisar que a outra ferramenta não está instalada. Isso não é erro: apenas uma rota é necessária.

## Problemas comuns

### O agente não reconhece `/iniciar`

Use a mensagem completa de primeiro acesso:

```text
Leia as instruções desta pasta, prepare o OS para este aplicativo e comece meu onboarding. Não leia nada fora desta pasta, não instale programas e não conecte contas sem me explicar e pedir autorização.
```

Se o atalho ainda não aparecer, continue pela mensagem completa. O onboarding funciona sem o atalho; um monitor pode orientar a reinicialização do aplicativo depois.

### A pasta está somente para leitura

Mova o template para Documentos ou outro local em que seu usuário possa criar arquivos. Não trabalhe dentro do ZIP.

### Git não está instalado

Registre o projeto sem clonar e complete a rota GitHub em casa. O onboarding continua.

### A conexão falhou

Use `guias/conexoes/importacao-manual.md`. Conexões são opcionais para a primeira vitória.
