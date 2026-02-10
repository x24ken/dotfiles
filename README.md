# 🚀 Mac環境セットアップ（dotfiles）

新しいMacで開発環境を素早く構築するための自動セットアップリポジトリです。

## ⚡ クイックスタート（新しいMac）

### ステップ1: 基本ツールのインストール

ターミナルでこれをコピペ実行：

```bash
# Command Line Tools のインストール
xcode-select --install

# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apple Silicon の場合、PATH を追加
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# GitHub CLI のインストール
brew install gh

# GitHub 認証
gh auth login
```

`gh auth login` では以下を選択：
1. **GitHub.com**
2. **HTTPS**
3. **Login with a web browser**（ブラウザでログイン）

### ステップ2: 自動セットアップ実行

```bash
# リポジトリをクローン
cd ~
gh repo clone x24ken/dotfiles
cd dotfiles

# セットアップスクリプトを実行
./setup.sh
```

### ステップ3: 個人設定（1分）

```bash
# Git設定（名前とメールアドレス）
nano ~/.gitconfig.local

# 環境変数（GitHubトークンなど）
nano ~/.env

# シェルを再起動
exec zsh
```

**完了！🎉**

---

## 📋 何が実行されるか

`setup.sh` が以下を自動実行します：

1. ✅ **oh-my-zsh** インストール
2. ✅ **zshプラグイン** インストール（syntax-highlighting, autosuggestions, you-should-use）
3. ✅ **82個のパッケージ** 一括インストール（Node.js, Python, MongoDB, AWS CLI など）
4. ✅ **VS Code拡張機能** 25個インストール
5. ✅ **dotfiles** のシンボリックリンク作成（.zshrc, .gitconfig）
6. ✅ **NVM** インストール（Node.jsバージョン管理）

---

## 📦 含まれるもの

### ツール・パッケージ
- **開発ツール**: Git, GitHub CLI (gh), jq, tree
- **開発環境**: Node.js (nvm, n, nodebrew), Python (複数バージョン, pyenv), Java (OpenJDK 11/17), MongoDB
- **エディタ**: VS Code + 拡張機能25個
- **その他**: AWS CLI, Heroku CLI, yt-dlp, Deno, Bun

### シェル環境
- **zsh** + **oh-my-zsh** (agnosterテーマ)
- **プラグイン**: zsh-syntax-highlighting, zsh-autosuggestions, you-should-use

### VS Code 拡張機能
Tailwind CSS, ESLint, Prettier, GitLens, Thunder Client, Prisma, Vitest など

---

## 🔐 セキュリティ

秘密情報は以下のファイルで管理し、**Git管理外**に置いています：

- `~/.gitconfig.local` - Git個人設定（名前、メール）
- `~/.env` - トークンなどの秘密情報

これらは`.gitignore`で除外されているため、Gitにコミットされません。

### 個人設定ファイルの編集

#### ~/.gitconfig.local
```gitconfig
[user]
    name = Your Name
    email = your.email@example.com
```

#### ~/.env
```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="your_token_here"
```

---

## 🔄 既存環境の更新

### 設定ファイルを変更したら

```bash
cd ~/dotfiles
git add .
git commit -m "Update config"
git push
```

### Homebrewパッケージを追加したら

```bash
cd ~/dotfiles
brew bundle dump --force  # Brewfileを更新
git add Brewfile
git commit -m "Update Brewfile"
git push
```

### 別のMacで最新版を取得

```bash
cd ~/dotfiles
git pull
./setup.sh
```

---

## 🎯 便利なエイリアス

### Claude Code - 複数アカウント管理

```bash
cc              # personalアカウントで使用
cc solvere      # solvereアカウントで使用
ccs             # solvereアカウント専用ショートカット

ccr             # resume機能付き (personal)
ccr solvere     # resume機能付き (solvere)
ccrs            # resume機能付き (solvere専用)
```

### Git エイリアス

```bash
git s   # status
git l   # log --oneline
git cm  # commit -m
git a   # add
git p   # push
git ds  # diff --staged
gw      # git worktree
```

### Python エイリアス

```bash
python  # python3.12
pip     # pip3.12
```

---

## 📁 ファイル構成

```
~/dotfiles/
├── setup.sh                      # メインセットアップスクリプト
├── Brewfile                      # Homebrewパッケージリスト
├── .zshrc                        # zsh設定
├── .gitconfig                    # Git設定
├── .gitconfig.local.template     # Git個人設定のテンプレート
├── .env.template                 # 環境変数のテンプレート
├── .gitignore                    # 除外ファイル
└── README.md                     # このファイル
```

---

## ⚠️ トラブルシューティング

### Command Line Tools のインストールが失敗する

App Storeから手動でインストール：
1. App Store を開く
2. "Xcode" で検索してインストール
3. 再度 `xcode-select --install` を実行

### Homebrew のエラー

```bash
brew update
brew doctor
```

### oh-my-zsh のインストールが失敗する

```bash
rm -rf ~/.oh-my-zsh
cd ~/dotfiles
./setup.sh
```

### VS Code拡張機能がインストールされない

Brewfileから手動でインストール：
```bash
cd ~/dotfiles
brew bundle --file=Brewfile
```

### シンボリックリンクのエラー

既存のファイルをバックアップ：
```bash
mv ~/.zshrc ~/.zshrc.backup
mv ~/.gitconfig ~/.gitconfig.backup
cd ~/dotfiles
./setup.sh
```

---

## 🚀 応用：複数Macで設定を同期

### Mac A で設定を変更

```bash
cd ~/dotfiles
# 設定ファイルを編集
nano .zshrc
git add .zshrc
git commit -m "Update zsh config"
git push
```

### Mac B で最新版を取得

```bash
cd ~/dotfiles
git pull
exec zsh  # シェルを再起動して反映
```

---

## 📚 参考リンク

- [Homebrew](https://brew.sh/)
- [oh-my-zsh](https://ohmyz.sh/)
- [GitHub CLI](https://cli.github.com/)
- [VS Code](https://code.visualstudio.com/)

---

## 💡 カスタマイズのヒント

### 自分好みのテーマに変更

`.zshrc`の5行目を編集：
```bash
ZSH_THEME="robbyrussell"  # または powerlevel10k など
```

### VS Code設定を追加

```bash
# 現在のVS Code設定をエクスポート
code --list-extensions > ~/dotfiles/vscode-extensions.txt
```

### エイリアスを追加

`.zshrc`にカスタムエイリアスを追加：
```bash
alias ll="ls -la"
alias dc="docker-compose"
```

---

## 📄 ライセンス

MIT License
