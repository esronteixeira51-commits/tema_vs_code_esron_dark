# Roadmap

## Gaps conhecidos (prioridade alta)

- **Atributos do C#** (`[Obsolete]`, `[Serializable]`...) não estão pegando a cor de decorator em todas as configurações. Suspeita: o scope real usado pelo C# Dev Kit/OmniSharp é diferente de `meta.decorator`/`punctuation.decorator`/`storage.type.annotation` (os que o tema cobre hoje). Precisa confirmar o scope exato com `Developer: Inspect Editor Tokens and Scopes` (ver `reference/token-inspector.md`) e adicionar a regra correspondente.
- **Entidades XML** (`&amp;`, `&lt;`, `&gt;`) sem regra dedicada — hoje caem no foreground padrão.

## Decisões em aberto

- **Licença** — ainda não definida no `README.md`. MIT é o padrão mais comum pra temas do Marketplace, mas é uma decisão do autor.

## Limitações confirmadas (não são bugs, sem correção possível)

- **Python** — decorators (`@dataclass`, decorators customizados) saem na cor de função, não na de decorator — o Pylance não emite uma categoria semântica separada pra isso, já que um decorator em Python é, de fato, uma chamada de função. `@property`/`@staticmethod` saem na cor de tipo (salmão), porque são classes embutidas por baixo. Testado e confirmado — não há scope alternativo pra "consertar", é assim que o language server categoriza. Detalhes em `docs/language-support.md`.

## Verificação pendente

A pasta `preview/` (arquivos de exemplo por linguagem) saiu do repositório publicado e ficou só de uso pessoal do autor, pra teste visual — não é mais rastreada aqui. Já testamos visualmente, com resultado confirmado: C++, Java, C#, Go, Rust, CSS, HTML, JavaScript, XML, **Python**. Ainda faltam, entre as linguagens mais usadas: **TypeScript/TSX** e **PHP** — prioridade antes de considerar o tema pronto pra uso geral. O restante da lista (Dart, Kotlin, Ruby, Scala, Swift, Elixir, Lisp, OCaml, Pascal, CMake, Dockerfile, Makefile, Terraform, Fortran, Julia, R, SQL, Lua, PowerShell, ASM, Zig, JSX) é menos prioritário, mas vale checar aos poucos.

## Ideias futuras

- Variante ajustada pra daltonismo vermelho-verde (ver nota de acessibilidade em `docs/design-philosophy.md`).
- Variante clara (light theme) usando a mesma filosofia de 8 cores.
- Publicação no VS Code Marketplace (depende de resolver `.vscodeignore`, licença, e os workflows de CI/release).