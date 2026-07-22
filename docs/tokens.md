# Tokens cobertos — Esron Dark

Lista dos semantic tokens e TextMate scopes que o tema realmente define hoje (`themes/Esron Dark-color-theme.json`). Se um token não está aqui, ele cai no `editor.foreground` padrão (`#D8DEE9`), sem cor própria.

## Semantic tokens

✓ variable
✓ variable.readonly
✓ parameter
✓ property
✓ function
✓ method
✓ function.defaultLibrary
✓ method.defaultLibrary
✓ class
✓ interface
✓ struct
✓ enum
✓ type
✓ typeParameter
✓ enumMember
✓ type.defaultLibrary
✓ builtinType *(não-padrão, específico do rust-analyzer)*
✓ namespace
✓ keyword
✓ string
✓ number
✓ boolean *(não-padrão, específico de alguns language servers)*
✓ comment
✓ operator
✓ regexp
✓ decorator
✓ label
✓ event
✓ macro
✓ \*.declaration *(modifier)*
✓ \*.deprecated *(modifier)*
✓ \*.readonly *(modifier)*
✓ \*.defaultLibrary *(modifier)*
✓ \*.static *(modifier)*
✓ \*.async *(modifier)*

## TextMate scopes (fallback)

✓ comment, punctuation.definition.comment
✓ string
✓ constant.numeric
✓ constant.language, constant.other.class, constant.enum
✓ entity.name.function
✓ support.function, support.function.builtin
✓ entity.name.type, entity.name.class, support.type, support.class
✓ storage.type.primitive, storage.type.built-in, storage.type.built-in.primitive, keyword.type, support.type.primitive, storage.type.numeric.go
✓ storage.type *(fallback genérico — também pega `let`/`fn`/`struct` em algumas gramáticas)*
✓ variable, variable.other
✓ keyword, keyword.control, keyword.operator, storage, storage.modifier
✓ punctuation, punctuation.section, punctuation.separator, punctuation.terminator, meta.brace
✓ entity.name.tag
✓ entity.other.attribute-name
✓ markup.heading, markup.heading.markdown
✓ markup.bold
✓ markup.italic
✓ markup.underline.link, string.other.link
✓ markup.inline.raw, markup.raw
✓ markup.quote
✓ meta.decorator, punctuation.decorator, storage.type.annotation, meta.attribute

## Conhecidamente sem cobertura (gap aberto)

- Entidades XML (`&amp;`, `&lt;`) — sem regra dedicada ainda.

## Limitação confirmada (não é falta de scope)

- Atributos do C# (`[Obsolete]`) — identificado via inspector: bate com `entity.name.type.cs`, mesmo scope de qualquer referência de tipo comum. Sai salmão (`#D16D6D`), não branco como se pensava antes. Não corrigível sem afetar a coloração de tipos em geral. Ver `docs/roadmap.md`.

## Corrigido recentemente

- `meta.attribute` — faltava na regra de decorators; é o scope real do `#[derive(...)]` do Rust (confirmado com o inspector, scope anterior `meta.decorator` não cobria isso). **Confirmado visualmente que a correção funcionou.**
- `support.class` — faltava na regra de "Types"; é o scope que o PHP usa pra qualquer referência de classe/enum (não só declaração). Achado testando `Cor` dentro de um `match` em PHP.
- `constant.other.class` — faltava na regra de "Constantes especiais"; é o scope do PHP pra case de enum (`Cor::Vermelho`). Achado no mesmo teste.
- `constant.enum` — faltava também; scope diferente do anterior, usado na **declaração** do case (`case Vermelho = 'vermelho';`), não na referência. PHP usa scopes diferentes pra declaração vs. uso do mesmo case de enum.

> Este checklist reflete o arquivo de tema atual, não uma lista de metas futuras. Se adicionar um scope novo no tema, adicione a linha aqui também.