# Rules Index

Regras do projeto ficam em **`.cursor/rules/*.mdc`**. O Cursor carrega por `alwaysApply` ou `globs` — **não duplique conteúdo aqui**.

| Arquivo | Escopo | Quando carrega |
|---------|--------|----------------|
| `project-core.mdc` | Invariantes globais | Sempre |
| `flutter-app.mdc` | `lib/**` | Editar app |
| `validation-harness.mdc` | `validation_harness/**`, `integration_test/**` | Editar E2E |
| `testing.mdc` | `test/**` | Editar testes unitários |

## Skills (workflows)

| Skill | Uso |
|-------|-----|
| `.cursor/skills/load-project-context/` | Fontes externas (tickets, design, docs, MCP) |
| `.cursor/skills/delivery-workflow/` | Issue → branch → validação → PR |
| `.cursor/skills/run-validation/` | Executar validação hands-off |
| `.cursor/skills/add-validation-scenario/` | Criar cenário E2E |

## Contexto do produto

- Instância: `docs/project-context.yaml`
- Template (portar): `docs/project-context.template.yaml`
- Skill: `load-project-context`

## Fluxo de entrega

- Issues: `.github/ISSUE_TEMPLATE/` (`feat`, `bug`, `chore`)
- PR: `.github/pull_request_template.md`
- Guia: `docs/delivery-workflow.md`

## Entrada para agentes

Leia **`AGENTS.md`** primeiro — roteamento e paths em ~60 linhas.
