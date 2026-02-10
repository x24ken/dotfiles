# 🚀 Mac環境セットアップ（dotfiles）

新しいMacで開発環境を素早く構築するための自動セットアップリポジトリです。

## 📦 含まれるもの

### ツール・パッケージ
- **Homebrew** - パッケージマネージャー
- **開発ツール**: Git, GitHub CLI, jq, tree など
- **開発環境**: Node.js, Python, Java, MongoDB
- **エディタ**: VS Code（拡張機能含む）
- **その他**: AWS CLI, Heroku CLI, yt-dlp など

### シェル環境
- **zsh** + **oh-my-zsh** (agnosterテーマ)
- **プラグイン**:
  - zsh-syntax-highlighting
  - zsh-autosuggestions
  - you-should-use

### 設定ファイル
- `.zshrc` - シェル設定
- `.gitconfig` - Git設定
- VS Code設定と拡張機能

## 🛠️ セットアップ方法

### 1. このリポジトリをクローン

```bash
cd ~
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
```

### 2. セットアップスクリプトを実行

```bash
chmod +x setup.sh
./setup.sh
```

### 3. 個人設定ファイルを作成

#### Git設定（名前・メールアドレス）

```bash
cp .gitconfig.local.template ~/.gitconfig.local
nano ~/.gitconfig.local
```

`.gitconfig.local`を編集：
```gitconfig
[user]
    name = Your Name
    email = your.email@example.com
```

#### 環境変数（トークンなど）

```bash
cp .env.template ~/.env
nano ~/.env
```

`.env`を編集：
```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="your_token_here"
```

### 4. シェルを再起動

```bash
exec zsh
```

## 📁 ファイル構成

```
~/dotfiles/
├── .gitignore                    # Git管理から除外するファイル
├── README.md                     # このファイル
├── setup.sh                      # 自動セットアップスクリプト
├── Brewfile                      # Homebrewパッケージリスト
├── .zshrc                        # zsh設定（公開版）
├── .gitconfig                    # Git設定（公開版）
├── .gitconfig.local.template     # Git個人設定のテンプレート
└── .env.template                 # 環境変数のテンプレート
```

## 🔐 セキュリティ

秘密情報は以下のファイルで管理し、Git管理外に置いています：

- `~/.gitconfig.local` - 個人のGit設定（名前、メール）
- `~/.env` - トークンなどの秘密情報

これらは`.gitignore`で除外されているため、GitHubに公開されません。

## 🔄 既存環境の更新

現在のMacの設定を更新したい場合：

```bash
cd ~/dotfiles
git pull origin main
./setup.sh
```

## 📝 カスタマイズ

### Homebrewパッケージを追加

新しいパッケージをインストールしたら、Brewfileを更新：

```bash
cd ~/dotfiles
brew bundle dump --force
git add Brewfile
git commit -m "Update Brewfile"
git push
```

### VS Code拡張機能を追加

VS Code拡張機能をインストールしたら、Brewfileに自動反映されます：

```bash
cd ~/dotfiles
brew bundle dump --force
```

## 🎯 使い方のヒント

### Claude Code - 複数アカウント管理

```bash
# personalアカウントで使用
cc

# solvereアカウントで使用
cc solvere

# resume機能付き
ccr          # personal
ccr solvere  # solvere
```

### Git エイリアス

```bash
git s   # status
git l   # log --oneline
git cm  # commit -m
git a   # add
git p   # push
git ds  # diff --staged
```

### Git Worktree

```bash
gw list
gw add <path> <branch>
```

## 📚 参考リンク

- [Homebrew](https://brew.sh/)
- [oh-my-zsh](https://ohmyz.sh/)
- [VS Code](https://code.visualstudio.com/)

## ⚠️ トラブルシューティング

### セットアップ中にエラーが出た場合

1. Homebrewのアップデート
   ```bash
   brew update
   brew upgrade
   ```

2. スクリプトを再実行
   ```bash
   ./setup.sh
   ```

### zshプラグインが動かない場合

```bash
rm -rf ~/.oh-my-zsh
./setup.sh
```

## 📄 ライセンス

MIT License
