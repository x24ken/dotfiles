# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="agnoster"

# プラグインの設定
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    you-should-use
)

# PATH設定をまとめる
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/x24ken/.npm-global/bin:$PATH"

# 存在しないパスをfpathから削除（oh-my-zsh読み込み前に実行）
fpath=($^fpath(N-/))

# NVM設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java関連の設定（Apple Silicon版Homebrewを使用）
# 必要に応じてJavaのバージョンを指定してください
# export JAVA_HOME=$(brew --prefix openjdk@17)
# export PATH="$JAVA_HOME/bin:$PATH"

# oh-my-zshを読み込む
source $ZSH/oh-my-zsh.sh

# プロンプトのコンテキスト表示を無効化
prompt_context() { }

# 環境変数ファイルを読み込む（秘密情報はここに記載）
[ -f ~/.env ] && source ~/.env

. "$HOME/.local/bin/env"

# git worktreeをgwでエイリアス
alias gw='git worktree'

# Claude Code - 複数アカウント管理
alias claude-personal='CLAUDE_CONFIG_DIR=~/.claude-personal claude'
alias claude-solvere='CLAUDE_CONFIG_DIR=~/.claude-solvere claude'

# claudeをccでエイリアス（引数で切り替え可能）
cc() {
  if [ "$1" = "solvere" ]; then
    CLAUDE_CONFIG_DIR=~/.claude-solvere claude --dangerously-skip-permissions "${@:2}"
  else
    CLAUDE_CONFIG_DIR=~/.claude-personal claude --dangerously-skip-permissions "$@"
  fi
}

ccr() {
  if [ "$1" = "solvere" ]; then
    CLAUDE_CONFIG_DIR=~/.claude-solvere claude --resume --dangerously-skip-permissions "${@:2}"
  else
    CLAUDE_CONFIG_DIR=~/.claude-personal claude --resume --dangerously-skip-permissions "$@"
  fi
}

# solvereアカウント専用のショートカット
ccs() {
  CLAUDE_CONFIG_DIR=~/.claude-solvere claude --dangerously-skip-permissions "$@"
}

ccrs() {
  CLAUDE_CONFIG_DIR=~/.claude-solvere claude --resume --dangerously-skip-permissions "$@"
}


# pythonのエイリアス
alias python="python3.12"
alias pip="pip3.12"

# エディタ設定（Cursor を code コマンドで使用）
export EDITOR="code --wait"
export VISUAL="code --wait"


# iTerm2 Shell Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# bun completions (コメントアウト: Claude Code の AVX 警告の原因)
# [ -s "/Users/x24ken/.bun/_bun" ] && source "/Users/x24ken/.bun/_bun"

# bun (PATH は残す)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
