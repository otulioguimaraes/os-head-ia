# Skills do OS

As skills canônicas ficam em `skills/os/`. Cada uma é um procedimento versionável, legível e independente da ferramenta.

Para criar atalhos locais compatíveis com agentes que descobrem skills automaticamente:

## macOS ou Linux

```bash
bash skills/sync-skills.sh
```

## Windows PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File skills/sync-skills.ps1
```

Os scripts geram cópias em `.agents/skills/` e `.claude/skills/`. Elas acompanham o ZIP e o repositório para os atalhos funcionarem na primeira abertura. Edite somente `skills/os/`; sincronize e valide antes de publicar.

Mesmo sem sincronizar, o agente deve seguir `AGENTS.md` ou `CLAUDE.md` e abrir a skill canônica quando você escrever um comando.

O pacote do aluno contém treze skills. O onboarding apresenta primeiro as capacidades essenciais; `/mapear-fontes`, `/search-connectors`, `/design-system`, `/fechar-semana` e `/montar-semana` aparecem depois da primeira ativação. Recursos usados somente pelo professor e pela operação da aula ficam fora deste pacote.
