## Issue

N/A — PR fundacional do fluxo de entrega (meta-chore). Issues futuras usarão `Closes #N`.

## Resumo

Adiciona templates de issue (`feat`, `bug`, `chore`), template de PR, guia `docs/delivery-workflow.md`, skill `delivery-workflow` e referências em `AGENTS.md`, `RULES.md` e `project-core.mdc` para entrega humano + IA com evidências do harness.

## Tipo

- [ ] feat
- [ ] fix
- [x] chore
- [x] docs

## Checklist

- [x] Escopo respeitado (IN/OUT da issue)
- [x] `flutter analyze && flutter test` passam
- [x] Harness E2E executado (se aplicável à issue) — **N/A** (só docs/templates)
- [x] **Documentação atualizada** no escopo da mudança
- [x] Commits em Conventional Commits com `Refs: #N` — N/A neste PR fundacional
- [ ] Aprovação humana do código e das evidências

## Validação

| Verificação | Resultado |
|-------------|-----------|
| `flutter analyze` | pass |
| `flutter test` | pass |
| Harness (`run_harness.ps1`) | N/A |

## Evidências

### Report

N/A — mudança de processo/documentação; sem alteração de comportamento do app.

### Screenshots

N/A

## Documentação alterada

- [x] `AGENTS.md`
- [x] `.cursor/rules/*` (`project-core.mdc`)
- [x] `.cursor/skills/*` (`delivery-workflow`)
- [x] `README.md`
- [x] `docs/*` (`delivery-workflow.md`)
- [ ] Nenhuma

## Notas para revisão

- Templates em `.github/ISSUE_TEMPLATE/` usam formulários YAML com campos GIVEN/WHEN/THEN, escopo IN/OUT e checklist de docs.
- `config.yml` desabilita issues em branco para forçar uso dos templates.
- Skill `delivery-workflow` define gate humano antes de commit/PR.
- Após merge, validar criando uma issue `[CHORE]` de teste pelo GitHub UI.

## Commits incluídos

1. `chore(delivery): add GitHub issue and PR templates`
2. `docs: add delivery workflow guide and agent skill`
