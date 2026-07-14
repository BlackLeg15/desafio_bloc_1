## Issue

Closes #12

## Resumo

Exibe a quantidade de posts carregados no título do AppBar (`Posts (N)`) após a lista ser populada. Inclui simulação do fluxo de entrega completo (issue → branch → harness → PR com evidências).

## Tipo

- [x] feat
- [ ] fix
- [ ] chore
- [ ] docs

## Checklist

- [x] Escopo respeitado (IN/OUT da issue)
- [x] `flutter analyze && flutter test` passam
- [x] Harness E2E executado — `home_loads_posts`
- [x] Documentação atualizada — skill `attach-pr-evidence` e ajustes no delivery workflow
- [x] Commits em Conventional Commits com `Refs: #12`
- [x] Aprovação humana do código e das evidências

## Validação

| Verificação | Resultado |
|-------------|-----------|
| `flutter analyze` | pass |
| `flutter test` | pass (9/9) |
| Harness (`run_harness.ps1`) | pass |

## Evidências

### Report

```json
{
  "passed": true,
  "durationMs": 10077,
  "results": [
    {
      "name": "home_loads_posts",
      "passed": true,
      "durationMs": 7314
    }
  ]
}
```

### Screenshots

<img src="https://raw.githubusercontent.com/BlackLeg15/desafio_bloc_1/feat/12-posts-count-appbar/.github/pr-assets/issue-12/02_posts_loaded.png" width="300" alt="Posts carregados com contagem no AppBar">

## Documentação alterada

- [x] `AGENTS.md`
- [ ] `.cursor/rules/*`
- [x] `.cursor/skills/*` (`attach-pr-evidence`, `delivery-workflow`)
- [ ] `README.md`
- [x] `docs/delivery-workflow.md`
- [ ] Nenhuma

## Notas para revisão

- `BlocConsumer` agora envolve o `Scaffold` para o título reagir ao estado do BLoC.
- Cenário E2E existente continua passando sem alterações no harness.
- Novo script `scripts/attach-pr-evidence.ps1` para embed de screenshots em PRs (`width=300`).
