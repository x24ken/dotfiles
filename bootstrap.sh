#!/bin/bash

# Mac環境セットアップ - ブートストラップスクリプト
# 新しいMacでこのスクリプト1つを実行すれば、全て自動セットアップされます

set -e

echo "🚀 Mac環境セットアップを開始します..."
echo ""

# 1. Command Line Tools のインストール確認
echo "📦 Command Line Tools の確認中..."
if ! xcode-select -p &> /dev/null; then
    echo "Command Line Tools をインストールします..."
    xcode-select --install
    echo "⚠️  インストールダイアログが表示されたら、指示に従ってインストールしてください"
    echo "インストール完了後、このスクリプトを再実行してください："
    echo "  bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/x24ken/dotfiles/main/bootstrap.sh)\""
    exit 0
else
    echo "✅ Command Line Tools は既にインストールされています"
fi

# 2. Homebrew のインストール確認
echo "📦 Homebrew の確認中..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew をインストールします..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Silicon の場合、PATH を追加
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    echo "✅ Homebrew のインストールが完了しました"
else
    echo "✅ Homebrew は既にインストールされています"
fi

# 3. dotfiles リポジトリのクローン
echo "📥 dotfiles リポジトリの確認中..."
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    echo "dotfiles ディレクトリが既に存在します。最新版に更新します..."
    cd "$DOTFILES_DIR"
    git pull origin main
else
    echo "dotfiles リポジトリをクローンします..."
    git clone https://github.com/x24ken/dotfiles.git "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# 4. セットアップスクリプトを実行
echo "🔧 セットアップスクリプトを実行します..."
bash "$DOTFILES_DIR/setup.sh"

echo ""
echo "🎉 ブートストラップ完了！"
echo ""
