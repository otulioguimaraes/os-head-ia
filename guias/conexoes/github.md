# GitHub — projetos do Lovable e outros repositórios

Objetivo: manter o código em uma pasta própria e registrar no OS apenas o contexto, o caminho e as decisões.

Documentação oficial: <https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository>

## Se o projeto nasceu no Lovable

1. Abra o projeto no Lovable.
2. Use a opção de conexão/sincronização com GitHub.
3. Escolha ou crie o repositório na sua conta.
4. Confirme no GitHub que os arquivos apareceram.
5. Copie a URL HTTPS do repositório.

A interface do Lovable pode mudar. Se os nomes dos botões estiverem diferentes, procure a integração GitHub do projeto e não autorize uma organização errada.

## Clonar com Git

Escolha uma pasta de projetos **fora do OS Head de IA**. No terminal ou Git Bash:

```bash
git clone https://github.com/USUARIO/REPOSITORIO.git
```

Depois execute `/registrar-projeto` e informe o caminho local e a URL.

## Clonar com GitHub CLI

Se `gh` já estiver autenticado:

```bash
gh repo clone USUARIO/REPOSITORIO
```

Para repositórios privados, prefira GitHub Desktop ou `gh auth login`; não grave token no OS. A clonagem baixa uma cópia local completa do repositório e do histórico disponível.

## Regras de segurança

- confirme a conta e o repositório antes de clonar;
- nunca clone dentro de `conhecimento/`;
- não sobrescreva uma pasta existente;
- não execute `git push` sem o usuário pedir;
- não copie `.env` nem segredos do projeto para o OS.

## Teste de aceite

```bash
git -C "/CAMINHO/DO/PROJETO" remote -v
git -C "/CAMINHO/DO/PROJETO" status --short
```

Confira que `origin` aponta para o repositório esperado e registre o resultado na ficha do projeto.

