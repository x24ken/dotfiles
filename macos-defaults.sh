#!/bin/bash

# macOSシステム設定の自動化スクリプト
# 現在の設定をエクスポートしたものです

set -e

echo "🖥️  macOSシステム設定を適用します..."
echo ""
echo "⚠️  注意: このスクリプトは以下の設定を変更します："
echo "  - Dock（サイズ、位置、自動非表示）"
echo "  - Finder（隠しファイル表示など）"
echo "  - キーボード（リピート速度）"
echo "  - トラックパッド（タップでクリック）"
echo "  - スクリーンショット（保存場所、フォーマット）"
echo ""
read -p "続行しますか？ (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "⏭️  macOS設定の適用をスキップしました"
    exit 0
fi

echo ""
echo "設定を適用中..."

###############################################################################
# Dock                                                                        #
###############################################################################

echo "📱 Dock設定を適用中..."

# Dockのサイズ
defaults write com.apple.dock tilesize -int 53

# Dockの位置（bottom = 下）
defaults write com.apple.dock orientation -string "bottom"

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# 最近使ったアプリケーションをDockに表示しない
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

echo "📁 Finder設定を適用中..."

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# デフォルトでリスト表示
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# ゴミ箱を空にする前の警告を無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false

###############################################################################
# キーボード                                                                   #
###############################################################################

echo "⌨️  キーボード設定を適用中..."

# キーリピート速度を最速に（2 = 非常に速い）
defaults write NSGlobalDomain KeyRepeat -int 2

# リピート開始までの時間を短く（15 = 短い）
defaults write NSGlobalDomain InitialKeyRepeat -int 15

###############################################################################
# トラックパッド                                                               #
###############################################################################

echo "🖱️  トラックパッド設定を適用中..."

# タップでクリックを有効化
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ナチュラルスクロールを有効化
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

###############################################################################
# スクリーンショット                                                            #
###############################################################################

echo "📸 スクリーンショット設定を適用中..."

# スクリーンショットの保存場所（クリップボードのみ）
defaults write com.apple.screencapture location -string "/dev/null"

# スクリーンショットのフォーマット（clipboard = クリップボード）
defaults write com.apple.screencapture type -string "clipboard"

# スクリーンショットに影を付けない
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# その他のUI設定                                                               #
###############################################################################

echo "🎨 その他のUI設定を適用中..."

# ウィンドウアニメーションを高速化
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# 保存ダイアログを常に展開表示
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# 印刷ダイアログを常に展開表示
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# クラッシュレポートを無効化
defaults write com.apple.CrashReporter DialogType -string "none"

###############################################################################
# アプリケーションの再起動                                                      #
###############################################################################

echo ""
echo "✅ macOS設定の適用が完了しました"
echo ""
echo "以下のアプリケーションを再起動して設定を反映します："
echo "  - Dock"
echo "  - Finder"
echo ""
read -p "再起動しますか？ (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "再起動中..."
    killall Dock
    killall Finder
    echo "✅ 再起動完了"
else
    echo "⚠️  設定を反映するには、以下のコマンドを実行してください："
    echo "  killall Dock && killall Finder"
fi

echo ""
echo "🎉 完了！"
