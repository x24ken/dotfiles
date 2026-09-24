#!/bin/bash

# Mac環境セットアップ - Claude Codeのインストール
# このスクリプトは dotfiles リポジトリをクローンした後に実行します

set -e

echo "🚀 Claude Codeをインストールします..."
echo ""

# 1. Claude Code のインストール
echo ""
echo "📦 Claude Code をインストール中..."
if ! command -v claude &> /dev/null; then
    curl -fsSL https://claude.ai/install.sh | bash
    echo "✅ Claude Code のインストールが完了しました"
else
    echo "✅ Claude Code は既にインストールされています"
fi

# 2. Claude Code 設定の取得（claude-config リポジトリ → ~/.claude）
echo ""
echo "🤖 Claude Code の設定を取得中..."
CLAUDE_DIR="$HOME/.claude"
CLAUDE_CONFIG_REPO="https://github.com/x24ken/claude-config.git"

if [ -d "$CLAUDE_DIR/.git" ]; then
    echo "✅ ~/.claude は既に claude-config で管理されています"
elif [ ! -d "$CLAUDE_DIR" ] || [ -z "$(ls -A "$CLAUDE_DIR" 2>/dev/null)" ]; then
    git clone "$CLAUDE_CONFIG_REPO" "$CLAUDE_DIR"
    git -C "$CLAUDE_DIR" config core.hooksPath git-hooks
    echo "✅ claude-config を ~/.claude にクローンしました"
else
    echo "⚠️  ~/.claude が既に存在し、git 管理されていません"
    echo "   手動で claude-config を取り込んでください:"
    echo "   git clone ${CLAUDE_CONFIG_REPO} /tmp/claude-config"
    echo "   cp -R /tmp/claude-config/. ~/.claude/   # settings.json, CLAUDE.md, hooks/, skills/ など"
    echo "   git -C ~/.claude config core.hooksPath git-hooks"
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
echo "   セットアップして！"
echo "   ────────────────────────────────────────"
echo ""
echo "Claude Codeが残りのセットアップを自動で行います！"
echo ""
