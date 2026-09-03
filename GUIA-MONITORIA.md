# Guia de monitoria

## Regra principal

Ajude o aluno a completar o ciclo mínimo. Não transforme a aula em suporte de instalação de cinco integrações.

## Triagem de 90 segundos

1. A pasta inteira está aberta no agente?
2. `COMECE-AQUI.md` e `AGENTS.md` existem?
3. O agente consegue criar um arquivo na pasta?
4. `memoria.md` indica uma etapa?
5. O problema é template, runtime, Git, conexão ou conteúdo?

## Atalhos de diagnóstico

macOS/Linux:

```bash
bash ferramentas/doctor.sh
```

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File ferramentas/doctor.ps1
```

## Escada de contingência

1. Comando não reconhecido: pedir a mensagem completa de primeiro acesso de `COMECE-AQUI.md`; o aluno não precisa entender a preparação técnica.
2. Aluno não sabe o que conectar: perguntar qual resultado ajudaria mais hoje e oferecer reuniões como primeiro exemplo; usar importação manual antes de instalar qualquer coisa.
3. Atalho não descoberto: rodar o script de sincronização apropriado.
4. Git ausente: registrar o projeto sem clonar.
5. Fathom ou integração falha: usar exportação manual.
6. Sem fonte real: usar `dados-demo/` e marcar DEMO.
7. Aplicativo bloqueado: o monitor demonstra e o aluno completa em casa com o guia.

## Não fazer

- pedir senha, token ou chave no chat;
- assumir controle de conta do aluno;
- instalar ferramenta sem explicar;
- apagar a pasta para “começar de novo”;
- chamar demo de dado real;
- prometer que Windows aceita comandos de macOS.

## Evidência mínima de sucesso

Marque no checklist apenas artefatos existentes. A conversa “pareceu funcionar” não basta.
