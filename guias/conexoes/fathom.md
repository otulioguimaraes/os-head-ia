# Fathom — reuniões e transcrições

Objetivo: levar uma reunião para o OS, preservar a transcrição e transformar decisões e pendências em contexto útil.

Documentação oficial: <https://developers.fathom.ai/quickstart>

## Caminho recomendado para a aula: exportação manual

1. Abra uma reunião no Fathom.
2. Copie ou exporte transcrição, resumo e itens de ação.
3. Remova dados sensíveis que não sejam necessários.
4. Salve em `_inbox/` ou entregue o texto ao agente.
5. Execute `/ingerir`.

Esse caminho funciona em macOS, Windows e Linux e não exige terminal nem chave.

## Caminho opcional: API pessoal

A API oficial permite gerar uma chave nas configurações do usuário. Segundo a documentação, a chave acessa reuniões gravadas pelo usuário ou compartilhadas com ele/equipe; não concede acesso a reuniões privadas de outras pessoas.

Não cole a chave na conversa. Guarde-a como `FATHOM_API_KEY` no ambiente local ou em um cofre de segredos.

Exemplo de teste somente leitura:

```bash
curl "https://api.fathom.ai/external/v1/meetings" \
  -H "X-Api-Key: $FATHOM_API_KEY"
```

Para buscar transcrições, a API oferece filtros e `include_transcript=true`. Comece com uma reunião e um intervalo curto. Não automatize a coleta antes de validar conteúdo, paginação e política de privacidade.

## Teste de aceite

- uma reunião real ou demo foi ingerida;
- falas e timestamps disponíveis foram preservados;
- decisões e itens de ação apontam para o bruto;
- a chave não aparece em arquivos ou histórico Git;
- `conexoes.md` registra manual, parcial ou conectado.

## Fallback

Se a API não estiver disponível no plano ou falhar, mantenha `Fathom: manual` e use exportação/cópia. A rotina do OS continua funcionando.

