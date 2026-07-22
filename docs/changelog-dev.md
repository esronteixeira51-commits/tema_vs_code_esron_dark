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

## Fase 8 — Verificação com o Inspect Editor Tokens and Scopes

Duas suposições anteriores foram checadas com o inspector oficial do VS Code, em vez de só observação visual:

- **Decorator em TypeScript**: confirmado que `@Componente(...)` recebe semantic token type `function` (igual Python com Pylance), sem nenhum modifier de itálico — o TypeScript também não emite uma categoria "decorator" separada, porque um decorator é sintaticamente uma referência a função. A hipótese anterior de que TS se comportaria diferente do Python estava errada; é a mesma limitação, mesma causa raiz. A regra de `decorator` laranja itálico do tema só é confirmada em linguagens com um modelo semântico de anotação genuinamente separado — ainda não verificamos isso com o inspector em nenhuma linguagem, só por observação visual (Java, Rust). Fica como verificação pendente.
- **Namespace em TypeScript**: confirmado semantic token type `namespace`, modifier `declaration`, cor `#81A1C1` (o valor antigo) com negrito vindo do wildcard `*.declaration`. A cor estava correta tecnicamente, mas próxima demais do azul claro (`#7AA2F7`) dos utilitários a ponto de gerar confusão visual real, mesmo sabendo qual era qual. `namespace` migrou de `#81A1C1` pra `#8A7FA8` (lilás-acinzentado), saindo da família de azuis por completo.

## Fase 9 — Uma "confirmação" visual anterior era, na verdade, um gap

O `#[derive(...)]` do Rust tinha sido marcado como "confirmado funcionando" com base só em observação visual, durante a Fase 6. Ao checar com o `Developer: Inspect Editor Tokens and Scopes` (mesmo processo da Fase 8), ficou claro que estava errado: o `rust-analyzer` não emite semantic token nenhum pra esse caso, e o scope TextMate real é `meta.attribute.rust` — que não batia com nenhuma regra do tema (`meta.decorator`, `punctuation.decorator`, `storage.type.annotation`). O painel do inspector mostrou literalmente "No theme selector" pra esse scope. Era um gap disfarçado de sucesso.

Corrigido adicionando `meta.attribute` na regra de decorators. Fica registrado como lição: **observação visual rápida não é confirmação confiável** quando várias cores estão na tela ao mesmo tempo — o inspector é a única fonte confiável a partir de agora pra marcar algo como "confirmado".

Continua em aberto: nenhuma linguagem tem, até agora, uma confirmação por inspector de que a regra de decorator realmente aciona uma categoria semântica própria (não caiu em "function" como Python/TypeScript). Java seria o próximo candidato a testar.

## Fase 10 — Primeiro caso positivo confirmado

`@Override` e `@Deprecated` em Java checados com o inspector: scope `storage.type.annotation.java`, sem semantic token nenhum, batendo com uma regra que o tema já tinha desde a primeira versão (`storage.type.annotation`). `#E2984B` itálico confirmado no próprio painel. Esse é o primeiro caso — de Python, TypeScript e Rust — onde a regra de decorator funciona por si só, sem precisar de correção.

Diferença notável em relação a Python/TypeScript: lá, o decorator É uma chamada de função por baixo, então o semantic token (quando existe) sobrescreve qualquer scope TextMate com a cor de função. Em Java, a anotação não é uma chamada de função — é uma construção sintática própria (`storage.type.annotation`) — e como não há semantic token pra sobrescrever, o TextMate resolve sozinho e corretamente.

Pendente: C# (`[Obsolete]`) ainda não foi checado com o inspector, só observação visual antiga ("ficou branco") — o mesmo tipo de checagem que já provou ser não confiável no caso do Rust.

## Fase 11 — Segunda "confirmação visual" que era, na verdade, um engano

`[Obsolete]` em C# tinha sido registrado como "fica branco/padrão, aceitável" com base em observação visual. O inspector mostrou os dois pontos errados: (1) não fica branco, fica **salmão** (`#D16D6D`), a cor de "Types"; (2) o scope real (`entity.name.type.cs`) é genérico demais pra ser diferenciado de uma referência de tipo comum sem quebrar a coloração de tipos em geral — então isso vira **limitação confirmada**, não gap corrigível.

Segunda vez que uma "confirmação visual" antiga se prova errada quando checada com o inspector (a primeira foi o `#[derive]` do Rust, na Fase 9). Reforça a decisão da Fase 9: nada entra como "confirmado" na documentação sem passar pelo inspector primeiro.

Com isso, o mapa de decorator/atributo está fechado nas linguagens principais: Java funciona de verdade (scope próprio); Python, TypeScript e C# não têm como funcionar, cada um por um motivo técnico diferente (decorator-é-função em Python/TS; scope-genérico-demais em C#).

## Fase 12 — Dois gaps reais achados em PHP, maiores que os anteriores

Testando `private`, `Cor` e `Vermelho` (dentro de um `match ($corEscolhida) { Cor::Vermelho => ... }`) com o inspector:

- `private` → bate com `storage.modifier`, já coberto pela regra de Keywords. Sem surpresa.
- `Cor` (referência ao enum, não a declaração) → scope `support.class.php`, **sem regra correspondente**. Diferente de `entity.name.class`/`entity.name.type` (usados pra declaração), `support.class` é o scope que o PHP usa amplamente pra qualquer *referência* a uma classe/enum — não só dentro de `match`, mas provavelmente em `new Pessoa()`, type hints, etc. Gap com impacto bem maior que os anteriores (Rust/C#/Python eram casos isolados de decorator; esse afeta referência de tipo em geral).
- `Vermelho` (o case do enum) → scope `constant.other.class.php`, também sem regra. Equivalente TextMate do que seria `enumMember` via semantic token — o Intelephense aparentemente não emite semantic token pra isso, só TextMate.

Ambos corrigidos: `support.class` adicionado à regra de "Types", `constant.other.class` adicionado à regra de "Constantes especiais". Diferente dos casos de decorator (Rust/Python/TS/C#), esses dois eram gaps de verdade — simplesmente faltava a linha, não uma limitação de linguagem.

Pendente: o teste original pedido (`#[Obsoleto]`, o atributo customizado do PHP) ainda não foi verificado.

## Fase 13 — Terceiro scope de enum do PHP

Checando `Vermelho` na **declaração** do enum (`case Vermelho = 'vermelho';`, dentro de `enum Cor: string { ... }`), diferente do teste anterior que checou a *referência* (`Cor::Vermelho` dentro do `match`): scope `constant.enum.php`, também sem regra correspondente. PHP usa três scopes diferentes pra três contextos do mesmo enum: `support.class` (referência ao tipo), `constant.other.class` (referência ao case, tipo `Cor::Vermelho`) e `constant.enum` (declaração do case). Adicionado `constant.enum` à regra de "Constantes especiais".

Com isso, PHP tem o histórico de mais correções reais de scope entre todas as linguagens testadas até agora — três gaps genuínos em uma única sessão de testes, todos de baixo risco (só adicionar scope à lista, sem mudar nenhuma cor existente).

## Fase 14 — Bloco de linguagens principais fechado

TSX testado (componente funcional com props tipadas, hooks genéricos, enum, renderização condicional, generic component). Todas as previsões de cor bateram: tags JSX na cor de tag, atributos JSX na cor de atributo, `interface`/generics em salmão, argumento de tipo primitivo dentro de `useState<number>` em roxo, enum member em laranja. Sem gap novo encontrado.

Com isso, fecha o ciclo que começou perguntando "as linguagens principais precisam de refino antes de finalizar" — resposta era sim, e o processo revelou 2 gaps reais de decorator (Rust, corrigido) + 3 gaps reais de PHP (support.class, constant.other.class, constant.enum, todos corrigidos) + 3 limitações confirmadas sem correção possível (Python, TypeScript, C#, todas documentadas) + 1 correção de design não relacionada a gap (namespace afastado do azul claro). Nenhuma cor de sintaxe central (variável, tipo, string, número, keyword, comentário) precisou de ajuste em nenhuma linguagem testada.