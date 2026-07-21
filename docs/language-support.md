# Suporte por linguagem

Requisitos e avisos conhecidos pra ter a cobertura completa do tema em cada linguagem. Esse conteúdo antes vivia em `preview/README.md`, mas essa pasta é só de uso pessoal do autor pra teste visual e não faz parte do repositório publicado — então esse é o lugar oficial pra essa informação agora.

## Fonte com itálico de verdade

Parte da distinção visual do tema depende de itálico (comentários e decorators). Se sua fonte não tem um itálico desenhado de verdade — ou o editor está ignorando `fontStyle` — essas categorias ficam idênticas às suas "primas" em peso normal, sem aviso nenhum.

Fontes recomendadas com itálico nativo: **Fira Code**, **JetBrains Mono**, **Cascadia Code**, **Victor Mono**.

## Extensões recomendadas por linguagem

O tema usa **semantic tokens** como camada principal (mais rica) e cai no **TextMate** genérico como reserva. A cobertura completa só acontece com o language server certo rodando. Onde marcado com ⚠️, o ecossistema de extensões do VS Code pra essa linguagem é limitado — "aceitável" é o teto realista, o tema vai depender bem mais do fallback TextMate do que de semantic tokens ricos.

### Backend

| Linguagem | Extensão recomendada |
|---|---|
| C# | C# Dev Kit (ou OmniSharp) |
| Dart | Dart (`Dart-Code.dart-code`) |
| Java | Extension Pack for Java |
| Kotlin | Kotlin Language (`fwcd.kotlin`) |
| PHP | PHP Intelephense |
| Python | Pylance |
| Ruby | Ruby LSP (`Shopify.ruby-lsp`) |
| Scala | Metals |
| Swift | Swift (extensão oficial, mantida pela Swift Server Work Group) |

### Clássicas

| Linguagem | Extensão recomendada |
|---|---|
| Elixir | ElixirLS |
| Lisp | ⚠️ Alive (Common Lisp) — cobertura de semantic tokens fraca; suporte real varia bastante por dialeto |
| OCaml (`.ml`) | OCaml Platform |
| Pascal | ⚠️ Pascal (`alefragnani.pascal`) — majoritariamente TextMate, sem language server real por trás |

### DevOps

| Linguagem | Extensão recomendada |
|---|---|
| CMakeLists.txt | CMake Tools + CMake (sintaxe) |
| Dockerfile | Docker (`ms-azuretools.vscode-docker`) |
| Makefile (`.mak`) | Makefile Tools |
| Terraform (`.tf`) | HashiCorp Terraform |

### Docs

| Linguagem | Extensão recomendada |
|---|---|
| Markdown | Suporte nativo do VS Code já é bom; `markdownlint` (já usado no CI) ajuda a manter consistência |

### Ciência

| Linguagem | Extensão recomendada |
|---|---|
| Fortran (`.f90`) | Modern Fortran (usa `fortls` por trás) |
| Julia | Julia (oficial) |
| R | R (`REditorSupport.r`) — precisa do pacote `languageserver` instalado no próprio R |
| SQL | SQLTools (genérico) ou a extensão específica do seu banco (ex.: MS SQL) |

### Scripting

| Linguagem | Extensão recomendada |
|---|---|
| Bash / `.bashrc` / `.sh` | Bash IDE (`mads-hartmann.bash-ide-vscode`) |
| INI | ⚠️ Suporte quase só TextMate — não há language server relevante em uso comum |
| JSON | Suporte nativo do VS Code (já inclui validação por schema) |
| Lua | Lua (`sumneko.lua`) |
| PowerShell (`.ps1`) | PowerShell (oficial) |
| TOML | Even Better TOML |
| XML | XML Language Support by Red Hat |
| YAML | YAML (Red Hat) |

### Systems

| Linguagem | Extensão recomendada |
|---|---|
| ASM | ⚠️ Suporte fragmentado — varia por dialeto/arquitetura, majoritariamente TextMate |
| C / C++ | clangd (ou C/C++ da Microsoft) |
| Go | Go (oficial, usa `gopls`) |
| Rust | rust-analyzer |
| Zig | Zig Language |

### Web

| Linguagem | Extensão recomendada |
|---|---|
| CSS | Suporte nativo do VS Code |
| HTML | Suporte nativo do VS Code |
| JS / JSX | Suporte nativo do VS Code (serviço de linguagem do TypeScript por trás) |
| TS / TSX | Suporte nativo do VS Code |

## Avisos conhecidos por linguagem

- **Pascal, Lisp, ASM, INI** — sem language server real por trás na prática, então quase tudo cai no fallback TextMate. Isso não quebra o tema, mas o resultado visual é mais pobre: você vai ver bem menos diferenciação entre `variable`/`parameter`/`property`, por exemplo, porque essa distinção normalmente vem de semantic tokens. Cores estruturais básicas (comentário, string, número, keyword) continuam funcionando, já que essas vêm de TextMate na maioria das gramáticas.

- **Python (confirmado, testado com Pylance ativo)** — com Pylance rodando, o comportamento é sólido: variável comum fica vermelho vivo, parâmetro fica branco, e *type hints* (`nome: str`, `idade: int`) ficam roxo — o único lugar onde tipo primitivo aparece em Python. Uma variável de módulo com anotação de tipo e nunca reatribuída (ex.: `LIMITE_MAXIMO: int = 999`) é inferida como readonly automaticamente e ganha negrito, mesmo sem `const` existir na linguagem. Duas particularidades que não são bugs: (1) decorators como `@dataclass` ou um decorator seu (`@obsoleto`) saem na cor de **função** (azul), não na de decorator (laranja) — porque em Python um decorator é literalmente uma chamada de função, e o Pylance não emite uma categoria semântica separada pra isso; (2) `@property` e `@staticmethod` saem no **salmão** (cor de tipo), porque são classes embutidas do Python por baixo, não uma anotação como em Java/C#/Rust. Ver `docs/roadmap.md` — está documentado como limitação confirmada, não como gap em aberto.
- **C#** — atributos como `[Obsolete]` podem não pegar o laranja/itálico dependendo da extensão instalada; ficam na cor padrão do texto. Gap em aberto, ver `docs/roadmap.md`.
- **Rust** — `#[derive(...)]` confirmado funcionando (laranja itálico). Tipos primitivos usam um token não-padrão do `rust-analyzer` (`builtinType`); sem ele ativo, cai no fallback TextMate.
- **Shell, YAML, TOML, arquivos de config** — sem bloco de controle nem tipo, boa parte da paleta simplesmente não aparece. Esperado, não é o tema "não funcionando".
- **Vue, Svelte, Astro** — arquivos com `<script>`/`<style>`/template misturados têm suporte a semantic tokens historicamente mais instável dentro do bloco de template.
- **XML** — entidades (`&amp;`, `&lt;`) sem regra dedicada ainda. Gap em aberto, ver `docs/roadmap.md`.

## Nota de acessibilidade

Ver `docs/design-philosophy.md`, seção "Sobre acessibilidade".