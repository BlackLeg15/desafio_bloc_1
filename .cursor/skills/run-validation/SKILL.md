---
name: run-validation
description: Executa validação E2E hands-off do desafio_bloc_1 via Validation Harness. Use quando o usuário pedir validação automatizada, rodar harness, E2E, ou verificar o app no device sem interação manual.
---

# Run Validation

## Pré-requisito

Device Android conectado (`flutter devices`). Web não suporta `integration_test`.

## Executar (hands-off)

```powershell
.\validation_harness\scripts\run_harness.ps1
```

Com device explícito:

```powershell
.\validation_harness\scripts\run_harness.ps1 -Device <device_id>
```

O agente deve **rodar o script**, não instruir o usuário, salvo se não houver device.

## O que o script faz

1. `flutter test integration_test/harness_test.dart --no-uninstall`
2. Cenário `home_loads_posts` (API real, timeout 45s)
3. Screenshot `02_posts_loaded.png`
4. Relatório JSON (stdout + arquivo no device)
5. `adb pull` → `validation_harness/artifacts/` e `reports/`

## Resultado

| Exit | Significado |
|------|-------------|
| 0 | Passou |
| 1 | Falhou |

Verificar:
- `validation_harness/reports/validation_report_latest.json`
- `validation_harness/artifacts/02_posts_loaded.png`

## Flags

- `-SkipPull` — só roda teste, sem adb pull
- `-RecordVideo` — reservado (no-op hoje)

Detalhes: [reference.md](reference.md)
