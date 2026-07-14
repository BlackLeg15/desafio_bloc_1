---
name: attach-pr-evidence
description: Anexa screenshot do harness na descrição de um Pull Request no GitHub (upload + embed width=300). Use após criar PR no fluxo de entrega, ou quando o usuário pedir evidências visuais no PR.
---

# Attach PR Evidence

## Quando usar

Após `gh pr create` no fluxo `delivery-workflow`, quando a issue exige screenshot do harness.

## Pré-requisitos

- `gh` autenticado (`gh auth status`)
- PR já criado
- Screenshot em `validation_harness/artifacts/` (gerado por `run-validation`)
- Branch do PR pushada

## Executar

```powershell
.\scripts\attach-pr-evidence.ps1 `
  -PrNumber <N> `
  -IssueNumber <N> `
  -ScreenshotPath "validation_harness/artifacts/02_posts_loaded.png" `
  -AltText "Descrição curta da evidência"
```

Se a screenshot **já foi enviada** à branch e só falta ajustar o PR:

```powershell
.\scripts\attach-pr-evidence.ps1 -PrNumber <N> -IssueNumber <N> -SkipUpload
```

## O que o script faz

1. Upload da PNG para `.github/pr-assets/issue-<N>/` na branch atual (GitHub API)
2. Atualiza seção `### Screenshots` do PR com `<img width="300">`
3. Preserva o restante do corpo do PR

## Padrão visual

- **width=300** — legibilidade do PR sem dominar a página
- HTML `<img>` (Markdown puro não controla largura no GitHub)

## Parâmetros opcionais

| Parâmetro | Default | Uso |
|-----------|---------|-----|
| `-ImageWidth` | `300` | Largura da imagem no PR |
| `-Branch` | branch atual | Branch com raw URL da imagem |
| `-SkipUpload` | — | Só atualiza descrição do PR |

Detalhes: [reference.md](reference.md)
