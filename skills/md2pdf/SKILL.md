---
name: md2pdf
description: MarkdownファイルをPDF（pandoc + lualatex, Docker使用）に変換する。YAMLフロントマター不要。
argument-hint: "[mdファイルパス]"
---

# md2pdf — Markdown → PDF 変換

`md2pdf` CLI を使ってMarkdownをPDF化する。Docker経由で pandoc + lualatex + jlreq（日本語組版）が実行される。ホスト環境に TeX をインストール不要。

## 手順

1. `md2pdf <path/to/note.md>` を実行
   - 初回実行時は `pandoc-ja:latest` Dockerイメージのビルドが走る（数分）
   - 成功すると同ディレクトリに `<note>.pdf` が生成される
2. オプション:
   - `-o <output.pdf>`: 出力先を指定
   - `--margin <mm>`: マージン（デフォルト25mm）
   - `--version`: バージョン確認

## 前提

- Docker Desktop が起動していること
- `md2pdf` がインストール済みであること（`which md2pdf` で確認）
  - インストール方法: `brew tap taiseee/tap && brew install md2pdf`
  - または: `make install`（リポジトリをclone後）

## 例

```bash
md2pdf ~/notes/zero-shot-argmax.md
md2pdf ~/notes/memo.md -o ~/Desktop/memo.pdf
md2pdf ~/notes/memo.md --margin 20mm
```

## 備考

- レポート形式（表紙・著者・学籍番号付き）のPDFが必要な場合は `homework-report` skill を参照
- Dockerイメージ名: `pandoc-ja:latest`（初回のみビルド、以降はキャッシュ利用）
