# Filosofia de design

## Por que só 8 cores

Um tema com cor própria pra cada categoria de token (variável, parâmetro, propriedade, tipo, tipo primitivo, namespace, decorator, macro, enum member...) rapidamente passa de 15-20 cores diferentes na tela ao mesmo tempo. Isso não ajuda a leitura — vira ruído. O Esron Dark fecha deliberadamente em 8 cores nomeadas, e usa **peso (negrito) e estilo (itálico)** como uma segunda dimensão pra diferenciar categorias "parentes" sem aumentar a contagem de cores.

Exemplo concreto: variável comum e variável readonly são conceitualmente a mesma coisa (um dado), só que uma é protegida. Em vez de dar um hex novo pra "readonly", as duas usam o mesmo vermelho — a readonly só ganha negrito. O olho aprende rápido: "isso é dado" (cor) + "isso é especial" (peso), sem precisar memorizar uma décima-primeira cor.

## Por que tons apagados, não as cores vivas da logo ExFree

A logo ExFree usa uma paleta bem saturada (azul royal, vermelho vivo, amarelo-âmbar, verde, laranja — estilo Google). Cores assim são ótimas pra uma marca, que a pessoa vê por alguns segundos. Péssimas pra um editor de código, que a pessoa olha por horas seguidas. Cor muito saturada em fundo escuro cansa a vista mais rápido. Por isso o tema usa variantes suavizadas dessas cores, e reserva a versão vibrante de verdade pra lugares onde presença visual forte é desejável e o tempo de exposição é curto: a paleta ANSI do terminal e os indicadores de Git.

## Por que consolidar `boolean`/`macro`/`enumMember`/`label`/`event`/`decorator` em laranja

Nenhuma dessas categorias é "dado que muda" (vermelho), "texto" (verde) ou "número calculado" (amarelo). Todas são, de um jeito ou de outro, **rótulos fixos**: um booleano é um dos dois valores possíveis, um macro é substituído em tempo de compilação, um enum member é uma opção de um conjunto fechado, um decorator é metadado sobre a declaração abaixo dele. Juntar tudo isso em uma cor só (laranja) evita inventar uma nona ou décima cor pra conceitos que, na prática, cumprem o mesmo papel narrativo. `decorator` ganhou itálico dentro dessa família porque ele é metadado *sobre* código, não o código em si — o mesmo raciocínio usado pra comentário.

## Por que `function.defaultLibrary` deixou de ser ciano

Inicialmente, funções de biblioteca (`printf`, `console.log`) usavam um ciano (`#88C0D0`) separado do resto da paleta. Isso criava uma nona cor sem necessidade — o papel de "azul claro = utilitário comum" já existia informalmente nos modifiers `*.async` e `*.defaultLibrary` (que usavam `#7AA2F7`). Unificar tudo em `#7AA2F7` fechou o sistema em 8 cores de verdade, e criou uma conexão narrativa a mais: chamar uma função de biblioteca e usar `await` são, na prática, a mesma categoria de coisa ("delegar pra fora do seu código").

## Sobre acessibilidade

O núcleo do sistema usa vermelho, verde e laranja como três papéis centrais. Para daltonismo vermelho-verde (a forma mais comum, ~8% dos homens), essas três cores tendem a colapsar visualmente. Isso foi uma escolha consciente, não um ponto cego — está documentado aqui e no `README.md` pra quem for divulgar o tema saber disso. Uma variante com paleta ajustada pra deuteranopia é uma possibilidade de trabalho futuro (ver `docs/roadmap.md`).

## O que fica fora do sistema, de propósito

Categorias estruturais/utilitárias — tipos definidos pelo usuário, namespace, operador, pontuação, tags e atributos de HTML/JSX — não competem pela narrativa principal das 8 cores. Elas têm cor própria, mas não fazem parte do "vocabulário" central que o usuário aprende de cabeça. São coadjuvantes, não personagens principais.