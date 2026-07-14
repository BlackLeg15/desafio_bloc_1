# Attach PR Evidence — Reference

## Por que existe

`gh pr create --body-file` aceita só texto. Screenshots precisam de URL pública + embed HTML.

## Fluxo no delivery-workflow

```
run-validation → gh pr create → attach-pr-evidence → PR pronto para revisão
```

## Exemplo (simulação issue #12, PR #13)

```powershell
.\scripts\attach-pr-evidence.ps1 `
  -PrNumber 13 `
  -IssueNumber 12 `
  -ScreenshotPath "validation_harness/artifacts/02_posts_loaded.png" `
  -AltText "Posts carregados com contagem no AppBar"
```

## HTML gerado

```html
<img src="https://raw.githubusercontent.com/BlackLeg15/desafio_bloc_1/feat/12-posts-count-appbar/.github/pr-assets/issue-12/02_posts_loaded.png" width="300" alt="...">
```

## Troubleshooting

| Problema | Ação |
|----------|------|
| `gh` não reconhecido | `.\scripts\gh.ps1` ou reiniciar terminal após winget install |
| Upload falha (arquivo grande) | Script usa JSON em arquivo temp (evita limite de CLI) |
| Imagem não aparece | Confirmar branch no raw URL = branch do PR |
| Atualizar screenshot | Rodar sem `-SkipUpload` (sobrescreve via API com sha) |

## gh.ps1

Sempre usar `scripts/gh.ps1` no script — wrapper com caminho completo do executável no Windows.
