---
name: add-validation-scenario
description: Adiciona cenário E2E ao Validation Harness do desafio_bloc_1. Use quando criar novo fluxo de validação, estender harness, ou adicionar teste automatizado de UI seguindo inversão de dependências.
---

# Add Validation Scenario

## Checklist

```
- [ ] Keys/semantics no app (ValidationKeys)
- [ ] Classe Scenario em validation_harness/lib/scenarios/
- [ ] Registrar em integration_test/harness_test.dart
- [ ] Rodar run_harness.ps1 e verificar report + screenshot
```

## 1. Seletores no app

Editar `lib/app/core/constants/validation_keys.dart` e widgets afetados.

## 2. Cenário

```dart
class MyScenario implements Scenario {
  @override
  String get name => 'my_scenario';

  @override
  String get description => '...';

  @override
  Future<ScenarioResult> run({
    required AppDriver driver,
    required ArtifactCollector artifacts,
    required LogSink logs,
  }) async {
    final startedAt = DateTime.now();
    try {
      await driver.waitForVisible(ValidationKeys.someKey);
      final shot = await artifacts.captureScreenshot('01_state');
      return ScenarioResult.success(name, DateTime.now().difference(startedAt), screenshots: [shot]);
    } catch (e) {
      return ScenarioResult.failed(name, DateTime.now().difference(startedAt), e);
    }
  }
}
```

## 3. Registrar

```dart
await harness.run([
  HomeLoadsPostsScenario(),
  MyScenario(), // adicionar
]);
```

## Regras

- Cenário usa **interfaces** — nunca `WidgetTester` direto.
- Novo adapter (Maestro, etc.) implementa `AppDriver`, não altera cenário.
- Screenshot só com UI estável (evitar loading).

Template completo: [reference.md](reference.md)
