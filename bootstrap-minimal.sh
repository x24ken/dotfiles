#!/bin/bash

# Mac環境セットアップ - Claude Codeのインストール
# このスクリプトは dotfiles リポジトリをクローンした後に実行します

set -e

echo "🚀 Claude Codeをインストールします..."
echo ""

# 1. Homebrew の確認
if ! command -v brew &> /dev/null; then
    echo "❌ エラー: Homebrewがインストールされていません"
    echo "README.mdの手順に従って、Homebrewをインストールしてください"
    exit 1
fi

# 2. Claude Code のインストール
echo ""
echo "📦 Claude Code をインストール中..."
if ! command -v claude &> /dev/null; then
    brew install --cask claude-code
    echo "✅ Claude Code のインストールが完了しました"
else
    echo "✅ Claude Code は既にインストールされています"
fi

# 3. Claude Code 設定の適用
echo ""
echo "🤖 Claude Code の設定を適用中..."
DOTFILES_DIR="$HOME/dotfiles"
mkdir -p "$HOME/.claude"

if [ -f "${DOTFILES_DIR}/.claude-settings.json" ]; then
    ln -sf "${DOTFILES_DIR}/.claude-settings.json" "$HOME/.claude/settings.json"
    echo "✅ Claude Code の設定を適用しました"
    echo "   （すべてのコマンドが自動許可されます。危険なコマンドのみ確認が必要です）"
else
    echo "⚠️  設定ファイルが見つかりません: ${DOTFILES_DIR}/.claude-settings.json"
fi

# 完了メッセージ
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 インストール完了！"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "【次のステップ】"
echo ""
echo "1. Claude Codeを起動："
echo "   claude --dangerously-skip-permissions"
echo ""
echo "2. Claude Codeに以下のように指示："
echo ""
echo "   ────────────────────────────────────────"
echo "   SETUP_GUIDE.md に従ってセットアップして！"
echo "   ────────────────────────────────────────"
echo ""
echo "Claude Codeが残りのセットアップを自動で行います！"
echo ""
