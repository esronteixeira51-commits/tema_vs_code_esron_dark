# Chaves de `colors` usadas no tema

Referência rápida do que cada chave do objeto `colors` (em `themes/Esron Dark-color-theme.json`) controla. Lista completa oficial: `reference/vscode-theme-reference.md`.

| Chave | Controla |
|---|---|
| `editor.background` / `editor.foreground` | Fundo e texto padrão da área de edição |
| `activityBar.*` | A barra vertical de ícones mais à esquerda (Explorer, Search, Git...) |
| `sideBar.*` | O painel lateral (árvore de arquivos, etc.) |
| `titleBar.*` | A barra de título da janela |
| `statusBar.*` | A barra inferior (branch do git, erros, encoding...) |
| `editor.lineHighlightBackground` | Fundo da linha onde o cursor está |
| `editorCursor.foreground` | Cor do cursor de texto |
| `editor.selectionBackground` | Fundo de texto selecionado |
| `editorIndentGuide.*` | As linhas verticais finas de indentação |
| `panel.*` / `panelTitle.*` | O painel inferior (Terminal, Output, Problems) |
| `terminal.background` / `terminal.foreground` | Cores base do terminal integrado |
| `terminal.ansi*` | As 16 cores ANSI clássicas — usadas por `git status`, testes, qualquer CLI colorida |
| `gitDecoration.*` | Cor do nome do arquivo no Explorer conforme o status no Git (modificado, novo, deletado...) |

## Diferença entre `colors` e `semanticTokenColors`/`tokenColors`

`colors` controla a **interface** do editor (chrome, painéis, terminal). `semanticTokenColors` e `tokenColors` controlam a **sintaxe do código** dentro do arquivo aberto — são coisas completamente diferentes, mesmo estando no mesmo arquivo JSON. Ver `reference/semantic-tokens.md` e `reference/textmate-scopes.md` pra entender a diferença entre essas duas últimas.