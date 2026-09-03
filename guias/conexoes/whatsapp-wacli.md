# WhatsApp com wacli — exercício de casa

Objetivo: sincronizar e pesquisar um arquivo local de mensagens para contexto. Envio fica fora da primeira aula.

Documentação oficial: <https://wacli.sh/quickstart.html>

## Por que não fazer ao vivo com toda a turma

O `wacli` pareia como dispositivo vinculado, guarda mensagens em SQLite local e pode também enviar mensagens. Isso exige consentimento, cuidado com dados de terceiros e diferenças de instalação entre sistemas.

## Instalar

macOS ou Linux com Homebrew:

```bash
brew install openclaw/tap/wacli
wacli --version
wacli doctor
```

Windows: baixe o arquivo correspondente na versão mais recente indicada pela documentação oficial e coloque `wacli.exe` em um diretório no `PATH`. Não baixe binários de links enviados por terceiros.

## Parear

```bash
wacli auth
```

O comando exibe um QR. No telefone, use **WhatsApp → Dispositivos conectados → Conectar um dispositivo**. A autenticação inicia a sincronização; acompanhe até estabilizar. Desvincular no telefone ou executar logout encerra a sessão.

## Primeiro uso permitido no OS

1. Execute `wacli doctor`.
2. Pesquise um intervalo curto ou uma conversa autorizada.
3. Exporte somente o conteúdo necessário.
4. Remova dados pessoais que não contribuam para o objetivo.
5. Execute `/ingerir` e registre origem e período.

Não habilite envio na primeira configuração. Qualquer mensagem externa exige prévia, destinatário confirmado e aprovação.

## Teste de aceite

- binário veio da fonte oficial e responde à versão;
- `doctor` não aponta corrupção;
- pareamento pode ser removido pelo telefone;
- uma busca local retorna o intervalo esperado;
- a amostra ingerida está marcada com origem, período e restrições;
- nenhum banco SQLite ou sessão é versionado no Git.

## Fallback

Use **Exportar conversa** no WhatsApp, sem mídia quando ela não for necessária, e processe o arquivo por importação manual.

