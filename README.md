# desafio_bloc_1

App Flutter de estudo (Desafio FTeam) — lista paginada de posts do blog IntoxiAnime.

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

## Plataformas

| Plataforma | Status |
|---|---|
| Android | Gradle 9 / AGP 9 / Kotlin 2.3 |
| iOS | iOS 13+ / Swift Package Manager para plugins |
| Web | Suportado |
| Windows | Suportado |
