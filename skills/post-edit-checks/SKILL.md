---
name: post-edit-checks
description: Run post-edit static analysis and tests for the cork-core repo after code changes. Use when a code-modifying task is finished and you need to run AGENTS.md check tasks (make fmt, lint, test, build), fix any failures, and rerun until clean.
---

# Post Edit Checks

## Overview

Enforce the cork-core post-edit checklist by running the required cargo/make checks in a deterministic order and addressing any failures.

## Workflow

1. Confirm you are at the repository root (where `Cargo.toml` and `Makefile` exist).
2. Run the checks in this order:
   - `make fmt` - Format code with cargo fmt
   - `make lint` - Check formatting and run clippy
   - `make test` - Run all tests
   - `make build` - Build release binary
3. If any step fails:
   - Read the error output.
   - Fix the underlying issue.
   - Re-run the failed command, then continue with the remaining steps.
4. Report results and any fixes applied.
5. Update task list (`docs/tasks.md`) if a task was completed.

## Definition of Done

Per `docs/dod.md`, all tasks must satisfy:
- `cargo build` passes (stable)
- `cargo fmt` is applied
- `cargo clippy -- -D warnings` passes
- Relevant unit/integration tests added and `cargo test` passes
- Public API changes documented in `docs/`

## Resources

### scripts/

Use `scripts/run_checks.sh` to run the standard sequence.
