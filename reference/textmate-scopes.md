# TextMate scopes

## O que é

TextMate scopes são o sistema de coloração mais antigo e mais universal do VS Code (herdado do editor TextMate). Funciona por **casamento de padrão de texto** (regex definido na gramática da linguagem), não por entendimento real do código — bem mais simples que semantic tokens, mas funciona em qualquer linguagem com uma gramática `.tmLanguage`/`.tmGrammar` registrada, mesmo sem language server nenhum instalado.

É por isso que o tema define regras tanto em `semanticTokenColors` (rico, mas depende de extensão) quanto em `tokenColors` (universal, sempre funciona) — o TextMate é a rede de segurança.

## Como funciona o casamento

Um scope é uma cadeia de nomes separados por ponto, do mais genérico pro mais específico — por exemplo `storage.type.primitive.ts`. Uma regra do tema que mira em `storage.type.primitive` casa com **qualquer scope que comece com esse prefixo**, incluindo `storage.type.primitive.ts`, `storage.type.primitive.cpp`, etc. Isso é o que permite uma regra só (`"Primitive Types"`, no tema) cobrir várias linguagens ao mesmo tempo.

Esse mesmo comportamento de prefixo é o motivo de alguns efeitos "colaterais" observados durante o desenvolvimento do tema — por exemplo, a regra de atributos HTML/JSX (`entity.other.attribute-name`) também colore seletor de classe, ID e pseudo-classe em CSS, porque todos esses scopes compartilham esse mesmo prefixo.

## Prioridade quando duas regras casam

Quando mais de uma regra do `tokenColors` casa com o mesmo scope, o VS Code usa a regra mais específica (a que tem mais segmentos coincidindo), não a ordem em que aparece no arquivo.

## Pra descobrir o scope de um token específico

`Developer: Inspect Editor Tokens and Scopes` (Command Palette) — mesma ferramenta usada pra semantic tokens, mostra os dois. Ver `reference/token-inspector.md`.