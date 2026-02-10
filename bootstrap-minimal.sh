#!/bin/bash

# Mac環境セットアップ - iTerm2とClaude Codeのインストール
# このスクリプトは dotfiles リポジトリをクローンした後に実行します

set -e

echo "🚀 iTerm2とClaude Codeをインストールします..."
echo ""

# 1. Homebrew の確認
if ! command -v brew &> /dev/null; then
    echo "❌ エラー: Homebrewがインストールされていません"
    echo "README.mdの手順に従って、Homebrewをインストールしてください"
    exit 1
fi

# 2. iTerm2 のインストール
echo "📦 iTerm2 をインストール中..."
if [ ! -d "/Applications/iTerm.app" ]; then
    brew install --cask iterm2
    echo "✅ iTerm2 のインストールが完了しました"
else
    echo "✅ iTerm2 は既にインストールされています"
fi

# 3. Claude Code のインストール
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
echo "🎉 インストール完了！"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "【次のステップ】"
echo ""
echo "1. iTerm2を起動："
echo "   Spotlight（⌘+Space）で「iTerm」と入力"
echo ""
echo "2. dotfilesディレクトリに移動："
echo "   cd ~/dotfiles"
echo ""
echo "3. Claude Codeを起動："
echo "   cc"
echo ""
echo "4. Claude Codeに以下のように指示："
echo ""
echo "   ────────────────────────────────────────"
echo "   SETUP_GUIDE.md に従ってセットアップして！"
echo "   ────────────────────────────────────────"
echo ""
echo "Claude Codeが残りのセットアップを自動で行います！"
echo ""
