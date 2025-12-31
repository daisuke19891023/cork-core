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
