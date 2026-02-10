# ============================================================
# oh-my-zsh 基本設定
# ============================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# プロンプトのコンテキスト表示を無効化
prompt_context() { }

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


# ============================================================
# PATH設定
# ============================================================

export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"


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
alias cc='claude --dangerously-skip-permissions'
alias ccr='claude --resume --dangerously-skip-permissions'


# ============================================================
# 外部ファイルの読み込み
# ============================================================

# 環境変数（秘密情報）
[ -f ~/.env ] && source ~/.env

# ローカル環境変数
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# iTerm2 Shell Integration
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
