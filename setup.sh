#!/bin/bash

# Mac環境セットアップスクリプト
# 新しいMacでこのスクリプトを実行すると、環境が自動構築されます

set -e

echo "🚀 Mac環境セットアップを開始します..."

# カレントディレクトリをスクリプトの場所に移動
cd "$(dirname "$0")"
DOTFILES_DIR=$(pwd)

# 1. Homebrewのインストール確認
echo "📦 Homebrewの確認中..."
if ! command -v brew &> /dev/null; then
    echo "Homebrewをインストールします..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Apple Siliconの場合、PATHを追加
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew は既にインストールされています"
fi

# 2. Brewfileから全パッケージをインストール
echo "📦 Homebrewパッケージをインストール中..."
set +e
brew bundle --file="${DOTFILES_DIR}/Brewfile"
BREW_BUNDLE_EXIT=$?
set -e
if [ $BREW_BUNDLE_EXIT -ne 0 ]; then
    echo "⚠️  一部のパッケージのインストールに失敗しました（終了コード: $BREW_BUNDLE_EXIT）"
    echo "    失敗したパッケージは後で手動インストールできます: brew bundle --file=${DOTFILES_DIR}/Brewfile"
    echo "    セットアップを続行します..."
fi

# 3. oh-my-zshのインストール
echo "🐚 oh-my-zshの確認中..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zshをインストールします..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ oh-my-zsh は既にインストールされています"
fi

# 4. zshプラグインのインストール
echo "🔌 zshプラグインをインストール中..."

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# you-should-use
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
fi

# 5. Powerlineフォントのインストール
echo "🔤 Powerlineフォントの確認中..."
if ls ~/Library/Fonts/Noto*Powerline* &> /dev/null; then
    echo "✅ Powerlineフォントは既にインストールされています"
else
    echo "Powerlineフォントをインストールします..."
    FONTS_TMPDIR=$(mktemp -d)
    git clone --depth=1 https://github.com/powerline/fonts.git "$FONTS_TMPDIR/fonts"
    cd "$FONTS_TMPDIR/fonts"
    ./install.sh
    cd "$DOTFILES_DIR"
    rm -rf "$FONTS_TMPDIR"
    echo "✅ Powerlineフォントをインストールしました"
fi

# 6. dotfilesのシンボリックリンクを作成
echo "🔗 dotfilesのシンボリックリンクを作成中..."

# バックアップディレクトリを作成
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# 既存ファイルがあればバックアップ
for file in .zshrc .gitconfig; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "既存の $file をバックアップします: $BACKUP_DIR/$file"
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi
done

# シンボリックリンクを作成
ln -sf "${DOTFILES_DIR}/.zshrc" "$HOME/.zshrc"
ln -sf "${DOTFILES_DIR}/.gitconfig" "$HOME/.gitconfig"

# Claude Code設定のシンボリックリンクを作成
echo "🤖 Claude Code設定を適用中..."
mkdir -p "$HOME/.claude"

if [ -f "$HOME/.claude/settings.json" ] && [ ! -L "$HOME/.claude/settings.json" ]; then
    echo "既存の Claude Code設定をバックアップします: $BACKUP_DIR/.claude-settings.json"
    mv "$HOME/.claude/settings.json" "$BACKUP_DIR/.claude-settings.json"
fi

ln -sf "${DOTFILES_DIR}/.claude-settings.json" "$HOME/.claude/settings.json"

if [ -f "${DOTFILES_DIR}/.claude/statusline.py" ]; then
    if [ -f "$HOME/.claude/statusline.py" ] && [ ! -L "$HOME/.claude/statusline.py" ]; then
        echo "既存の statusline.py をバックアップします: $BACKUP_DIR/.claude-statusline.py"
        mv "$HOME/.claude/statusline.py" "$BACKUP_DIR/.claude-statusline.py"
    fi
    ln -sf "${DOTFILES_DIR}/.claude/statusline.py" "$HOME/.claude/statusline.py"
fi
echo "✅ Claude Code設定を適用しました"

# pre-commit hookのインストール
echo "🔒 pre-commit hook をインストール中..."
if [ -f "${DOTFILES_DIR}/hooks/pre-commit" ]; then
    ln -sf "${DOTFILES_DIR}/hooks/pre-commit" "${DOTFILES_DIR}/.git/hooks/pre-commit"
    echo "✅ pre-commit hook をインストールしました（秘密情報の混入防止）"
else
    echo "⚠️  hooks/pre-commit が見つかりません"
fi

# 7. テンプレートファイルから個人設定を作成
echo "⚙️  個人設定ファイルの確認中..."

if [ ! -f "$HOME/.gitconfig.local" ]; then
    echo "⚠️  ~/.gitconfig.local が見つかりません"
    echo "テンプレートからコピーして、あなたの情報を入力してください："
    echo "  cp ${DOTFILES_DIR}/.gitconfig.local.template ~/.gitconfig.local"
    echo "  nano ~/.gitconfig.local"
fi

if [ ! -f "$HOME/.env" ]; then
    echo "⚠️  ~/.env が見つかりません"
    echo "テンプレートからコピーして、必要に応じて編集してください："
    echo "  cp ${DOTFILES_DIR}/.env.template ~/.env"
    echo "  nano ~/.env"
fi

# 8. NVMのインストール（Node.jsバージョン管理）
echo "📦 NVMの確認中..."
if [ ! -d "$HOME/.nvm" ]; then
    echo "NVMをインストールします..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
else
    echo "✅ NVM は既にインストールされています"
fi

# 9. macOSシステム設定の適用（オプション）
echo ""
if [ -f "${DOTFILES_DIR}/macos-defaults.sh" ]; then
    echo "🖥️  macOSシステム設定を適用しますか？"
    echo "（Dock、Finder、キーボード、トラックパッドなどの設定）"
    read -p "適用しますか？ (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bash "${DOTFILES_DIR}/macos-defaults.sh"
    else
        echo "⏭️  macOS設定の適用をスキップしました"
        echo "後で適用する場合: bash ~/dotfiles/macos-defaults.sh"
    fi
fi

echo ""
echo "✅ セットアップ完了！"
echo ""
echo "📝 次のステップ："
echo "  1. 個人設定ファイルを編集してください："
echo "     - ~/.gitconfig.local (名前とメールアドレス)"
echo "     - ~/.env (秘密情報)"
echo ""
echo "  2. シェルを再起動してください："
echo "     exec zsh"
echo ""
