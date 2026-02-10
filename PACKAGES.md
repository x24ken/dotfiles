# 📦 インストールされるパッケージ詳細

このファイルでは、`Brewfile`で自動インストールされる全パッケージの詳細を説明します。

---

## 🛠️ CLI ツール

### 開発ツール

#### `gh` - GitHub CLI
- **説明**: GitHubをコマンドラインから操作できる公式CLIツール
- **用途**: リポジトリのクローン、PR作成/レビュー、Issue管理、認証など
- **必須度**: ⭐⭐⭐ 必須（プライベートリポジトリのクローンに使用）
- **参考**: https://cli.github.com/

#### `jq` - JSON プロセッサ
- **説明**: コマンドラインでJSONを操作・整形するツール
- **用途**: APIレスポンスの解析、JSON整形、フィルタリング
- **必須度**: ⭐⭐ 推奨
- **使用例**:
  ```bash
  curl https://api.github.com/users/octocat | jq '.name'
  ```

#### `tree` - ディレクトリツリー表示
- **説明**: ディレクトリ構造をツリー形式で視覚化
- **用途**: プロジェクト構造の確認、ドキュメント作成
- **必須度**: ⭐ 便利ツール
- **使用例**:
  ```bash
  tree -L 2  # 2階層まで表示
  ```

---

### クラウド・インフラ

#### `awscli` - AWS CLI
- **説明**: Amazon Web Servicesの公式コマンドラインツール
- **用途**: S3、EC2、Lambda等のAWSリソース管理
- **必須度**: ⭐⭐ AWSを使う場合は必須
- **参考**: https://aws.amazon.com/cli/

#### `heroku` - Heroku CLI
- **説明**: Herokuの公式コマンドラインツール
- **用途**: アプリのデプロイ、ログ確認、環境変数管理
- **必須度**: ⭐⭐ Herokuを使う場合は必須
- **参考**: https://devcenter.heroku.com/articles/heroku-cli

#### `minio/stable/mc` - MinIO Client
- **説明**: S3互換のオブジェクトストレージ操作ツール
- **用途**: MinIO/S3へのファイルアップロード・ダウンロード
- **必須度**: ⭐ MinIOを使う場合に必要
- **参考**: https://min.io/docs/minio/linux/reference/minio-mc.html

---

### Node.js 関連

#### `node` - Node.js
- **説明**: JavaScriptランタイム環境
- **用途**: JavaScript/TypeScript開発、npm/yarnの実行
- **必須度**: ⭐⭐⭐ Web開発に必須
- **参考**: https://nodejs.org/

#### `n` - Node.js バージョン管理
- **説明**: Node.jsのバージョンを簡単に切り替えられるツール
- **用途**: プロジェクトごとに異なるNode.jsバージョンを使用
- **必須度**: ⭐⭐ 複数バージョンを使う場合に推奨
- **使用例**:
  ```bash
  n 18.0.0      # Node.js 18.0.0に切り替え
  n latest      # 最新版に切り替え
  ```

#### `nodebrew` - Node.js バージョン管理
- **説明**: Node.jsバージョン管理ツール（`n`と同様）
- **用途**: Node.jsのバージョン切り替え
- **必須度**: ⭐ `n`またはNVMがあれば不要
- **備考**: `n`、`nodebrew`、NVMのいずれか1つで十分

#### `yarn` - パッケージマネージャー
- **説明**: Node.jsのパッケージマネージャー（npmの代替）
- **用途**: 依存パッケージの高速インストール、ロックファイル管理
- **必須度**: ⭐⭐ プロジェクトがyarnを使用する場合は必須
- **参考**: https://yarnpkg.com/

---

### Python 関連

#### `pyenv` - Python バージョン管理
- **説明**: 複数のPythonバージョンを管理・切り替えるツール
- **用途**: プロジェクトごとに異なるPythonバージョンを使用
- **必須度**: ⭐⭐⭐ Python開発に推奨
- **使用例**:
  ```bash
  pyenv install 3.12.0
  pyenv global 3.12.0
  ```

#### `python@3.9` - Python 3.9
- **説明**: Python 3.9の固定バージョン
- **用途**: 特定バージョンが必要なプロジェクト用
- **必須度**: ⭐ pyenvがあれば不要
- **備考**: pyenvで管理する方が柔軟

#### `python@3.10` - Python 3.10
- **説明**: Python 3.10の固定バージョン
- **用途**: 特定バージョンが必要なプロジェクト用
- **必須度**: ⭐ pyenvがあれば不要

---

### Java 関連

#### `openjdk@11` - OpenJDK 11
- **説明**: Java Development Kit バージョン11
- **用途**: Java 11が必要なプロジェクト
- **必須度**: ⭐⭐ Java開発する場合は必須
- **参考**: https://openjdk.org/

#### `openjdk@17` - OpenJDK 17
- **説明**: Java Development Kit バージョン17（LTS）
- **用途**: Java 17が必要なプロジェクト
- **必須度**: ⭐⭐ Java開発する場合は必須
- **備考**: `link: true`で`java`コマンドとして使用可能

---

### データベース

#### `mongodb-community` - MongoDB
- **説明**: NoSQLドキュメント指向データベース
- **用途**: ローカル開発環境でのMongoDB使用
- **必須度**: ⭐⭐ MongoDBを使うプロジェクトで必須
- **参考**: https://www.mongodb.com/

#### `mongosh` - MongoDB Shell
- **説明**: MongoDBの公式シェルツール
- **用途**: MongoDBへの接続、クエリ実行、データ操作
- **必須度**: ⭐⭐ MongoDBを使う場合は必須
- **使用例**:
  ```bash
  mongosh "mongodb://localhost:27017"
  ```

---

### その他ツール

#### `switchaudio-osx` - 音声出力切り替え
- **説明**: macOSの音声出力デバイスをコマンドラインから切り替え
- **用途**: スクリプトでの音声デバイス切り替え
- **必須度**: ⭐ 便利ツール
- **使用例**:
  ```bash
  SwitchAudioSource -a  # 利用可能なデバイス一覧
  ```

#### `wimlib` - Windows Imaging Library
- **説明**: Windowsイメージファイル（WIM）を操作するツール
- **用途**: Windows ISOの作成・編集
- **必須度**: ⭐ 特殊用途
- **備考**: Windows関連の作業をしない場合は不要

#### `yt-dlp` - YouTube ダウンローダー
- **説明**: YouTubeやその他動画サイトから動画をダウンロード
- **用途**: 動画のダウンロード、音声抽出
- **必須度**: ⭐ 趣味・学習用
- **使用例**:
  ```bash
  yt-dlp "https://www.youtube.com/watch?v=..."
  ```
- **参考**: https://github.com/yt-dlp/yt-dlp

#### `zsh` - Z Shell
- **説明**: 高機能なシェル
- **用途**: コマンドライン環境
- **必須度**: ⭐ macOSに標準搭載されているため不要
- **備考**: macOS Catalina以降は標準シェル

---

## 💻 アプリケーション（Cask）

### `claude-code` - Claude Code CLI
- **説明**: AnthropicのClaude AIをコマンドラインから使用
- **用途**: AIアシスタントによるコーディング支援
- **必須度**: ⭐⭐⭐ このdotfilesリポジトリを管理する上で推奨
- **参考**: https://docs.anthropic.com/

### `visual-studio-code` - VS Code
- **説明**: Microsoftの軽量コードエディタ
- **用途**: コーディング、デバッグ、Git操作
- **必須度**: ⭐⭐⭐ 必須
- **参考**: https://code.visualstudio.com/

---

## 🔌 VS Code 拡張機能

### Web開発

#### `anthropic.claude-code` - Claude Code
- **説明**: VS Code内でClaude AIを使用
- **用途**: AIアシスタントによるコード生成、リファクタリング

#### `bradlc.vscode-tailwindcss` - Tailwind CSS IntelliSense
- **説明**: Tailwind CSSのオートコンプリート、シンタックスハイライト
- **用途**: Tailwind CSS開発の効率化

#### `csstools.postcss` - PostCSS Language Support
- **説明**: PostCSSファイルのシンタックスハイライト
- **用途**: PostCSS設定ファイルの編集

#### `dbaeumer.vscode-eslint` - ESLint
- **説明**: JavaScriptのリンティングツール
- **用途**: コード品質チェック、自動修正

#### `esbenp.prettier-vscode` - Prettier
- **説明**: コード整形ツール
- **用途**: 保存時の自動フォーマット

#### `formulahendry.auto-rename-tag` - Auto Rename Tag
- **説明**: HTMLタグを自動でリネーム
- **用途**: 開始タグを変更すると終了タグも自動変更

#### `unifiedjs.vscode-mdx` - MDX
- **説明**: MDXファイルのサポート
- **用途**: Next.js、Gatsby等でMDXを使用する場合

---

### Python 開発

#### `ms-python.debugpy` - Python Debugger
- **説明**: Pythonデバッガー
- **用途**: ブレークポイント、ステップ実行

#### `ms-python.python` - Python
- **説明**: Python開発の基本拡張機能
- **用途**: シンタックスハイライト、IntelliSense、リンティング

#### `ms-python.vscode-pylance` - Pylance
- **説明**: 高速なPython言語サーバー
- **用途**: 型チェック、オートコンプリート

---

### Git 関連

#### `eamodio.gitlens` - GitLens
- **説明**: Git機能の強化
- **用途**: Blame表示、コミット履歴、リポジトリ管理

#### `jackiotyu.git-worktree-manager` - Git Worktree Manager
- **説明**: Git Worktreeを管理
- **用途**: 複数ブランチを同時に開発

---

### データベース・API

#### `prisma.prisma` - Prisma
- **説明**: Prisma ORMのサポート
- **用途**: スキーマファイルの編集、オートコンプリート

#### `rangav.vscode-thunder-client` - Thunder Client
- **説明**: REST APIクライアント
- **用途**: API テスト（Postmanの代替）

---

### テスト・CI/CD

#### `vitest.explorer` - Vitest Explorer
- **説明**: Vitestテストランナー
- **用途**: テストの実行、デバッグ

#### `github.vscode-github-actions` - GitHub Actions
- **説明**: GitHub Actionsのサポート
- **用途**: ワークフローファイルの編集、実行状況確認

#### `anysphere.cursorpyright` - Pyright for Cursor
- **説明**: Cursor向けPython型チェッカー
- **用途**: Cursorエディタ使用時のPython型チェック
- **備考**: VS Codeのみ使用の場合は不要

---

### テーマ・UI

#### `equinusocio.vsc-material-theme` - Material Theme
- **説明**: Materialデザインのカラーテーマ
- **用途**: エディタの見た目をカスタマイズ

#### `pkief.material-icon-theme` - Material Icon Theme
- **説明**: Materialアイコンセット
- **用途**: ファイルアイコンの視認性向上

#### `vira.vsc-vira-theme` - Vira Theme
- **説明**: Viraカラーテーマ
- **用途**: エディタの見た目をカスタマイズ

---

### その他便利ツール

#### `ms-ceintl.vscode-language-pack-ja` - 日本語言語パック
- **説明**: VS Codeの日本語化
- **用途**: UIを日本語表示

#### `streetsidesoftware.code-spell-checker` - Code Spell Checker
- **説明**: スペルチェッカー
- **用途**: タイポの検出

#### `vstirbu.vscode-mermaid-preview` - Mermaid Preview
- **説明**: Mermaid図のプレビュー
- **用途**: MarkdownでのUML図、フローチャート作成

#### `yzhang.markdown-all-in-one` - Markdown All in One
- **説明**: Markdown機能強化
- **用途**: 目次生成、キーボードショートカット、プレビュー

---

## 🗑️ 削除を検討してもよいパッケージ

### 重複しているもの
- `n` と `nodebrew` と NVM（.zshrcで設定）
  - **推奨**: いずれか1つのみ残す

- `python@3.9`, `python@3.10` と `pyenv`
  - **推奨**: pyenvのみで管理

- `zsh`
  - **推奨**: 削除（macOSに標準搭載）

### 使用頻度が低い可能性があるもの
- `switchaudio-osx` - 音声切り替え
- `wimlib` - Windowsイメージング
- `yt-dlp` - YouTube DL
- `minio/stable/mc` - MinIO使わない場合
- `heroku` - Heroku使わない場合
- `mongodb-community`, `mongosh` - MongoDB使わない場合
- `openjdk@11`, `openjdk@17` - Java使わない場合

### VS Code拡張機能
- `anysphere.cursorpyright` - Cursor専用（VS Codeでは不要）
- `vira.vsc-vira-theme` - テーマが重複

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

### VS Code拡張機能を追加する

```bash
# 拡張機能をインストール（VS Codeで）
# その後、Brewfileを更新
cd ~/dotfiles
brew bundle dump --force

# コミット
git add Brewfile
git commit -m "Add VS Code extension"
git push
```
