# Repository guidelines

## Tooling
- Install and enable pre-commit hooks:
  - `pip install pre-commit`
  - `pre-commit install`
  - Run on demand with `pre-commit run --all-files`
- Spelling checks are configured via `.cspell.json` and run through the `cspell` pre-commit hook.

## Common commands
- Format: `make fmt`
- Lint: `make lint`
- Test: `make test`
- Build: `make build`

## Documentation index
- README: [`README.md`](README.md)
- 共通 Definition of Done: [`docs/dod.md`](docs/dod.md)
- MVPスコープ: [`docs/mvp.md`](docs/mvp.md)
- 仕様書（Core）: [`docs/specification.md`](docs/specification.md)
- 正規化仕様: [`docs/canonicalization.md`](docs/canonicalization.md)
- ハッシュ仕様: [`docs/hashing.md`](docs/hashing.md)
- ADR一覧: [`docs/adr/`](docs/adr/)
- タスクリスト: [`docs/tasks.md`](docs/tasks.md)

## Task management
- タスクリストは [`docs/tasks.md`](docs/tasks.md) で管理する。
- タスク完了時は、該当タスクのサブタスクおよびAcceptance Criteriaのチェックボックスを `[x]` に更新すること。
- 新規タスクや変更がある場合は、タスクリストに反映すること。
- コミットメッセージには対応するタスクID（例: `CORE-001`）を含めることを推奨。

## Documentation & schemas
- Core仕様は `docs/specification.md` を参照。
- 正規化/ハッシュ仕様は `docs/canonicalization.md` と `docs/hashing.md` に集約。
- ADRは `docs/adr/` 配下に追加する。
- JSON Schemaは `schemas/` 配下に置く（`cork.*.v0.1.schema.json`）。
- gRPC Protoは `proto/cork/v1/` 配下に置く。
