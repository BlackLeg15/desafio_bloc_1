# Delivery Workflow — Reference

## Mapeamento issue → branch

| Label / título | Prefixo branch |
|----------------|----------------|
| `[FEAT]` / enhancement | `feat/` |
| `[BUG]` / bug | `fix/` |
| `[CHORE]` / chore | `chore/` |

Slug: kebab-case, 2–4 palavras, sem artigos.

Exemplos:
- Issue #42 feat pagination → `feat/42-pagination-retry`
- Issue #17 bug scroll → `fix/17-crash-on-scroll`

## Commits

```
<type>(<scope>): <descrição imperativa curta>

Refs: #<N>
```

| type | Uso |
|------|-----|
| feat | nova funcionalidade |
| fix | correção de bug |
| chore | tooling, CI, processo |
| docs | só documentação |
| test | só testes |

Múltiplos commits por PR são aceitáveis; cada um referencia `#N`.

## PR — evidências

Colar no corpo do PR (template em `.github/pull_request_template.md`):

**Report (exemplo de campos úteis):**

```json
{
  "status": "passed",
  "scenarios": [{ "name": "home_loads_posts", "status": "passed" }]
}
```

**Screenshots:** arrastar `validation_harness/artifacts/*.png` para o PR no GitHub.

## Docs — matriz de impacto

| Área alterada | Verificar |
|---------------|-----------|
| `lib/` comportamento UI | `flutter-app.mdc`, `ValidationKeys` |
| Novo script/comando | `AGENTS.md`, skill correspondente |
| Novo cenário harness | `validation-harness.mdc`, `harness_test.dart` |
| Novo processo | `docs/delivery-workflow.md`, esta skill |
| Template GitHub | `docs/delivery-workflow.md` |

## Comandos úteis

```bash
gh issue list
gh issue view 42
gh pr create --title "[#42] feat(home): ..." --body "..."
```

## Anti-patterns

- Commit antes do harness passar (quando issue exige E2E)
- PR sem `Closes #N`
- Docs desatualizadas no mesmo PR da mudança de comportamento
- Escopo OUT violado “para melhorar enquanto está aqui”
