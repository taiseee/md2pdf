# md2pdf

MarkdownファイルをPDF（pandoc + lualatex）に変換するCLIツール。  
Docker内で実行するため、ホスト環境にTeX/pandocをインストール不要。日本語組版（jlreq）対応。

## インストール

### Homebrew（推奨）

```bash
brew tap taiseee/tap
brew install md2pdf
```

### make install

```bash
git clone https://github.com/taiseee/md2pdf.git
cd md2pdf
make install   # ~/.local/bin/md2pdf に配置
```

## 前提

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) が起動していること
- 初回実行時に `pandoc-ja:latest` イメージを自動ビルドします（数分かかります）

## 使い方

```bash
md2pdf note.md                        # → note.pdf を同ディレクトリに生成
md2pdf note.md -o output.pdf          # 出力先を指定
md2pdf note.md --margin 20mm          # マージン変更（デフォルト: 25mm）
md2pdf --help
md2pdf --version
```

YAMLフロントマター（title/author 等）は不要です。Markdownをそのままの体裁でPDF化します。

## Claude Code skill として使う

```bash
npx skills add taiseee/md2pdf -g
```

## アンインストール

```bash
# Homebrew
brew uninstall md2pdf

# make install の場合
make uninstall
```

## ライセンス

MIT
