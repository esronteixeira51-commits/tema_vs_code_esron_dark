# Roadmap

## Gaps conhecidos (prioridade alta)

- **Entidades XML** (`&amp;`, `&lt;`, `&gt;`) sem regra dedicada — hoje caem no foreground padrão.

## Correção confirmada

- **Atributos do Rust** (`#[derive(...)]`) — inicialmente registrado como "confirmado funcionando" com base só em observação visual. Checagem com o inspector mostrou que estava **errado**: `rust-analyzer` não emite semantic token pra isso, e o scope TextMate real é `meta.attribute.rust`, que não batia com nenhuma regra do tema (`"No theme selector"` no inspector). Era um gap disfarçado de sucesso. Adicionado `meta.attribute` na regra de decorators — **reconfirmado visualmente, `derive` agora pega o laranja itálico de verdade.**
- **Java confirmado por inspector**: `@Override` e `@Deprecated` batem com o scope `storage.type.annotation.java` (uma das regras que o tema já tinha desde o início) e saem `#E2984B` itálico — sem semantic token nenhum envolvido, é TextMate puro funcionando como esperado. Primeiro caso positivo de verdade da regra de decorator, com dado, não suposição visual.
- **PHP confirmado por inspector**: `#[Obsoleto(...)]` bate com `meta.attribute.php`/`support.attribute.php` — o mesmo `meta.attribute` genérico adicionado na correção do Rust cobriu o PHP de graça, sem precisar de scope novo. `#E2984B` itálico confirmado.
- Mapeamento de decorator/atributo fechado nas linguagens principais: **funciona de verdade** em Java e PHP; **era gap, corrigido** em Rust; **é limitação confirmada, sem correção possível** em Python, TypeScript e C# (ver seção abaixo).

## Decisões em aberto

- **Licença** — ainda não definida no `README.md`. MIT é o padrão mais comum pra temas do Marketplace, mas é uma decisão do autor.

## Limitações confirmadas (não são bugs, sem correção possível)

- **Python** — decorators (`@dataclass`, decorators customizados) saem na cor de função, não na de decorator — o Pylance não emite uma categoria semântica separada pra isso, já que um decorator em Python é, de fato, uma chamada de função. `@property`/`@staticmethod` saem na cor de tipo (salmão), porque são classes embutidas por baixo. Testado e confirmado — não há scope alternativo pra "consertar", é assim que o language server categoriza. Detalhes em `docs/language-support.md`.
- **TypeScript** — mesmo comportamento do Python: decorators (`@Componente`) saem na cor de função (`#5A7FBF`), confirmado por inspector (`semantic token type: function`, sem modifier de itálico).
- **C#** — atributos (`[Obsolete]`, `[Serializable]`...) saem na cor de tipo (salmão, `#D16D6D`), não na de decorator. Confirmado por inspector: o scope é `entity.name.type.cs`, genérico demais — o mesmo usado pra qualquer referência de tipo em C#. Sem um scope mais específico só pra atributo, não dá pra diferenciar `[Obsolete]` de um `MinhaClasse obj;` comum sem também pintar toda referência de tipo de laranja, o que quebraria a categoria "Types" inteira nessa linguagem. Era registrado como "gap, fica branco" — os dois estavam errados: não fica branco (fica salmão) e não é corrigível (é limite da gramática, não scope faltando).

## Verificação pendente

A pasta `preview/` (arquivos de exemplo por linguagem) saiu do repositório publicado e ficou só de uso pessoal do autor, pra teste visual — não é mais rastreada aqui. **Bloco de linguagens principais fechado**: testadas visualmente e/ou com inspector, com resultado confirmado — C++, Java, C#, Go, Rust, CSS, HTML, JavaScript, TypeScript, TSX, XML, Python, PHP. Restam, com prioridade bem menor: Dart, Kotlin, Ruby, Scala, Swift, Elixir, Lisp, OCaml, Pascal, CMake, Dockerfile, Makefile, Terraform, Fortran, Julia, R, SQL, Lua, PowerShell, ASM, Zig — vale checar aos poucos, sem bloquear uso geral do tema.

## Ideias futuras

- Variante ajustada pra daltonismo vermelho-verde (ver nota de acessibilidade em `docs/design-philosophy.md`).
- Variante clara (light theme) usando a mesma filosofia de 8 cores.
- Publicação no VS Code Marketplace (depende de resolver `.vscodeignore`, licença, e os workflows de CI/release).