# Agent Guide — desafio_bloc_1

Laboratório Flutter para estudo + **Validation Harness** hands-off (E2E sem acoplamento a Maestro/Patrol/Appium).

**Contexto do produto:** `docs/project-context.yaml` (design, tickets, docs, MCPs, público) — skill `load-project-context`.

## Stack (não reexplicar)

Flutter 3.44+ · Dart 3.12+ · Clean Architecture · flutter_bloc 9 · flutter_modular 7 · dio · widgetbook · integration_test (dev)

## Onde está o quê

| Área | Caminho |
|------|---------|
| App | `lib/` — DI inline em `lib/main.dart` |
| Keys E2E | `lib/app/core/constants/validation_keys.dart` |
| Unit/BLoC tests | `test/` |
| Harness (interfaces, adapters, cenários) | `validation_harness/lib/` |
| Entry E2E | `integration_test/harness_test.dart` |
| Script hands-off | `validation_harness/scripts/run_harness.ps1` |
| Saídas | `validation_harness/reports/`, `validation_harness/artifacts/` |

## Roteamento por tarefa (carregar só o necessário)

| Tarefa do usuário | Ler primeiro |
|-------------------|--------------|
| Contexto do produto / onde buscar tickets, design, docs | `.cursor/skills/load-project-context/SKILL.md` → `docs/project-context.yaml` |
| Trabalho a partir de issue `#N` | `.cursor/skills/delivery-workflow/SKILL.md` |
| Rodar validação automatizada | `.cursor/skills/run-validation/SKILL.md` |
| Novo cenário E2E | `.cursor/skills/add-validation-scenario/SKILL.md` |
| Código do app (`lib/`) | regra `flutter-app` (auto via glob) |
| Código do harness | regra `validation-harness` (auto via glob) |
| Testes unitários | regra `testing` (auto via glob) |
| Índice de regras | `RULES.md` |

## Comandos rápidos

```bash
flutter analyze && flutter test          # unitários
flutter run                              # app
.\validation_harness\scripts\run_harness.ps1   # validação hands-off (Android)
```

## Invariantes (sempre)

1. **App não importa harness** — harness depende do app via path package.
2. **Inversão de dependência** — cenários usam interfaces (`AppDriver`, `Scenario`, etc.); adapters implementam ferramentas.
3. **Seletores estáveis** — usar `ValidationKeys`, não textos da UI.
4. **Escopo mínimo** — não refatorar arquitetura ao adicionar E2E; só keys/semantics quando necessário.
5. **Hands-off** — validação = script único, exit code 0/1, artifacts locais.
6. **Docs vivem com o código** — mudança de comportamento, path ou processo exige atualizar doc correspondente no mesmo escopo (issue/PR).
7. **Issues estruturadas** — templates em `.github/ISSUE_TEMPLATE/`; ID = `#N`; fluxo em `docs/delivery-workflow.md`.
8. **Contexto portável** — `docs/project-context.yaml` define fontes (GitHub lab; Figma/Jira/GitBook via MCP na empresa).

## Não fazer sem pedido

- Acoplar Maestro/Patrol/Appium direto no app.
- Commit/push automático.
- Docs longas duplicando regras ou skills.
- Screenshot durante loading (spinner impede captura).

## Entrega (issues → PR)

1. Humano cria issue via template (`feat` / `bug` / `chore`).
2. Agente lê `#N`, cria branch `tipo/N-slug`, implementa dentro do IN/OUT.
3. Valida (`flutter test` + harness se issue exigir).
4. Atualiza docs do checklist da issue.
5. **Gate humano** — evidências + código aprovados.
6. Commit (Conventional Commits + `Refs: #N`) → PR (`Closes #N` + template).

Skill: `.cursor/skills/delivery-workflow/` · Detalhes: `docs/delivery-workflow.md`

## Plano futuro (contexto, não implementar salvo pedido)

- Adapter Maestro (YAML externo).
- CI job E2E.
- HTTP mock para cenários determinísticos.
- Gravação de vídeo via ADB.
