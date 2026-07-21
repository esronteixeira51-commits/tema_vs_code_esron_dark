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
✓ constant.language
✓ entity.name.function
✓ support.function, support.function.builtin
✓ entity.name.type, entity.name.class, support.type
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

- Atributos do C# (`[Obsolete]`) — a extensão padrão usa um scope que ainda não identificamos com certeza; hoje cai no foreground padrão. Ver `docs/language-support.md`, seção de avisos por linguagem.
- Entidades XML (`&amp;`, `&lt;`) — sem regra dedicada ainda.

## Corrigido recentemente

- `meta.attribute` — faltava na regra de decorators; é o scope real do `#[derive(...)]` do Rust (confirmado com o inspector, scope anterior `meta.decorator` não cobria isso). Pendente reconfirmação visual.

> Este checklist reflete o arquivo de tema atual, não uma lista de metas futuras. Se adicionar um scope novo no tema, adicione a linha aqui também.