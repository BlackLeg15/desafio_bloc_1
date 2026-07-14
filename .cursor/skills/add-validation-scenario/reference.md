# Add Scenario — Reference

## Arquitetura

```
Scenario → AppDriver / ArtifactCollector / LogSink (interfaces)
                ↓
         IntegrationTestDriver (adapter)
                ↓
         integration_test + app.main()
```

## Arquivos tocados (típico)

| Arquivo | Mudança |
|---------|---------|
| `validation_keys.dart` | Nova key |
| `widgets/*.dart` | Key/Semantics |
| `scenarios/foo_scenario.dart` | Novo cenário |
| `harness_test.dart` | Lista de cenários |

## Adapter futuro (Maestro)

- `MaestroRunner implements AppDriver` em `adapters/maestro/`
- Cenários permanecem iguais
- Script orquestra CLI `maestro test` + normaliza report JSON

## Determinismo (futuro)

Para cenários sem rede: entry point alternativo com HTTP mock via Modular — fora do escopo padrão; pedir explicitamente.
