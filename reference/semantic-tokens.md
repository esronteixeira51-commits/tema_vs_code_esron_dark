# Semantic tokens

## O que é

Semantic tokens são a camada de coloração mais precisa que o VS Code suporta. Diferente de TextMate (que colore com base em padrões de texto/regex), semantic tokens vêm do **language server** de cada linguagem (Pylance pro Python, rust-analyzer pro Rust, clangd pro C/C++...), que de fato entende o código — sabe se um identificador é uma variável, um parâmetro, uma propriedade, se é readonly, se veio de uma biblioteca externa, etc.

Isso é o que permite o tema diferenciar, por exemplo, uma variável comum de uma variável readonly (`variable` vs. `variable.readonly`) — informação que um regex simples não consegue deduzir com confiança, mas que o language server sabe com certeza porque analisou o código de verdade.

## Como o tema usa isso

No `themes/Esron Dark-color-theme.json`, o bloco `semanticTokenColors` mapeia **nomes de token** (`variable`, `function`, `keyword`, `type.defaultLibrary`...) pra cores. Alguns desses nomes são padronizados pela especificação LSP (Language Server Protocol); outros são específicos de um language server só — por exemplo, `builtinType` é um token que só o `rust-analyzer` emite, não existe em outras linguagens.

Modifiers (o sufixo depois do ponto, tipo `.readonly`, `.defaultLibrary`, `.static`, `.async`) também vêm do language server, e podem ser combinados: uma variável pode ser `variable` + modifier `readonly` + modifier `static` ao mesmo tempo.

## Quando não tem semantic token

Se a linguagem não tem um language server rodando (ou o language server não implementa semantic tokens pra aquele caso), o VS Code cai automaticamente pro fallback TextMate — ver `reference/textmate-scopes.md`. Isso é transparente pro usuário, mas explica por que a mesma categoria de código pode aparecer com cor diferente dependendo de qual extensão está instalada.

## Pra depurar

`Developer: Inspect Editor Tokens and Scopes` (Command Palette) mostra, pra qualquer posição do cursor, se o token ali veio do semantic highlighting ou do TextMate, e qual o nome exato. Ver `reference/token-inspector.md`.