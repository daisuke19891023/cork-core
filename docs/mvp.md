# MVPスコープ

## MVPで「必ず入れる」

以下はMVP（Rust Core側）で実装する機能の一覧です。

- **gRPC Core API**
  - `SubmitRun` / `ApplyGraphPatch` / `StreamRunEvents` / `GetLogs` / `GetRun` / `GetCompositeGraph` / `CancelRun`
- **Contract Manifest / Policy / GraphPatch の受理・検証**
  - `patch_seq` 連番
  - `idempotency_key` 等
- **Canonicalization（Pre-normalization + JCS）＋ ハッシュ（SHA-256 + domain separation）**
  - [RFC 8785: JSON Canonicalization Scheme (JCS)](https://www.rfc-editor.org/rfc/rfc8785)
- **Event Log（`event_seq` 単調増加）＋ストリーム配信（UI一次情報源）**
- **In-memory の Composite Graph とステートストア（Run/Stage/Node output）**
- **JSON Pointer による参照解決（ValueRef）**
  - [RFC 6901: JSON Pointer](https://www.rfc-editor.org/rfc/rfc6901)
  - [json-pointer crate](https://crates.io/crates/json-pointer)
- **`LIST_HEURISTIC` スケジューラ**
  - deps + 参照解決 + 資源（cpu/io/provider）で起動
- **Stage auto-commit（`quiescence_ms` / `max_open_ms` 等）**
- **ログ（`scope_id` + `scope_seq` による決定的マージ可能性の担保）**

## MVPで「入れない／後回し」

- CP-SAT等による数理最適化スケジューラ（データ項目は保持）
- SHOP3実行（HTNメタデータ保持まで）
- 永続DB（まずは in-memory。必要ならappend-onlyファイルは任意タスクで追加）

---

## MVP "全体"の受け入れ条件（プロダクトとしてのAcceptance）

Rust Core MVPは、最低限以下を満たしたら「最小実装完了」とします：

1. サーバが起動し、SubmitRun→StreamRunEvents→ApplyGraphPatch→GetLogs の流れでUIが成立
2. `patch_seq` 欠番は拒否される（厳密連番が守られる）
3. JSON Pointer参照で state/node output から入力を組み立てられる
4. `side_effect` tool は `idempotency_key` 無しでは受理されない
5. Stageは Core の auto-commit で前進する
6. gRPC deadline/cancel を扱える（timeout時に適切に打ち切れる）

---

## 参照

- 共通 Definition of Done: [`docs/dod.md`](dod.md)
- 仕様書: [`docs/specification.md`](specification.md)
- タスクリスト: [`docs/tasks.md`](tasks.md)
