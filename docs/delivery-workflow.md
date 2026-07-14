# Delivery Workflow

Fluxo de entrega humano + IA para tarefas rastreáveis via GitHub Issues.

## Ciclo

```
Issue (template) → Branch → Implementação → Validação → Aprovação humana → Commit → PR → Docs
```

| Etapa | Responsável | Critério |
|-------|-------------|----------|
| Issue | Humano | Template preenchido (`feat` / `bug` / `chore`) |
| Branch | Agente | `tipo/N-slug` a partir do número da issue |
| Código + testes | Agente | Escopo IN/OUT respeitado |
| E2E | Harness | Exit 0 + artifacts (se issue exigir) |
| Docs | Agente | Atualizar no mesmo PR, se comportamento/processos mudaram |
| Commit / PR | Agente | Só após OK humano explícito |
| Merge | Humano | Código + evidências + docs |

## Identificador

O **número da issue** (`#42`) é o ID da tarefa:

| Artefato | Padrão |
|----------|--------|
| Branch | `feat/42-pagination-retry`, `fix/17-crash-scroll`, `chore/0-delivery-workflow` |
| Commit | `feat(home): add pagination retry` + corpo `Refs: #42` |
| PR título | `[#42] feat(home): pagination retry` |
| PR corpo | `Closes #42` |

## Linguagem dos critérios de aceite

Use **GIVEN / WHEN / THEN** (testável e legível para IA):

```
GIVEN o app na Home sem cache
WHEN a API retorna 200 com posts
THEN a lista exibe cards com ValidationKeys.blogPostCard
AND o harness home_loads_posts passa com exit 0
```

Bugs: acrescentar `AND NÃO <regressão>`.

## Gates obrigatórios

1. **Testes unitários** — `flutter analyze && flutter test`
2. **Harness** — quando a issue marcar validação E2E (skill `run-validation`)
3. **Documentação** — checklist da issue; docs evoluem com o código
4. **Aprovação humana** — evidências + diff antes de commit/PR

## Evidências no PR

Não commitar no git (estão no `.gitignore`). Embutir no PR via skill `attach-pr-evidence`:

```powershell
.\scripts\attach-pr-evidence.ps1 -PrNumber <PR> -IssueNumber <N>
```

Imagem com **width=300** (`<img>` HTML) para legibilidade do PR.

## Documentação por tipo de mudança

| Mudança | Atualizar |
|---------|-----------|
| Path, comando, roteamento | `AGENTS.md` + skill afetada |
| Convenção global | `project-core.mdc` |
| Padrão em `lib/` | `flutter-app.mdc` |
| Harness / cenário E2E | `validation-harness.mdc` + skill |
| Novo workflow | nova skill + `RULES.md` |
| Visão geral humana | `README.md` |

**Uma fonte de verdade por tema** — não duplicar conteúdo entre arquivos.

## Templates GitHub

- Issues: `.github/ISSUE_TEMPLATE/feat.yml`, `bug.yml`, `chore.yml`
- PR: `.github/pull_request_template.md`

## Skills relacionadas

| Skill | Quando |
|-------|--------|
| `delivery-workflow` | Iniciar trabalho a partir de issue |
| `run-validation` | Executar harness |
| `attach-pr-evidence` | Screenshot no PR após `gh pr create` |
| `add-validation-scenario` | Issue exige novo cenário E2E |

## Leitura de issue pelo agente

```bash
gh issue view <N> --json title,body,labels
```

Extrair: escopo IN/OUT, critérios GIVEN/WHEN/THEN, validação exigida, docs a revisar, evidências esperadas.

## O que o agente não faz sem pedido explícito

- Commit ou push
- Abrir PR sem aprovação humana das evidências
- Expandir escopo além da issue
