## Issue

Closes #<!-- número da issue -->

## Resumo

<!-- Uma frase: o que mudou e por quê -->

## Tipo

- [ ] feat
- [ ] fix
- [ ] chore
- [ ] docs

## Checklist

- [ ] Escopo respeitado (IN/OUT da issue)
- [ ] `flutter analyze && flutter test` passam
- [ ] Harness E2E executado (se aplicável à issue)
- [ ] **Documentação atualizada** no escopo da mudança
- [ ] Commits em Conventional Commits com `Refs: #N`
- [ ] Aprovação humana do código e das evidências

## Validação

| Verificação | Resultado |
|-------------|-----------|
| `flutter analyze` | pass / fail |
| `flutter test` | pass / fail |
| Harness (`run_harness.ps1`) | pass / fail / N/A |

## Evidências

<!-- Anexe screenshots e cole trecho relevante do report JSON -->

### Report

```json
<!-- colar trecho de validation_report_latest.json ou resumo -->
```

### Screenshots

<!-- O agente executa attach-pr-evidence após criar o PR (width=300) -->

<img src="URL" width="300" alt="descrição">

## Documentação alterada

- [ ] `AGENTS.md`
- [ ] `.cursor/rules/*`
- [ ] `.cursor/skills/*`
- [ ] `README.md`
- [ ] `docs/*`
- [ ] Nenhuma

## Notas para revisão

<!-- Pontos que o revisor humano deve olhar com atenção -->
