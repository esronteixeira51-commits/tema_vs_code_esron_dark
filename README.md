# Esron Dark

Tema escuro para VS Code construído em torno de um **sistema fechado de 8 cores semânticas**: a mesma categoria de código usa a mesma cor, não importa a linguagem que você está editando. Peso (negrito) e estilo (itálico) funcionam como uma segunda dimensão de codificação visual, então categorias "parentes" (variável comum vs. readonly, marcador comum vs. anotação) se diferenciam sem precisar de cor nova.

Inspirado em Nord e Tokyo Night. Os acentos de destaque (paleta ANSI do terminal e indicadores de Git) usam a identidade visual da ExFree.

## Instalação

1. Abra o VS Code
2. `Ctrl+Shift+X` (Extensions)
3. Busque por **Esron Dark**
4. `Ctrl+Shift+P` → `Preferences: Color Theme` → **Esron Dark**

Ou, a partir de um `.vsix` baixado: `Extensions` → `...` → `Install from VSIX...`

## A ideia em uma tabela

| Cor | Peso/estilo | Papel |
|---|---|---|
| 🔵 Azul escuro | negrito | Palavras-chave que controlam blocos (`if`, `for`, `class`, `fn`) |
| 🔴 Vermelho | normal / **negrito** | Variável / variável readonly |
| 🟡 Amarelo | normal | Números |
| 🟢 Verde | normal | Strings |
| 🔵 Azul claro | normal | Funções de biblioteca, `async`/`await` |
| ⚪ Cinza | *itálico* | Comentários |
| 🟠 Laranja | normal / *itálico* | Constantes especiais / decorators |
| 🟣 Roxo | normal | Tipos primitivos |

A tabela completa, com todos os valores hex e as categorias fora desse sistema, está em [`docs/palette.md`](docs/palette.md).

## Requisitos

- Uma fonte com itálico de verdade (Fira Code, JetBrains Mono, Cascadia Code, Victor Mono) — comentários e decorators dependem disso pra ficarem distinguíveis.
- O language server certo pra cada linguagem, pra ter cobertura completa de semantic tokens (Pylance, rust-analyzer, C# Dev Kit, clangd, gopls...).

Lista completa de extensões recomendadas e avisos conhecidos por linguagem: [`preview/README.md`](preview/README.md).

## Documentação

- [`docs/palette.md`](docs/palette.md) — todos os valores hex
- [`docs/design-philosophy.md`](docs/design-philosophy.md) — o porquê de cada decisão
- [`docs/syntax-map.md`](docs/syntax-map.md) — resumo rápido de leitura
- [`docs/roadmap.md`](docs/roadmap.md) — gaps conhecidos e próximos passos
- [`preview/`](preview/) — arquivo de exemplo por linguagem, pra testar visualmente
- [`reference/`](reference/) — material de apoio pra quem for contribuir

## Contribuindo

Pull requests são bem-vindos — principalmente relatando categorias que não estão pegando cor em alguma linguagem específica. Use `Developer: Inspect Editor Tokens and Scopes` (Command Palette) pra descobrir o scope exato; veja [`reference/token-inspector.md`](reference/token-inspector.md).

## Licença

[a definir]