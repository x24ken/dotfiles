# dotfiles リポジトリ - Claude Code向け指示

新しいMacで開発環境を自動構築するための公開リポジトリです。

---

## 🔐 セキュリティ（最重要）

このリポジトリは**公開**されています。以下を厳守してください：

**✅ 含めてOK**: ユーザー名（`x24ken`）、ディレクトリパス、システム設定

**❌ 絶対に含めてはいけない**: パスワード、APIキー、トークン、秘密鍵、メールアドレス、認証情報

**Git管理外のファイル**（`.gitignore`で除外済み、絶対にコミットしない）：
- `~/.gitconfig.local`: 個人のGit設定（名前、メール）
- `~/.env`: 秘密情報

**pre-commit hook**: コミット時に秘密情報を自動検出してブロックします。
誤検知の場合は`hooks/pre-commit`の`ALLOWED_PATTERNS`に追加してください。

---

## 🎯 セットアップ手順

**前提**: Claude Codeがインストール済み（`bootstrap-minimal.sh`実行済み）

### 1. setup.shの実行

```bash
./setup.sh
```

**実行内容**:
1. Homebrewパッケージの一括インストール（Brewfile）
2. oh-my-zsh + zshプラグインのインストール
3. Powerlineフォントのインストール
4. dotfilesのシンボリックリンク作成（.zshrc, .gitconfig）
5. Claude Code設定の適用（パーミッション設定、statusline）
6. pre-commit hookのインストール
7. NVMのインストール
8. macOSシステム設定の適用（オプション、ユーザー確認後）

### 2. 個人設定ファイルの作成

ユーザーに**名前**と**メールアドレス**を確認してから作成：

```bash
cp .gitconfig.local.template ~/.gitconfig.local
# ~/.gitconfig.local を編集（名前、メール）

cp .env.template ~/.env
# 必要に応じて秘密情報を記載（不要なら空のままOK）
```

### 3. シェルの再起動

```bash
exec zsh
```

### 4. 動作確認

```bash
echo $ZSH_THEME    # agnoster
alias cc            # claude
nvm --version       # NVMの確認
gh --version        # GitHub CLI（Brewfileでインストール済み）
```

---

## ⚙️ セットアップの原則

- 既存の設定ファイルは**必ずバックアップ**してから上書き（`~/.dotfiles_backup_YYYYMMDD_HHMMSS/`）
- macOSシステム設定は**必ずユーザーに確認**してから適用
- エラーが発生したら詳細なメッセージと対処法を提示
- 不明な点は推測せず、ユーザーに質問する

---

## ⚠️ よくあるエラーと対処法

| エラー | 対処法 |
|---|---|
| Homebrewのエラー | `brew update && brew doctor` |
| oh-my-zshのインストール失敗 | `rm -rf ~/.oh-my-zsh` → `./setup.sh` |
| シンボリックリンクのエラー | `ls -la ~/.dotfiles_backup_*` で確認 → 既存ファイル削除 → `./setup.sh` |
| NVMのインストール失敗 | `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh \| bash` |

---

## 📝 セットアップ完了の確認

- [ ] `~/.zshrc` → `~/dotfiles/.zshrc` のシンボリックリンク
- [ ] `~/.gitconfig` → `~/dotfiles/.gitconfig` のシンボリックリンク
- [ ] `~/.claude/settings.json` → `~/dotfiles/.claude/settings.json` のシンボリックリンク
- [ ] `~/.gitconfig.local` にユーザー情報が設定されている
- [ ] oh-my-zsh、NVM、エイリアス（cc, ccr, ccw）が動作している

---

## 💡 カスタマイズ時の注意

### パッケージの追加
```bash
brew install <package-name>
brew bundle dump --force
git add Brewfile && git commit -m "Add <package-name>" && git push
```

### macOS設定の変更
`macos-defaults.sh`を編集。各設定はスクリプト内のコメントで説明されています。

### 重要な環境情報
- **Node.js**: NVMでバージョン管理
- **Python**: pyenvでバージョン管理、`python`は`python3`にエイリアス
- **エディタ**: Cursorを使用（`code`コマンドは`cursor`にエイリアス）
