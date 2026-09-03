# Instruções para Claude Code

Siga integralmente [AGENTS.md](AGENTS.md).

Para executar um comando como `/iniciar`, leia a skill correspondente em `skills/os/iniciar/SKILL.md`. `skills/os/` é a fonte canônica. Não instale plugins ou faça ações externas sem explicar e obter aprovação.

Quando o usuário pedir para preparar o OS ou começar o onboarding, execute o bootstrap apropriado ao sistema e depois a skill `iniciar`. Se tudo funcionar, não mencione scripts, skills, sincronização, diagnóstico, contagens ou arquivos verificados. Diga somente `Tudo pronto.` e faça imediatamente a primeira pergunta da skill. Detalhes técnicos aparecem apenas em caso de erro ou pedido explícito.
