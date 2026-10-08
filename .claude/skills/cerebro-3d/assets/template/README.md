# Cérebro 3D

Visão 3D, local e só de leitura, das pastas escolhidas em `brain.config.json`. Gerado pela skill `/cerebro-3d` do OS Head de IA. Base: skill `3d-brain` do projeto AIS-OS (Nate Herk, licença MIT).

## Abrir

Precisa do Node.js 22 ou mais novo. Nesta pasta:

```text
node serve.mjs
```

Depois abra o link que aparece (padrão `http://localhost:4640`). Para parar: `Ctrl+C` no terminal.

## Usar

- **Arrastar** gira o cérebro. **Rolar** dá zoom. **Clicar** numa nota abre o texto. `/` vai para a busca.
- As **fontes** à esquerda ligam e desligam categorias. Shift+clique mostra só uma.
- **Ver crescer** (`D`) anima o cérebro nascendo de uma ideia até o todo, em cerca de 29 segundos. A animação segue as conexões reais entre as notas — não é a ordem em que elas foram criadas.
- **Cinema** (`C`) esconde os painéis, para apresentar. `Esc` sai.
- O botão de recarregar no topo relê as notas do disco. Também dá para rodar `node build.mjs`.

## Cuidados

- Nome, categorias, cores, pastas e porta ficam em `brain.config.json`. Mudou a porta ou o código? Reinicie o `node serve.mjs`.
- O servidor só responde no próprio computador (`127.0.0.1`) e nunca altera as suas notas.
- O modo Cinema esconde botões, **não** esconde informação. Antes de compartilhar a tela ou gravar, confira quais notas aparecem.
- `brain.config.json` e `data/` ficam fora do git (`.gitignore`). Não suba para repositório público.
- Para mudar o visual: `npm ci`, editar `src/` e rodar `npm run build:js`. As licenças das bibliotecas estão em `THIRD-PARTY-NOTICES.txt`.
