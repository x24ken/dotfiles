# 🚀 Mac環境セットアップ（dotfiles）

新しいMacで開発環境を素早く構築するための自動セットアップリポジトリです。

## ⚡ クイックスタート（新しいMac）

### フェーズ1: 基本ツールのインストール

ターミナル.appで以下を順番に実行（iTerm2はセットアップ後に使えるようになります）：

```bash
# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# GitHub CLI のインストールと認証
brew install gh
gh auth login

# リポジトリのクローン
cd ~
gh repo clone x24ken/dotfiles
cd dotfiles

# Claude Codeのインストール
./bootstrap-minimal.sh
```

### フェーズ2: Claude Codeで自動セットアップ

```bash
claude --dangerously-skip-permissions
```

Claude Codeに以下のように伝える：

```
SETUP_GUIDE.md に従ってセットアップして！
```

<details>
<summary>手動セットアップの場合</summary>

```bash
cd ~/dotfiles
./setup.sh
nano ~/.gitconfig.local
nano ~/.env
exec zsh
```

</details>

---

## 📋 何が実行されるか

`setup.sh` が以下を自動実行します：

1. **Homebrewパッケージ** インストール（awscli, gh, jq, pyenv, tree, yt-dlp, claude-code, docker, iterm2）
2. **oh-my-zsh** + プラグイン インストール（syntax-highlighting, autosuggestions, you-should-use）
3. **dotfiles** のシンボリックリンク作成（.zshrc, .gitconfig）
4. **Claude Code設定** 適用
5. **NVM** インストール（Node.jsバージョン管理）

---

## 🎯 便利なエイリアス

### Claude Code

```bash
cc              # claude
ccr             # claude --resume
ccw             # claude --worktree
```

### Git

```bash
git s   # status
git l   # log --oneline
git cm  # commit -m
git a   # add
git p   # push
git ds  # diff --staged
gw      # git worktree
```

### その他

```bash
python  # python3
pip     # pip3
code    # cursor
```

---

## 🔐 セキュリティ

秘密情報はGit管理外のファイルで管理：

- `~/.gitconfig.local` - Git個人設定（名前、メール）
- `~/.env` - トークンなどの秘密情報

---

## 📁 ファイル構成

```
~/dotfiles/
├── bootstrap-minimal.sh          # Claude Codeインストール
├── setup.sh                      # メインセットアップスクリプト
├── macos-defaults.sh             # macOSシステム設定
├── Brewfile                      # Homebrewパッケージリスト
├── .zshrc                        # zsh設定
├── .gitconfig                    # Git設定
├── .gitconfig.local.template     # Git個人設定テンプレート
├── .env.template                 # 環境変数テンプレート
├── .claude-settings.json         # Claude Code設定
├── CLAUDE.md                     # Claude Code向け指示
├── SETUP_GUIDE.md                # セットアップ手順書
├── PACKAGES.md                   # パッケージ詳細
├── MACOS_SETTINGS.md             # macOS設定詳細
└── README.md                     # このファイル
```

---

## ⚠️ トラブルシューティング

### Homebrew のエラー

```bash
brew update
brew doctor
```

### oh-my-zsh のインストールが失敗する

```bash
rm -rf ~/.oh-my-zsh
./setup.sh
```

---

## 📄 ライセンス

MIT License
