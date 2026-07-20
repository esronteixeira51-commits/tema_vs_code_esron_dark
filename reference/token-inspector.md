# Como descobrir o scope/token de qualquer código

Ferramenta embutida no VS Code, essencial pra investigar por que algo não está pegando a cor esperada (foi assim que os gaps do C# e do XML foram identificados durante o desenvolvimento).

## Passo a passo

1. Abra o arquivo com o trecho de código em questão.
2. Coloque o cursor exatamente em cima do token que você quer investigar (ex.: em cima do `Obsolete` dentro de `[Obsolete]`).
3. `Ctrl+Shift+P` (ou `Cmd+Shift+P` no Mac) → digite **"Developer: Inspect Editor Tokens and Scopes"** → Enter.
4. Um painel abre mostrando:
   - **textmate scopes** — a lista de scopes TextMate que casam ali, do mais genérico pro mais específico.
   - **semantic token type** e **semantic token modifiers** — se houver semantic highlighting ativo pra aquele token, mostra o nome exato (ex.: `type` com modifier `defaultLibrary`).
   - **foreground** — qual cor está sendo efetivamente aplicada, e de qual regra ela veio.

## Como usar isso pra corrigir um gap

1. Identifique o token type ou scope exato mostrado no painel.
2. Abra `themes/Esron Dark-color-theme.json`.
3. Veja se esse nome já existe em `semanticTokenColors` (busque pelo token type) ou em algum `scope` de `tokenColors` (busque pelo scope TextMate).
4. Se não existir, adicione — seguindo a cor do papel semântico que faz mais sentido (ver `docs/palette.md` e `docs/design-philosophy.md`).

## Exemplo real usado no desenvolvimento

Pra confirmar que `#[derive(...)]` no Rust estava pegando a regra de decorator, o cursor foi colocado em cima de `derive` e o painel confirmou o scope batendo com uma das entradas de `meta.decorator`/`punctuation.decorator` já cobertas no tema. Pra `[Obsolete]` em C#, o mesmo processo ainda não foi concluído — é o próximo passo pra fechar esse gap (ver `docs/roadmap.md`).