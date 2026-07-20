# Suporte por linguagem

Requisitos e avisos conhecidos pra ter a cobertura completa do tema em cada linguagem. Esse conteúdo antes vivia em `preview/README.md`, mas essa pasta é só de uso pessoal do autor pra teste visual e não faz parte do repositório publicado — então esse é o lugar oficial pra essa informação agora.

## Fonte com itálico de verdade

Parte da distinção visual do tema depende de itálico (comentários e decorators). Se sua fonte não tem um itálico desenhado de verdade — ou o editor está ignorando `fontStyle` — essas categorias ficam idênticas às suas "primas" em peso normal, sem aviso nenhum.

Fontes recomendadas com itálico nativo: **Fira Code**, **JetBrains Mono**, **Cascadia Code**, **Victor Mono**.

## Extensões recomendadas por linguagem

O tema usa **semantic tokens** como camada principal (mais rica) e cai no **TextMate** genérico como reserva. A cobertura completa só acontece com o language server certo rodando:

| Linguagem | Extensão recomendada |
|---|---|
| Python | Pylance |
| Rust | rust-analyzer |
| C# | C# Dev Kit (ou OmniSharp) |
| C / C++ | clangd |
| Go | Go (oficial, usa `gopls`) |
| Java | Extension Pack for Java |

## Avisos conhecidos por linguagem

- **Python** — sem o Pylance ativo, variáveis podem não ganhar a cor vermelha (a gramática TextMate padrão do Python é fraca pra esse caso). Python também não tem palavra-chave de tipo primitivo — o roxo só aparece com *type hints* (`x: int`).
- **C#** — atributos como `[Obsolete]` podem não pegar o laranja/itálico dependendo da extensão instalada; ficam na cor padrão do texto. Gap em aberto, ver `docs/roadmap.md`.
- **Rust** — `#[derive(...)]` confirmado funcionando (laranja itálico). Tipos primitivos usam um token não-padrão do `rust-analyzer` (`builtinType`); sem ele ativo, cai no fallback TextMate.
- **Shell, YAML, TOML, arquivos de config** — sem bloco de controle nem tipo, boa parte da paleta simplesmente não aparece. Esperado, não é o tema "não funcionando".
- **Vue, Svelte, Astro** — arquivos com `<script>`/`<style>`/template misturados têm suporte a semantic tokens historicamente mais instável dentro do bloco de template.
- **XML** — entidades (`&amp;`, `&lt;`) sem regra dedicada ainda. Gap em aberto, ver `docs/roadmap.md`.

## Nota de acessibilidade

Ver `docs/design-philosophy.md`, seção "Sobre acessibilidade".