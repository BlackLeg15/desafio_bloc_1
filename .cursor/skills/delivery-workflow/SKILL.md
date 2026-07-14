---
name: delivery-workflow
description: Executa fluxo de entrega a partir de GitHub Issue — branch, implementação, validação, docs, commit e PR. Use quando o usuário fornecer issue, ticket #N, ou pedir fluxo de entrega com evidências e aprovação humana.
---

# Delivery Workflow

## Pré-requisito

Issue criada via template (`feat`, `bug` ou `chore`) com escopo, critérios GIVEN/WHEN/THEN e validação definidos.

Ler issue:

```bash
gh issue view <N> --json title,body,labels
```

Documento completo: [`docs/delivery-workflow.md`](../../../docs/delivery-workflow.md)

## Fase 1 — Planejar (antes de codar)

1. Extrair da issue:
   - **ID:** `#N`
   - **Tipo:** feat / fix / chore (label ou título `[FEAT]` etc.)
   - **Escopo IN / OUT**
   - **Critérios de aceite**
   - **Validação** (unitário, harness existente, cenário novo)
   - **Docs** a revisar
   - **Evidências** esperadas no PR

2. Criar branch (só após humano confirmar ou pedir início):

```
feat/<N>-<slug-curto>
fix/<N>-<slug-curto>
chore/<N>-<slug-curto>
```

3. Roteamento de skills:

| Issue pede | Skill |
|------------|-------|
| Harness existente | `run-validation` |
| Novo cenário E2E | `add-validation-scenario` |
| Só unitários | regra `testing` |

## Fase 2 — Implementar

- Respeitar escopo IN/OUT — **não expandir** sem nova issue ou OK humano.
- Diffs mínimos; seguir convenções do projeto.
- Se mudar comportamento, path ou processo → **atualizar docs no mesmo escopo** (ver checklist abaixo).

## Fase 3 — Validar

```bash
flutter analyze && flutter test
```

Se issue exige E2E:

```powershell
.\validation_harness\scripts\run_harness.ps1
```

Confirmar exit 0 e artifacts em:
- `validation_harness/reports/validation_report_latest.json`
- `validation_harness/artifacts/`

## Fase 4 — Documentação (done criterion)

Revisar checklist da issue. Atualizar somente o necessário:

| Se mudou… | Arquivo |
|-----------|---------|
| Comando, path, roteamento | `AGENTS.md` |
| Convenção global | `project-core.mdc` |
| Padrão `lib/` | `flutter-app.mdc` |
| Harness | `validation-harness.mdc` |
| Workflow | skill + `RULES.md` |
| Visão geral | `README.md` |

## Fase 5 — Gate humano

**Parar** e apresentar ao humano:

1. Resumo do que foi feito vs critérios de aceite
2. Resultado dos testes (analyze, unit, harness)
3. Evidências (JSON + screenshots)
4. Arquivos de doc alterados

**Não commitar, não pushar, não abrir PR** até OK explícito.

## Fase 6 — Commit e PR (após OK humano)

### Commits (Conventional Commits)

```
feat(home): add pagination retry on network error

Refs: #42
```

Tipos: `feat`, `fix`, `chore`, `docs`, `test`, `refactor` — escopo opcional entre parênteses.

### PR

- Título: `[#N] tipo(escopo): descrição curta`
- Corpo: preencher `.github/pull_request_template.md`
- `Closes #N` no corpo
- Anexar evidências (screenshots + trecho do report JSON)

```bash
git push -u origin HEAD
gh pr create --title "[#N] ..." --body-file .github/pull_request_template.md
```

(Ajustar corpo do PR com dados reais antes de criar.)

## Checklist rápido

- [ ] Issue lida e escopo entendido
- [ ] Branch `tipo/N-slug`
- [ ] Implementação dentro do IN/OUT
- [ ] `flutter analyze && flutter test`
- [ ] Harness (se aplicável)
- [ ] Docs atualizadas
- [ ] OK humano
- [ ] Commits + PR com evidências

Detalhes: [reference.md](reference.md)
