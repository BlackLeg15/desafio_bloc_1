# desafio_bloc_1

App Flutter de estudo (Desafio FTeam) — lista paginada de posts do blog IntoxiAnime.

> **Agentes / IA:** comece por [`AGENTS.md`](AGENTS.md) · regras em [`.cursor/rules/`](.cursor/rules/) · skills em [`.cursor/skills/`](.cursor/skills/)

## Stack

- **Dart** 3.12+ / **Flutter** 3.44+
- Clean Architecture (feature-based)
- **flutter_bloc** 9.x — gerenciamento de estado
- **flutter_modular** 7.x — DI e rotas
- **dio** — cliente HTTP
- **widgetbook** — catálogo de componentes

## Como rodar

```bash
flutter pub get
flutter run
```

## Testes

```bash
flutter analyze
flutter test
```

## Widgetbook

```bash
flutter run -t lib/widgetbook.dart
```

## Validation Harness

Laboratório de validação E2E independente de ferramenta (base: `integration_test`).

```powershell
# Com emulador/dispositivo Android ou iOS conectado
.\validation_harness\scripts\run_harness.ps1

# Dispositivo específico (ex.: depuração Wi-Fi)
.\validation_harness\scripts\run_harness.ps1 -Device adb-RQCW105ZFRW-9Ie1IF._adb-tls-connect._tcp
```

Após a execução em Android, o script:
- mantém o app instalado (`--no-uninstall`) para permitir pull via adb
- puxa screenshots de `/storage/emulated/0/Android/data/.../files/validation_harness/artifacts/`
- salva localmente em `validation_harness/artifacts/` (ex.: `02_posts_loaded.png`)
- salva o relatório JSON em `validation_harness/reports/`

> Requer emulador Android/iOS ou build Windows com Visual Studio C++. Web não suporta `integration_test`.

## Plataformas

| Plataforma | Status |
|---|---|
| Android | Gradle 9 / AGP 9 / Kotlin 2.3 |
| iOS | iOS 13+ / Swift Package Manager para plugins |
| Web | Suportado |
| Windows | Suportado |
