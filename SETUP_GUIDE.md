# 🤖 Claude Code向けセットアップガイド

このガイドは、Claude Codeがこのdotfilesリポジトリを使ってMac環境をセットアップするための手順書です。

---

## 📋 前提条件

以下がインストール済みであることを確認してください：
- ✅ Command Line Tools
- ✅ Homebrew
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
5. iTerm2設定の適用
   - Dynamic Profiles（自動色分け）
   - 全体設定（Hotkey Window、キーバインドなど）← 確認後にインポート
6. NVMのインストール

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

ユーザーに以下を確認：
- **GitHub Personal Access Token**: 必要かどうか、必要な場合は取得方法を案内

`~/.env` を編集：
```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="ユーザーが入力したトークン"
```

**トークンが不要な場合**:
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
- [ ] `~/.env` が存在する（空でもOK）
- [ ] oh-my-zshが動作している
- [ ] NVMが動作している
- [ ] エイリアス（cc, ccr等）が動作している
- [ ] iTerm2 Dynamic Profilesが設定されている（iTerm2使用時）

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
- MongoDB
- VS Code + 拡張機能
- iTerm2設定
  - Dynamic Profiles（プロジェクトごとの色分け）
  - Hotkey Window（Ctrl+Ctrl で上から表示）
  - キーバインド、ウィンドウ設定など

設定ファイル：
- ~/.zshrc → ~/dotfiles/.zshrc
- ~/.gitconfig → ~/dotfiles/.gitconfig
- ~/.gitconfig.local（個人設定）
- ~/.env（環境変数）
- ~/Library/Preferences/com.googlecode.iterm2.plist（iTerm2設定）
- ~/Library/Application Support/iTerm2/DynamicProfiles/profiles.json

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

1. **VS Code設定の同期**
   - Settings Syncを有効化

2. **SSH鍵の生成**（必要な場合）
   ```bash
   ssh-keygen -t ed25519 -C "user@email.com"
   ```

3. **Node.jsのインストール**（必要な場合）
   ```bash
   nvm install --lts
   nvm use --lts
   ```

4. **Pythonのインストール**（必要な場合）
   ```bash
   pyenv install 3.12.0
   pyenv global 3.12.0
   ```

---

## 📚 参考情報

- **dotfilesの更新方法**: [README.md](./README.md) の「既存環境の更新」セクション
- **パッケージ詳細**: [PACKAGES.md](./PACKAGES.md)
- **トラブルシューティング**: [README.md](./README.md) の「トラブルシューティング」セクション
