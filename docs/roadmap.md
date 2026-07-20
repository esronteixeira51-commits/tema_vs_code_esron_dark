# Roadmap

## Gaps conhecidos (prioridade alta)

- **Atributos do C#** (`[Obsolete]`, `[Serializable]`...) não estão pegando a cor de decorator em todas as configurações. Suspeita: o scope real usado pelo C# Dev Kit/OmniSharp é diferente de `meta.decorator`/`punctuation.decorator`/`storage.type.annotation` (os que o tema cobre hoje). Precisa confirmar o scope exato com `Developer: Inspect Editor Tokens and Scopes` (ver `reference/token-inspector.md`) e adicionar a regra correspondente.
- **Entidades XML** (`&amp;`, `&lt;`, `&gt;`) sem regra dedicada — hoje caem no foreground padrão.

## Decisões em aberto

- **`tsconfig.json` na raiz do projeto** — o tema é 100% declarativo (só JSON, sem código TypeScript de ativação). Não está claro se esse arquivo é necessário. Decidir entre removê-lo ou definir pra que serviria (ex.: um script de validação do tema em TS).
- **Licença** — ainda não definida no `README.md`. MIT é o padrão mais comum pra temas do Marketplace, mas é uma decisão do autor.

## Verificação pendente

A pasta `preview/` (arquivos de exemplo por linguagem) saiu do repositório publicado e ficou só de uso pessoal do autor, pra teste visual — não é mais rastreada aqui. Ela cobre bem mais linguagens do que já testamos visualmente juntos até agora (Dart, Kotlin, PHP, Ruby, Scala, Swift, Elixir, Lisp, OCaml, Pascal, CMake, Dockerfile, Makefile, Terraform, Fortran, Julia, R, SQL, Lua, PowerShell, ASM, Zig, JSX, TS, TSX). Já testamos visualmente: C++, Java, C#, Go, Rust, CSS, HTML, JavaScript, XML. Vale continuar essa checagem por conta própria antes de considerar o tema "pronto" pra todas essas linguagens — os avisos confirmados entram em `docs/language-support.md`.

## Ideias futuras

- Variante ajustada pra daltonismo vermelho-verde (ver nota de acessibilidade em `docs/design-philosophy.md`).
- Variante clara (light theme) usando a mesma filosofia de 8 cores.
- Publicação no VS Code Marketplace (depende de resolver `.vscodeignore`, licença, e os workflows de CI/release).