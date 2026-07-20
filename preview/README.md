# Esron Dark

Tema escuro para VS Code construído em torno de um sistema fechado de **8 cores semânticas**, onde cada cor tem um significado consistente — a mesma categoria de código usa a mesma cor não importa a linguagem que você está editando. Peso (negrito) e estilo (itálico) são usados como uma segunda dimensão de codificação visual, pra diferenciar categorias que são "parentes" sem precisar inventar cor nova pra cada uma.

As cores de destaque (a paleta ANSI do terminal e os indicadores de Git) são derivadas da identidade visual da ExFree.

---

## Filosofia das cores

| Cor | Hex | Peso/estilo | Usada para |
|---|---|---|---|
| 🔵 Azul escuro | `#4C6FE0` | **negrito** | Palavras-chave que controlam blocos: `if`, `for`, `while`, `return`, `function`/`fn`/`def`, `class`, `struct` |
| 🔴 Vermelho | `#EF5350` | normal | Variáveis — o dado que muda |
| 🔴 Vermelho | `#EF5350` | **negrito** | Variável readonly / const / static readonly — mesmo dado, mas protegido |
| 🟡 Amarelo | `#FFCB6B` | normal | Números |
| 🟢 Verde | `#9ECE6A` | normal | Strings / texto do programa |
| 🔵 Azul claro | `#7AA2F7` | normal | Funções e métodos de biblioteca (`printf`, `console.log`, `Math.sqrt`), `async`/`await`, membros `static`, links de markdown |
| ⚪ Cinza | `#6C7480` | *itálico* | Comentários |
| 🟠 Laranja | `#E2984B` | normal | Booleanos, macros, membros de enum, labels, eventos, código inline de markdown |
| 🟠 Laranja | `#E2984B` | *itálico* | Decorators / anotações (`@Override`, `#[derive]`, `[Obsolete]`) |
| 🟣 Roxo | `#A855F7` | normal | Tipos primitivos: `int`, `char`, `double`, `bool`, `i32`, etc. |

### O que fica fora do sistema de 8 cores (categorias estruturais)

| Categoria | Cor |
|---|---|
| Tipos definidos pelo usuário (`class`, `struct`, `enum`, `interface`) | `#D16D6D` |
| Namespace / módulo | `#81A1C1` |
| Operadores | `#7A8B99` |
| Pontuação | `#7E8899` |
| Tags HTML/JSX | `#5FA8D3` |
| Atributos HTML/JSX (também cobre seletor de classe/ID/pseudo-classe em CSS) | `#B48EAD` |

---

## Requisitos

### Fonte com suporte a itálico de verdade

Parte da distinção visual do tema depende de itálico (comentários e decorators). Se sua fonte não tem um itálico desenhado de verdade — ou o editor está ignorando `fontStyle` — essas categorias ficam idênticas às suas "primas" em peso normal, sem aviso nenhum.

Fontes recomendadas com itálico nativo:
- **Fira Code**
- **JetBrains Mono**
- **Cascadia Code**
- **Victor Mono** (itálico cursivo, ainda mais expressivo)

### Extensões recomendadas por linguagem

O tema usa **semantic tokens** como camada principal (mais rica) e cai no **TextMate** genérico como reserva. A cobertura completa só acontece com o language server certo rodando:

| Linguagem | Extensão recomendada |
|---|---|
| Python | Pylance |
| Rust | rust-analyzer |
| C# | C# Dev Kit (ou OmniSharp) |
| C / C++ | clangd |
| Go | Go (oficial, usa `gopls`) |
| Java | Extension Pack for Java |

---

## Avisos conhecidos por linguagem

- **Python** — sem o Pylance ativo, variáveis podem não ganhar a cor vermelha (a gramática TextMate padrão do Python é fraca pra esse caso). Além disso, Python não tem palavra-chave de tipo primitivo (`int x` não existe) — o roxo só aparece quando você usa *type hints* (`x: int`), então é normal ele aparecer pouco.
- **C#** — atributos como `[Obsolete]` podem não pegar o laranja/itálico dependendo da extensão instalada; ficam na cor padrão do texto (branco). Não é um erro, é uma categoria sem regra correspondente ainda.
- **Rust** — `#[derive(...)]` já testado e funcionando (laranja itálico). Tipos primitivos (`i32`, `u8`, etc.) usam um token não-padrão do `rust-analyzer` (`builtinType`); sem ele ativo, primitivos caem no fallback TextMate.
- **Shell, YAML, TOML, arquivos de config** — essas linguagens não têm bloco de controle nem tipo, então boa parte da paleta simplesmente não aparece. O arquivo fica mais neutro visualmente — isso é esperado, não é o tema "não funcionando".
- **Vue, Svelte, Astro** — arquivos com `<script>`/`<style>`/template misturados no mesmo arquivo têm suporte a semantic tokens historicamente mais instável dentro do bloco de template. Vale testar antes de confiar 100%.

---

## Nota de acessibilidade

O sistema usa vermelho, verde e laranja como três das cores centrais. Para daltonismo vermelho-verde (a forma mais comum, ~8% dos homens), essas três tendem a ficar parecidas entre si — a distinção "variável" vs "string" vs "constante" pode se perder. Se isso for importante pro seu público, considere isso ao divulgar o tema.

---

## Créditos

Paleta base inspirada em Nord e Tokyo Night. Cores de destaque (terminal ANSI e indicadores de Git) derivadas da identidade visual da ExFree.