# Encontro 4 — o OS na rotina

> A escada: **conversa → skill → rotina**. Em cada exercício o professor faz o dele com o arquivo `DEMO`. Depois você faz o seu, com o seu arquivo.
> Antes de começar: abra a pasta do seu OS no Claude Desktop (aba Code) ou no ChatGPT desktop app (antigo Codex).

---

## Exercício 1 — O seu material entra no OS (15 min)

**Seu material:** o que você usa para trabalhar: a transcrição de uma reunião (Fathom, Zoom, Meet, tl;dv, Fireflies), uma ata, um e-mail importante, uma conversa exportada, uma proposta, um documento interno. Comece com 2 ou 3 arquivos sobre o mesmo assunto.
**Arquivos de treino:** a pasta [`1-ingestao/`](1-ingestao/) traz **8 fontes DEMO da Orbe Studio**, de 01 a 09/10, que contam a mesma história por pedaços:

| Fonte | Tipo |
|---|---|
| `equipe-e-clientes-orbe-studio-DEMO.md` | documento interno: quem é quem e os clientes |
| `2026-10-05-email-dr-henrique-pedido-de-proposta-DEMO.md` | e-mail do cliente |
| `2026-10-06-reuniao-proposta-clinica-horizonte-DEMO.md` | reunião com o cliente |
| `2026-10-07-reuniao-semanal-time-orbe-DEMO.md` | reunião do time |
| `2026-10-07-whatsapp-marina-rafael-DEMO.md` | conversa de WhatsApp |
| `2026-10-08-reuniao-diagnostico-clinica-vida-DEMO.md` | reunião com um cliente novo |
| `2026-10-09-email-jorge-lista-de-faltas-DEMO.md` | e-mail do cliente novo |
| `2026-10-09-proposta-comercial-horizonte-v2-DEMO.md` | proposta comercial |

Nenhuma fonte sozinha conta a história inteira: uma decisão muda de um dia para o outro, uma pessoa nova aparece num e-mail, um sistema liga duas clínicas.

1. Coloque os arquivos dentro de `_inbox/`.
2. Peça:
   > Faça a ingestão dos arquivos que coloquei no `_inbox/`.
3. Abra `conhecimento/paginas/` e veja o que nasceu: uma nota por fonte em `temas/`, **uma página por pessoa** em `pessoas/` e **uma por empresa** em `empresas/`, ligadas entre si. O original de cada fonte fica guardado em `conhecimento/raw/`.
4. Faça uma pergunta que **só tem resposta cruzando as fontes**. Com os arquivos DEMO:
   > Como está a agenda de novembro da Orbe, o que mudou na proposta da Horizonte desde o dia 6 e o que a Marina precisa confirmar para a Clínica Vida, e até quando?

   Ou:
   > Quem precisa aprovar a proposta da Horizonte, do que depende o início em 16 de novembro e o que a Clínica Vida tem em comum com a Horizonte?
5. Veja o cérebro crescer:
   > /cerebro-3d

   As pessoas, as empresas e os temas viram pontos; os links entre eles viram conexões. (Precisa do Node.js 22 ou mais novo; a skill confere e explica como instalar.)

**Pronto quando:** a resposta cita os arquivos de origem e existem páginas em `conhecimento/paginas/` para as fontes, para cada pessoa e para cada empresa, ligadas entre si.

---

## Exercício 2 — Uma análise vira skill (15 min)

**Seu arquivo:** algo que você analisa todo mês. De preferência a fatura do cartão **da empresa** em PDF (só se **não** tiver senha), ou um extrato, relatório de vendas ou planilha de despesas.
**Arquivos de treino:** [`2-analise/fatura-cartao-orbe-2026-10-DEMO.pdf`](2-analise/) e a do mês anterior, `fatura-cartao-orbe-2026-09-DEMO.pdf`.

> ⚠️ Fatura e extrato têm dados sensíveis. **Não compartilhe a tela** com eles abertos na aula. Guarde o arquivo em `entrada/faturas/` (essa pasta e `dados/` ficam fora do Git, para nunca subirem por engano).

1. Crie a pasta `entrada/faturas/`, coloque o arquivo nela e peça a análise. Com a fatura DEMO:
   > Analise a fatura de outubro que está em `entrada/faturas/`. Quero: o total por categoria, as 5 maiores despesas, as assinaturas recorrentes e o que mudou em relação à fatura de setembro.
2. Peça para guardar os dados:
   > Salve todos os lançamentos num banco SQLite em `dados/financas.db`, com data, descrição, parcela, valor e categoria. Se não der para usar SQLite neste computador, salve em `dados/financas.csv`.
3. **A conferência que torna a análise confiável:**
   > Some os lançamentos que você extraiu e compare com o valor das compras do período impresso na fatura (na DEMO: "Compras, créditos e encargos do período"). Se não bater ao centavo, explique a diferença linha a linha.

   Numa fatura real, o total a pagar pode incluir saldo anterior, juros ou parcelas de outro jeito. A conferência não é "bater de qualquer jeito": é **explicar cada centavo de diferença**.
4. Quando o resultado estiver bom:
   > Ficou bom. Crie uma skill para isso, para eu rodar todo mês com a fatura nova que eu colocar em `entrada/faturas/`. A conferência é obrigatória na skill.
5. Confira: a skill nasceu em `skills/minhas/<nome>/SKILL.md`.

**Pronto quando:** a análise saiu, o total bateu ao centavo e a skill existe em `skills/minhas/`.

> 💡 Se o seu PDF for uma imagem escaneada, a IA vai precisar ler o texto da imagem (OCR). Funciona, mas erra mais. A conferência do total é o que mostra se deu certo.

---

## Exercício 3 — A skill vira rotina (15 min)

**Guia:** [`3-rotina/`](3-rotina/LEIA-ME.md) e [`../../guias/rotinas/niveis-de-autonomia.md`](../../guias/rotinas/niveis-de-autonomia.md)

1. Peça:
   > /criar-rotina com a skill que criei no exercício 2. Ela deve rodar todo dia 11, às 8h, com a fatura nova que estiver em `entrada/faturas/`. Se não houver fatura nova, ela registra "sem fatura nova" e para.
2. Revise o contrato que nasceu em `rotinas/<nome>.md`: gatilho, fontes, saída, limites.
3. Rode a rotina uma vez à mão.
4. Escolha o nível de autonomia. Se o computador fica ligado, agende no **nível 2** (o OS te guia pelo app que você usa).
5. Para provar o agendamento sem esperar o mês inteiro: agende primeiro **um disparo de teste para daqui a 5 minutos**, confira a saída e só então mude para todo dia 11.

**Pronto quando:** existe `rotinas/<nome>.md` com os limites preenchidos e uma execução registrada.

> ⚠️ A rotina **lê e rascunha**. Ela não envia, não publica, não paga e não apaga nada sem o seu OK.

---

## Exercício 4 — Dados de fora com a TREG (opcional, 10 min)

**Guia:** [`4-treg/LEIA-ME.md`](4-treg/LEIA-ME.md)

1. Peça:
   > /conectar-treg
2. Responda o que você quer fazer com dados de fora.
3. Faça o cadastro com as suas mãos e crie a **sua** equipe (é onde cai o crédito de US$ 1).
   No Claude Desktop o conector personalizado funciona em Mac e Windows. No ChatGPT, depende do plano.
4. Aprove o preço e faça **uma** chamada.

**Pronto quando:** o saldo aparece, uma chamada voltou com resultado e a conexão está registrada em `conexoes.md`, sem a chave.

---

**No fim de cada exercício:** rode `/sessao`.
