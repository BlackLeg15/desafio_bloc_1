# Run Validation — Reference

## Cenário atual: `home_loads_posts`

1. Launch app
2. Detecta loading (log only, sem screenshot)
3. Aguarda `posts_list` ou falha se `retry_button`
4. Screenshot + assert `blog_post_card`
5. Relatório + encerramento

## Paths no device (Android)

```
/storage/emulated/0/Android/data/com.example.desafio_bloc_1/files/validation_harness/artifacts/
/storage/emulated/0/Android/data/com.example.desafio_bloc_1/files/validation_harness/reports/
```

## Alternativa direta

```powershell
flutter test integration_test/harness_test.dart -d <device_id> --no-uninstall
```

Relatório no log: linha `VALIDATION_REPORT_JSON:{...}`.

## Troubleshooting

| Problema | Ação |
|----------|------|
| No device | `flutter devices`; pedir conexão USB/Wi-Fi |
| Timeout posts | API/rede; ver `retry_button` no relatório |
| Pull vazio | Usar `--no-uninstall`; app deve permanecer instalado |
| Windows desktop E2E | Requer Visual Studio C++ — preferir Android |
