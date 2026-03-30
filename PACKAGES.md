# 📦 インストールされるパッケージ詳細

このファイルでは、`Brewfile`で自動インストールされる全パッケージの詳細を説明します。

---

## 🛠️ CLI ツール

#### `awscli` - AWS CLI
- **説明**: Amazon Web Servicesの公式コマンドラインツール
- **用途**: S3、EC2、Lambda等のAWSリソース管理
- **参考**: https://aws.amazon.com/cli/

#### `gh` - GitHub CLI
- **説明**: GitHubをコマンドラインから操作できる公式CLIツール
- **用途**: リポジトリのクローン、PR作成/レビュー、Issue管理、認証など
- **参考**: https://cli.github.com/

#### `jq` - JSON プロセッサ
- **説明**: コマンドラインでJSONを操作・整形するツール
- **用途**: APIレスポンスの解析、JSON整形、フィルタリング

#### `pyenv` - Python バージョン管理
- **説明**: 複数のPythonバージョンを管理・切り替えるツール
- **用途**: プロジェクトごとに異なるPythonバージョンを使用

#### `tree` - ディレクトリツリー表示
- **説明**: ディレクトリ構造をツリー形式で視覚化
- **用途**: プロジェクト構造の確認、ドキュメント作成

#### `yt-dlp` - YouTube ダウンローダー
- **説明**: YouTubeやその他動画サイトから動画をダウンロード
- **用途**: 動画のダウンロード、音声抽出
- **参考**: https://github.com/yt-dlp/yt-dlp

---

## 💻 アプリケーション（Cask）

#### `claude-code` - Claude Code CLI
- **説明**: AnthropicのClaude AIをコマンドラインから使用
- **用途**: AIアシスタントによるコーディング支援
- **参考**: https://docs.anthropic.com/

#### `docker` - Docker
- **説明**: コンテナ型仮想化プラットフォーム
- **用途**: 開発環境の構築、アプリケーションのコンテナ化

#### `iterm2` - iTerm2
- **説明**: macOS用の高機能ターミナルエミュレータ
- **用途**: 分割ペイン、ホットキーウィンドウ、検索など標準ターミナルより高機能

---

## 📝 カスタマイズ方法

### パッケージを追加する

```bash
# パッケージをインストール
brew install <package-name>

# Brewfileを更新
cd ~/dotfiles
brew bundle dump --force

# コミット
git add Brewfile
git commit -m "Add <package-name>"
git push
```

### パッケージを削除する

```bash
# Brewfileから該当行を削除
nano ~/dotfiles/Brewfile

# コミット
git add Brewfile
git commit -m "Remove <package-name>"
git push
```
