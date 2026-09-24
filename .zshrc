# ============================================================
# oh-my-zsh 基本設定
# ============================================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# プラグイン（oh-my-zsh 同梱 + custom に clone したもの）
plugins=(
    git
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


# ============================================================
# エディタ設定
# ============================================================

export EDITOR="vim"
export VISUAL="vim"


# ============================================================
# ツール設定
# ============================================================

# mise (Node.js version manager)
command -v mise >/dev/null && eval "$(mise activate zsh)"

# uv (Python) は brew の PATH 上にあるため初期化不要


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
alias ccc='claude --continue'
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


# ============================================================
# brew 管理の zsh プラグイン（syntax-highlighting は最後に読む）
# ============================================================

[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
