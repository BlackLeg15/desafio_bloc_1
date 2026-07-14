---
name: load-project-context
description: Carrega contexto do produto e roteia fontes externas (GitHub, MCP Jira/Figma/GitBook). Use no início de tarefas novas, ao portar workflow para outro repo, ou quando precisar saber onde buscar tickets, design, docs ou personas.
---

# Load Project Context

## Quando usar

**Primeiro passo** antes de `delivery-workflow` ou implementação, quando o escopo depende de contexto externo ao código.

## Ler contexto

Arquivo: [`docs/project-context.yaml`](../../../docs/project-context.yaml)

Template para outros repos: `docs/project-context.template.yaml`

## Extrair do YAML

| Campo | Uso |
|-------|-----|
| `product` | Nome, propósito, público, personas |
| `sources.*` | Onde buscar design, tickets, docs, código |
| `capabilities.mcp` | Se MCPs estão ativos e quais |
| `routing` | Necessidade → fonte |
| `workflows` | Links para delivery e validação |

## Roteamento por necessidade

### Tickets / escopo da tarefa

| `tickets.primary` | Ação |
|-------------------|------|
| `github_issues` | `gh issue view <N> --json title,body,labels` |
| `jira` + `mcp.enabled` | MCP **jira** — buscar issue/epic (ver tools disponíveis) |

Depois: skill `delivery-workflow`.

### Design / UI spec

| `design.primary` | Ação |
|----------------|------|
| `null` | Sem Figma — usar código, issues e screenshots do harness |
| `figma` + `mcp.enabled` | MCP **figma** — frames, componentes, specs |

### Documentação de produto

| Fonte em `documentation` | Ação |
|--------------------------|------|
| `in_repo` | Ler paths listados (`AGENTS.md`, `docs/`, etc.) |
| `github_issues_and_prs` | `gh issue/pr view`, histórico de decisões |
| `gitbook` + `mcp.enabled` | MCP **gitbook** — espaço/documentação |

### Código

| `code.primary` | Ação |
|----------------|------|
| `github` | Repo em `code.url`, branch `default_branch` |

## MCP (empresa)

Se `capabilities.mcp.enabled: true`:

1. `GetMcpTools` para cada servidor em `capabilities.mcp.servers`
2. Usar tool do MCP em vez de inventar URLs ou supor layout
3. Se MCP falhar (auth, indisponível) → informar humano; não simular conteúdo

**Lab (este repo):** `mcp.enabled: false` — só GitHub CLI + docs no código.

## Lab vs empresa

| Fonte | Lab | Empresa (exemplo) |
|-------|-----|-------------------|
| Design | N/A | MCP Figma |
| Tickets | GitHub Issues | MCP Jira |
| Docs | in_repo + issues/PRs | MCP GitBook + GitHub |
| Processo | skills iguais | skills iguais |

Portar = trocar `project-context.yaml`, não reescrever skills.

## Não fazer

- Ignorar `audience` / `personas` ao decidir UX ou escopo
- Buscar no código o que está em Jira/Figma/GitBook quando MCP está habilitado
- Duplicar este YAML em `AGENTS.md` — só apontar para o arquivo

Detalhes: [reference.md](reference.md)
