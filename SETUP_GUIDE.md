# 🤖 Claude Code向けセットアップガイド

このガイドは、Claude Codeがこのdotfilesリポジトリを使ってMac環境をセットアップするための手順書です。

---

## 📋 前提条件

以下がインストール済みであることを確認してください：
- ✅ Homebrew（Command Line Toolsも自動インストールされる）
- ✅ GitHub CLI（認証済み）
- ✅ Claude Code

---

## 🎯 セットアップ手順

### 1. リポジトリのクローン

```bash
cd ~
gh repo clone x24ken/dotfiles
cd dotfiles
```

**確認ポイント**:
- リポジトリが正常にクローンできたか
- `~/dotfiles` ディレクトリが存在するか

---

### 2. セットアップスクリプトの実行

```bash
./setup.sh
```

**このスクリプトが実行すること**:
1. Homebrewパッケージの一括インストール（Brewfile）
2. oh-my-zshのインストール
3. zshプラグインのインストール
4. dotfilesのシンボリックリンク作成（.zshrc, .gitconfig）
5. **Claude Code設定の適用**
   - パーミッション設定（ほぼすべてのコマンドを自動許可）
   - `~/.claude/settings.json` へのシンボリックリンク作成
6. NVMのインストール
8. macOSシステム設定の適用（オプション）
   - Dock、Finder、キーボード、トラックパッドなど ← 確認後に適用

**エラーハンドリング**:
- Homebrewのエラー → `brew update && brew doctor` を実行してから再試行
- 権限エラー → 適切な権限で実行
- ネットワークエラー → 再試行
- その他のエラー → エラーメッセージを確認して適切に対応

---

### 3. 個人設定ファイルの作成

#### 3-1. Git設定

```bash
cp .gitconfig.local.template ~/.gitconfig.local
```

ユーザーに以下を確認：
- **名前**: Git commitに表示される名前
- **メールアドレス**: Git commitに表示されるメールアドレス

確認後、`~/.gitconfig.local` を編集：
```gitconfig
[user]
    name = ユーザーが入力した名前
    email = ユーザーが入力したメールアドレス
```

#### 3-2. 環境変数設定

```bash
cp .env.template ~/.env
```

必要に応じて秘密情報を記載：
```bash
# 例:
# export SOME_API_KEY="your_key_here"
```

**特に設定が不要な場合**:
- `.env`ファイルは空のまま、または削除してもOK

---

### 4. シェルの再起動

```bash
exec zsh
```

---

### 5. 動作確認

以下のコマンドを実行して、正常に動作するか確認：

```bash
# oh-my-zshが動作しているか
echo $ZSH_THEME

# エイリアスが動作しているか
alias cc
alias ccr

# NVMが動作しているか
nvm --version

# Homebrewパッケージが正しくインストールされているか
gh --version
jq --version
```

---

## ⚠️ よくあるエラーと対処法

### エラー1: oh-my-zshのインストール失敗

**原因**: ネットワークエラー、または既にインストール済み

**対処法**:
```bash
# 既存のoh-my-zshを削除して再インストール
rm -rf ~/.oh-my-zsh
./setup.sh
```

---

### エラー2: Homebrewパッケージのインストール失敗

**原因**: Homebrewの状態が不安定

**対処法**:
```bash
brew update
brew doctor
# エラーメッセージに従って修正
./setup.sh
```

---

### エラー3: シンボリックリンクのエラー

**原因**: 既存のファイルが存在する

**対処法**:
```bash
# バックアップが作成されているか確認
ls -la ~/.dotfiles_backup_*

# 問題なければ、既存ファイルを削除
rm ~/.zshrc ~/.gitconfig

# setup.shを再実行
./setup.sh
```

---

### エラー4: NVMのインストール失敗

**原因**: ネットワークエラー

**対処法**:
```bash
# 手動でNVMをインストール
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# シェルを再起動
exec zsh
```

---

## ✅ セットアップ完了の確認

以下が全て満たされていれば、セットアップ完了です：

- [ ] `~/dotfiles` ディレクトリが存在する
- [ ] `~/.zshrc` が `~/dotfiles/.zshrc` へのシンボリックリンクになっている
- [ ] `~/.gitconfig` が `~/dotfiles/.gitconfig` へのシンボリックリンクになっている
- [ ] `~/.gitconfig.local` が存在し、ユーザー情報が設定されている
- [ ] `~/.claude/settings.json` が `~/dotfiles/.claude-settings.json` へのシンボリックリンクになっている
- [ ] `~/.env` が存在する（空でもOK）
- [ ] oh-my-zshが動作している
- [ ] NVMが動作している
- [ ] エイリアス（cc, ccr等）が動作している

---

## 📝 ユーザーへの最終報告

セットアップが完了したら、以下の情報をユーザーに報告してください：

```
✅ Mac環境のセットアップが完了しました！

インストールされたもの：
- oh-my-zsh（テーマ: agnoster）
- zshプラグイン（syntax-highlighting, autosuggestions, you-should-use）
- 開発ツール（gh, jq, tree, awscli等）
- Node.js環境（NVM）
- Python環境（pyenv）
- Claude Code、Docker

設定ファイル：
- ~/.zshrc → ~/dotfiles/.zshrc
- ~/.gitconfig → ~/dotfiles/.gitconfig
- ~/.gitconfig.local（個人設定）
- ~/.env（環境変数）

便利なエイリアス：
- cc: Claude Code起動
- ccr: Claude Code（resume）
- gw: git worktree

シェルを再起動すると、全ての設定が有効になります：
  exec zsh

何か問題があれば、お知らせください。
```

---

## 🔄 追加の最適化（オプション）

セットアップ完了後、ユーザーに以下を提案できます：

1. **SSH鍵の生成**（必要な場合）
   ```bash
   ssh-keygen -t ed25519 -C "user@email.com"
   ```

2. **Node.jsのインストール**（必要な場合）
   ```bash
   nvm install --lts
   nvm use --lts
   ```

3. **Pythonのインストール**（必要な場合）
   ```bash
   pyenv install 3.12.0
   pyenv global 3.12.0
   ```

---

## 📚 参考情報

- **パッケージ詳細**: [PACKAGES.md](./PACKAGES.md)
- **macOS設定詳細**: [MACOS_SETTINGS.md](./MACOS_SETTINGS.md)
- **トラブルシューティング**: [README.md](./README.md) の「トラブルシューティング」セクション
