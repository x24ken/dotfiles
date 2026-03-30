# ============================================================
# oh-my-zsh 基本設定
# ============================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# プラグイン
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    you-should-use
)

# 存在しないパスをfpathから削除
fpath=($^fpath(N-/))

# oh-my-zshを読み込む
source $ZSH/oh-my-zsh.sh

# プロンプトのコンテキスト表示を無効化（ユーザー名@ホスト名を非表示）
prompt_context() { }


# ============================================================
# PATH設定
# ============================================================

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"


# ============================================================
# エディタ設定
# ============================================================

export EDITOR="code --wait"
export VISUAL="code --wait"


# ============================================================
# ツール設定
# ============================================================

# NVM (Node.js version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"  # コメントアウト: AVX警告の原因

# Java (必要に応じてコメント解除)
# export JAVA_HOME=$(brew --prefix openjdk@17)
# export PATH="$JAVA_HOME/bin:$PATH"


# ============================================================
# エイリアス
# ============================================================

# Git
alias gw='git worktree'

# Python
alias python="python3"
alias pip="pip3"

# Claude Code
alias cc='claude'
alias ccr='claude --resume'
alias ccw='claude --worktree'


# ============================================================
# 外部ファイルの読み込み
# ============================================================

# 環境変数（秘密情報）
[ -f ~/.env ] && source ~/.env

# ローカル環境変数
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# ローカル設定（マシン固有のカスタマイズ）
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Use Cursor instead of VS Code
alias code="cursor"
