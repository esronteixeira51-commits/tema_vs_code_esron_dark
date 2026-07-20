# Changelog de desenvolvimento

Registro cronológico das decisões de design do tema — diferente do `CHANGELOG.md` da raiz (que é voltado a quem usa a extensão), este aqui documenta o *porquê* de cada mudança, pra quem for contribuir depois entender o raciocínio.

## Fase 1 — Auditoria do tema recebido

Tema inicial misturava paleta Nord com alguns tons de Tokyo Night, sem uma tabela única de referência. Problemas identificados:
- `namespace` e `operator` usavam exatamente a mesma cor (`#81A1C1`), sem distinção.
- `variable` tinha valores diferentes no `semanticTokenColors` e no `tokenColors` (TextMate) — inconsistência entre linguagens com e sem language server rico.
- Cobertura de scopes rasa: sem regra pra `punctuation`, tags/atributos HTML, ou markup de Markdown.
- Faltavam `*.foreground` pra várias áreas da UI (activity bar, sidebar, status bar, painel, terminal).

## Fase 2 — Correções estruturais

- `operator` recebeu cor própria (`#7A8B99`), separada de `namespace`.
- `variable` unificado entre semantic e TextMate.
- Cobertura ampliada: punctuation, tags/atributos HTML-JSX, headings/bold/itálico/links/código inline de Markdown.
- Foregrounds de UI adicionados.

## Fase 3 — Iteração de cores individuais

- Tipos primitivos (`int`, `char`, `double`...): vermelho vivo → **roxo** (pedido explícito) → negrito removido (pedido explícito).
- Variáveis: branco/neutro → **vermelho vivo**. Parâmetro e propriedade ficaram de fora, de propósito, pra manter "variável" como categoria específica.
- Números: laranja → **amarelo**.

## Fase 4 — Testes por linguagem

Testado manualmente, um arquivo de preview por vez: C++, Java, C#, Go, Rust, CSS, HTML, JavaScript, XML.

Bug real encontrado: comentários XML usando `<!-- ---------- texto ---------- -->` como separador visual violavam a regra do XML que proíbe `--` dentro do conteúdo de um comentário. Em parsers XML "de verdade" (não só TextMate), isso quebrava o parsing do restante do documento, que caía inteiro em cinza. Corrigido trocando `-` por `=` nos separadores.

## Fase 5 — Integração da marca ExFree

Decisão consciente: **não** usar as cores vivas da logo ExFree nas categorias de sintaxe (cansaria a vista). Em vez disso, aplicadas em:
- Paleta ANSI do terminal integrado (`terminal.ansi*`).
- Indicadores de Git no Explorer (`gitDecoration.*`).
- Um acento discreto na activity bar (`activityBar.activeBorder`).

## Fase 6 — Sistema fechado de 8 cores

Reestruturação completa a partir de uma especificação do usuário: exatamente 8 cores, com negrito/itálico como segunda dimensão de diferenciação em vez de inventar hex novo pra cada categoria "parente". Principais consolidações:
- `function.defaultLibrary`/`method.defaultLibrary` migraram de ciano (`#88C0D0`) pra azul claro (`#7AA2F7`), unificando com `*.async`/`*.defaultLibrary`/`*.static`, que já usavam esse tom.
- `boolean`, `macro`, `enumMember`, `label`, `event` e `decorator` consolidados em laranja (`#E2984B`) — "marcador especial", com `decorator` recebendo itálico pra se diferenciar (é metadado, não código executado).
- `variable.readonly`/`*.readonly` deixaram de ter hex próprio (`#BF616A`) e passaram a usar o vermelho de `variable` (`#EF5350`) em negrito.
- `string` migrou de `#A3BE8C` (verde-oliva do Nord) pra `#9ECE6A` (verde mais claramente identificável).
- `keyword` migrou de `#7A9FE6` pra `#4C6FE0` (mais escuro, derivado do azul da logo ExFree).

## Fase 7 — Auditoria do repositório publicado

Ao revisar o export do repositório, identificados arquivos de documentação que ficaram para trás em relação ao tema real: `docs/palette.md` (valor de Keywords desatualizado), `docs/syntax-map.md` (mapeamento inteiro incorreto — parecia rascunho de uma ideia anterior nunca implementada), `docs/tokens.md` (checklist não batia com os tokens reais), e a `description` do `package.json` (mencionava inspiração errada). Todos corrigidos pra bater com `themes/Esron Dark-color-theme.json`, que é a fonte da verdade.