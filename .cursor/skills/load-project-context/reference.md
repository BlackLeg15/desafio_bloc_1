# Load Project Context — Reference

## Arquivos

| Arquivo | Papel |
|---------|-------|
| `docs/project-context.yaml` | Instância deste repo |
| `docs/project-context.template.yaml` | Copiar ao criar/portar laboratório |

## Portagem para empresa

1. Copiar `project-context.template.yaml` → `project-context.yaml`
2. Preencher `product`, URLs, `jira_project_key`, `space_id`, etc.
3. `capabilities.mcp.enabled: true`
4. `capabilities.mcp.servers: [figma, jira, gitbook]`
5. Validar MCPs no Cursor (auth)
6. Skills `delivery-workflow`, `run-validation`, `attach-pr-evidence` permanecem

## Exemplo empresa (comentado no template)

```yaml
sources:
  design:
    primary: figma
    access: mcp
    mcp_server: figma
  tickets:
    primary: jira
    access: mcp
    mcp_server: jira
    jira_project_key: PROJ
  documentation:
    - type: gitbook
      access: mcp
      mcp_server: gitbook
capabilities:
  mcp:
    enabled: true
    servers: [figma, jira, gitbook]
```

## Ordem de carregamento sugerida

```
load-project-context → delivery-workflow → (run-validation | código)
```

## Atualizar contexto

Mudou ferramenta (ex.: Jira → Linear)? Edite só `project-context.yaml` + esta skill se o adapter mudar.
