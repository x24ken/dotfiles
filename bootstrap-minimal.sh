#!/bin/bash

# Mac環境セットアップ - フェーズ1: Claude Codeまでのインストール
# このスクリプトは最小限のツールをインストールし、
# その後はClaude Codeを使って残りのセットアップを自動化します

set -e

echo "🚀 Mac環境セットアップ（フェーズ1）を開始します..."
echo ""
echo "このスクリプトは以下をインストールします："
echo "  1. Command Line Tools"
echo "  2. Homebrew"
echo "  3. GitHub CLI"
echo "  4. Claude Code"
echo ""
echo "その後、Claude Codeを使って残りのセットアップを自動化します。"
echo ""

# 1. Command Line Tools のインストール確認
echo "📦 Command Line Tools の確認中..."
if ! xcode-select -p &> /dev/null; then
    echo "Command Line Tools をインストールします..."
    xcode-select --install
    echo ""
    echo "⚠️  インストールダイアログが表示されたら、指示に従ってインストールしてください"
    echo "インストール完了後、このスクリプトを再実行してください："
    echo ""
    echo "  bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/x24ken/dotfiles/main/bootstrap-minimal.sh)\""
    echo ""
    exit 0
else
    echo "✅ Command Line Tools は既にインストールされています"
fi

# 2. Homebrew のインストール確認
echo ""
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

# 3. GitHub CLI のインストール
echo ""
echo "📦 GitHub CLI をインストール中..."
if ! command -v gh &> /dev/null; then
    brew install gh
    echo "✅ GitHub CLI のインストールが完了しました"
else
    echo "✅ GitHub CLI は既にインストールされています"
fi

# 4. GitHub 認証
echo ""
echo "🔐 GitHub 認証を行います..."
if ! gh auth status &> /dev/null; then
    echo "GitHub にログインしてください"
    echo ""
    echo "以下を選択してください："
    echo "  1. GitHub.com"
    echo "  2. HTTPS"
    echo "  3. Login with a web browser"
    echo ""
    gh auth login
    echo "✅ GitHub 認証が完了しました"
else
    echo "✅ 既に GitHub 認証済みです"
fi

# 5. Claude Code のインストール
echo ""
echo "📦 Claude Code をインストール中..."
if ! command -v claude &> /dev/null; then
    brew install --cask claude-code
    echo "✅ Claude Code のインストールが完了しました"
else
    echo "✅ Claude Code は既にインストールされています"
fi

# 完了メッセージ
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 フェーズ1完了！"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "次はClaude Codeを使ってセットアップを自動化します。"
echo ""
echo "【次のステップ】"
echo ""
echo "1. Claude Code を起動："
echo "   cc"
echo ""
echo "2. 以下のように指示してください："
echo ""
echo "   ────────────────────────────────────────"
echo "   ~/dotfiles リポジトリをクローンして、"
echo "   SETUP_GUIDE.md に従ってセットアップして！"
echo "   ────────────────────────────────────────"
echo ""
echo "Claude Codeが残りのセットアップを自動で行います。"
echo "エラーが発生しても、Claude Codeが対応してくれます。"
echo ""
