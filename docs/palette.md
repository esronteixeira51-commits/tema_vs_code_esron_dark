# Paleta de cores — Esron Dark

## Base (fundo e UI)

| Papel | Hex |
|---|---|
| Fundo do editor | `#1D1F23` |
| Fundo do sidebar / activity bar / status bar / painel / terminal | `#191B1F` |
| Texto padrão (foreground) | `#D8DEE9` |
| Linha atual (highlight) | `#252931` |
| Seleção de texto | `#334155` |
| Cursor | `#FFFFFF` |
| Indent guide | `#30343D` |
| Indent guide ativo | `#5E81AC` |

## Sistema de 8 cores semânticas

| Cor | Hex | Peso/estilo | Papel |
|---|---|---|---|
| Azul escuro | `#4C6FE0` | **negrito** | Keywords que controlam blocos: `if`, `for`, `while`, `return`, `function`/`fn`/`def`, `class`, `struct` |
| Vermelho | `#EF5350` | normal | Variável |
| Vermelho | `#EF5350` | **negrito** | Variável readonly / const / static readonly |
| Amarelo | `#FFCB6B` | normal | Números |
| Verde | `#9ECE6A` | normal | Strings |
| Azul claro | `#7AA2F7` | normal | Funções/métodos de biblioteca, `async`/`await`, membros `static`, links de markdown |
| Cinza | `#6C7480` | *itálico* | Comentários |
| Laranja | `#E2984B` | normal | Booleanos, macros, membros de enum, labels, eventos, código inline de markdown |
| Laranja | `#E2984B` | *itálico* | Decorators / anotações |
| Roxo | `#A855F7` | normal | Tipos primitivos (`int`, `char`, `double`, `bool`, `i32`...) |

## Categorias estruturais (fora do sistema de 8)

| Categoria | Hex |
|---|---|
| Tipos definidos pelo usuário (`class`, `struct`, `enum`, `interface`) | `#D16D6D` |
| Função do usuário (não-biblioteca) | `#5A7FBF` |
| Namespace / módulo | `#81A1C1` |
| Operadores | `#7A8B99` |
| Pontuação | `#7E8899` |
| Regexp | `#8FBCBB` |
| Tag HTML/JSX | `#5FA8D3` |
| Atributo HTML/JSX (também classe/ID/pseudo-classe em CSS) | `#B48EAD` |
| Deprecated (strikethrough) | `#6C7480` |

## Cores de marca (ExFree) — terminal ANSI e Git

| Papel | Hex |
|---|---|
| Azul escuro (ANSI blue) | `#1D4ED8` |
| Azul claro (ANSI bright blue) | `#2979FF` |
| Vermelho (ANSI red) | `#DC2626` |
| Laranja (ANSI bright red) | `#EA580C` |
| Verde (ANSI green) | `#2E9E44` |
| Amarelo (ANSI yellow) | `#F5A623` |
| Roxo (ANSI magenta) | `#A855F7` |
| Ciano (ANSI cyan) | `#88C0D0` |

> Fonte da verdade: `themes/Esron Dark-color-theme.json`. Se este arquivo divergir do tema em algum valor, o tema está correto — atualize aqui.