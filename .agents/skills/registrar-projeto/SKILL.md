---
name: registrar-projeto
description: Cria ou atualiza a ficha de um projeto real ou demonstrativo e, quando solicitado, orienta a clonagem segura de um repositório GitHub fora do OS. Use em /registrar-projeto, ao importar projeto do Lovable/GitHub ou ao relacionar uma pasta de trabalho ao contexto do OS.
---

# Registrar projeto

Mantenha no OS uma ficha leve e confiável. Preserve código, mídias e arquivos pesados no diretório original do projeto.

## Coletar o mínimo

Obtenha, sem repetir o que já estiver visível:

- nome e objetivo;
- natureza `REAL` ou `DEMO`;
- estado atual;
- resultado esperado;
- responsável;
- próximos passos;
- caminho local, se existir;
- URL do repositório, se existir.

Use um slug curto em `kebab-case` e crie ou atualize `projetos/<slug>.md`.

## Modelo da ficha

```markdown
# Nome do projeto

- natureza: REAL | DEMO
- estado:
- responsável:
- atualizado em: AAAA-MM-DD
- caminho local:
- repositório:

## Objetivo

## Situação atual

## Próximos passos

## Fontes e contexto

## Decisões relacionadas
```

Não escreva campos desconhecidos como fatos. Use `—` ou marque a pendência.

Se a origem estiver em `dados-demo/` ou for uma simulação, use `natureza: DEMO`, inclua `DEMO` no título e mantenha essa marca em toda referência derivada. Não tente clonar, autenticar ou verificar externamente um repositório fictício. Um projeto DEMO prova o procedimento e pode concluir uma ativação didática marcada como `concluído com DEMO`, mas não conta como projeto real do usuário.

## Se o projeto estiver no GitHub

1. Verifique se `git` está disponível.
2. Confirme que a URL aponta para o repositório esperado.
3. Pergunte em qual pasta externa ao OS o projeto deve morar.
4. Mostre o caminho final e o comando `git clone` antes de executar.
5. Se o destino já existir, inspecione-o; não sobrescreva.
6. Para repositório privado, use a autenticação existente do GitHub CLI ou Git. Nunca solicite token em texto.
7. Após a clonagem, registre caminho e URL na ficha.

Se a clonagem falhar, preserve a ficha, registre a mensagem de erro sem segredos e indique o próximo passo. O registro do projeto não depende da clonagem.

## Se o projeto vier do Lovable

Oriente o usuário a conectar o projeto ao GitHub no próprio Lovable primeiro. Use `guias/conexoes/github.md` como roteiro. Depois trate o repositório como qualquer outro projeto GitHub.

## Fechar

- Adicione ou atualize o projeto ativo em `memoria.md`.
- Registre a alteração em `conhecimento/log.md`.
- Atualize `saidas/RETOMAR.md` se esse for o foco atual.
- Mostre o link da ficha e o próximo passo concreto.
