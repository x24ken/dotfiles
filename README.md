# 🚀 Mac環境セットアップ（dotfiles）

新しいMacで開発環境を素早く構築するための自動セットアップリポジトリです。

## ⚡ クイックスタート（新しいMac）

**ターミナルでこれ1行だけ実行：**

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/x24ken/dotfiles/main/bootstrap.sh)"
```

### 何が実行されるか

1. **Command Line Tools** のインストール（Gitなどの基本ツール）
2. **Homebrew** のインストール（パッケージマネージャー）
3. **このリポジトリ** をクローン（`~/dotfiles`）
4. **セットアップスクリプト** を実行：
   - oh-my-zsh + プラグインのインストール
   - Homebrewパッケージ一括インストール（82個）
   - VS Code拡張機能インストール
   - dotfilesのシンボリックリンク作成

### セットアップ後にやること

個人設定ファイルを編集（名前、メール、トークンなど）：

```bash
# Git設定
nano ~/.gitconfig.local

# 環境変数（トークンなど）
nano ~/.env

# シェル再起動
exec zsh
```

---

## 📦 含まれるもの

### ツール・パッケージ
- **開発ツール**: Git, GitHub CLI, jq, tree
- **開発環境**: Node.js (nvm), Python (複数バージョン), Java, MongoDB
- **エディタ**: VS Code + 拡張機能25個
- **その他**: AWS CLI, Heroku CLI, yt-dlp など

### シェル環境
- **zsh** + **oh-my-zsh** (agnosterテーマ)
- **プラグイン**: zsh-syntax-highlighting, zsh-autosuggestions, you-should-use

---

## 🔐 セキュリティ

秘密情報は以下のファイルで管理し、**Git管理外**に置いています：

- `~/.gitconfig.local` - Git個人設定（名前、メール）
- `~/.env` - トークンなどの秘密情報

これらは`.gitignore`で除外されているため、GitHubに公開されません。

---

## 🔄 既存環境の更新

設定を変更したら：

```bash
cd ~/dotfiles
git add .
git commit -m "Update config"
git push
```

Homebrewパッケージを追加したら：

```bash
cd ~/dotfiles
brew bundle dump --force  # Brewfileを更新
git add Brewfile
git commit -m "Update Brewfile"
git push
```

---

## 🎯 便利なエイリアス

### Claude Code - 複数アカウント管理

```bash
cc              # personalアカウント
cc solvere      # solvereアカウント
ccr             # resume機能付き (personal)
ccr solvere     # resume機能付き (solvere)
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

---

## 📁 ファイル構成

```
~/dotfiles/
├── bootstrap.sh                  # ブートストラップスクリプト（ワンライナー用）
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

## 🛠️ 手動セットアップ（トラブルシューティング用）

ワンライナーが失敗する場合、手動で実行：

```bash
# 1. Command Line Tools
xcode-select --install

# 2. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apple Siliconの場合
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. リポジトリクローン
cd ~
git clone https://github.com/x24ken/dotfiles.git
cd dotfiles

# 4. セットアップ実行
./setup.sh

# 5. 個人設定
cp .gitconfig.local.template ~/.gitconfig.local
cp .env.template ~/.env
nano ~/.gitconfig.local
nano ~/.env

# 6. シェル再起動
exec zsh
```

---

## ⚠️ トラブルシューティング

### Command Line Tools のインストールが止まる場合

App Storeから手動でインストール：
1. App Store を開く
2. "Xcode" で検索
3. インストール後、`xcode-select --install` を実行

### Homebrew のエラー

```bash
brew update
brew doctor
```

---

## 📄 ライセンス

MIT License
