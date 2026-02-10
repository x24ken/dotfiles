# 🖥️ macOSシステム設定の詳細

このファイルでは、`macos-defaults.sh`で適用されるmacOSシステム設定の詳細を説明します。

---

## 📱 Dock設定

### Dockのサイズ
```bash
defaults write com.apple.dock tilesize -int 53
```
**設定値**: `53`
**説明**: Dockのアイコンサイズを53ピクセルに設定（デフォルトは64）
**効果**: Dockが少し小さくなり、画面スペースを有効活用

### Dockの位置
```bash
defaults write com.apple.dock orientation -string "bottom"
```
**設定値**: `bottom`（下）
**選択肢**: `left`（左）、`bottom`（下）、`right`（右）
**説明**: Dockを画面下部に配置

### Dockの自動非表示
```bash
defaults write com.apple.dock autohide -bool true
```
**設定値**: `true`（有効）
**説明**: Dockを自動的に隠し、マウスを近づけると表示
**効果**: 画面スペースを最大化、必要な時だけ表示

### 最近使ったアプリの非表示
```bash
defaults write com.apple.dock show-recents -bool false
```
**設定値**: `false`（無効）
**説明**: Dockに「最近使ったアプリケーション」を表示しない
**効果**: Dockがすっきりし、必要なアプリだけが表示される

---

## 📁 Finder設定

### 隠しファイルの表示
```bash
defaults write com.apple.finder AppleShowAllFiles -bool true
```
**設定値**: `true`（表示）
**説明**: `.`で始まる隠しファイルをFinderで表示
**効果**: `.gitignore`、`.env`などの設定ファイルが見える

### ファイル拡張子を常に表示
```bash
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```
**設定値**: `true`（表示）
**説明**: すべてのファイルの拡張子を表示
**効果**: `document.txt`が常に`.txt`付きで表示される

### パスバーの表示
```bash
defaults write com.apple.finder ShowPathbar -bool true
```
**設定値**: `true`（表示）
**説明**: Finderウィンドウ下部に現在のパスを表示
**効果**: 現在いる場所が一目でわかる

### ステータスバーの表示
```bash
defaults write com.apple.finder ShowStatusBar -bool true
```
**設定値**: `true`（表示）
**説明**: Finderウィンドウ下部にファイル数、空き容量を表示
**効果**: フォルダ内の情報が常に見える

### デフォルトビュー
```bash
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
```
**設定値**: `Nlsv`（リスト表示）
**選択肢**:
- `icnv` - アイコン表示
- `Nlsv` - リスト表示
- `clmv` - カラム表示
- `Flwv` - ギャラリー表示

**説明**: Finderを開いた時のデフォルト表示形式
**効果**: 多くのファイルを一覧で確認しやすい

### ゴミ箱を空にする警告の無効化
```bash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
```
**設定値**: `false`（警告なし）
**説明**: ゴミ箱を空にする時の確認ダイアログを表示しない
**効果**: ワンクリックでゴミ箱を空にできる

---

## ⌨️ キーボード設定

### キーリピート速度
```bash
defaults write NSGlobalDomain KeyRepeat -int 2
```
**設定値**: `2`（非常に速い）
**範囲**: `2`（最速）〜 `120`（最遅）
**説明**: キーを押し続けた時の文字入力速度
**効果**: カーソル移動やテキスト削除が高速化

### リピート開始までの時間
```bash
defaults write NSGlobalDomain InitialKeyRepeat -int 15
```
**設定値**: `15`（短い）
**範囲**: `15`（最短）〜 `120`（最長）
**説明**: キーを押してからリピートが始まるまでの時間
**効果**: 素早く反応、効率的なタイピング

---

## 🖱️ トラックパッド設定

### タップでクリック
```bash
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
```
**設定値**: `true`（有効）
**説明**: トラックパッドを軽くタップするだけでクリック
**効果**: 物理的にクリックする必要がなく、疲れにくい

### ナチュラルスクロール
```bash
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
```
**設定値**: `true`（有効）
**説明**: スクロール方向がiPhone/iPadと同じ（上にスワイプで下にスクロール）
**効果**: モバイルデバイスと統一された操作感

---

## 📸 スクリーンショット設定

### 保存場所
```bash
defaults write com.apple.screencapture location -string "/dev/null"
```
**設定値**: `/dev/null`
**説明**: スクリーンショットをファイルとして保存しない
**効果**: クリップボードにのみコピーされる（デスクトップが散らからない）

### フォーマット
```bash
defaults write com.apple.screencapture type -string "clipboard"
```
**設定値**: `clipboard`
**選択肢**: `png`, `jpg`, `pdf`, `clipboard`
**説明**: スクリーンショットの保存形式
**効果**: クリップボードに直接コピー、すぐに貼り付け可能

### 影の無効化
```bash
defaults write com.apple.screencapture disable-shadow -bool true
```
**設定値**: `true`（無効）
**説明**: ウィンドウのスクリーンショットで影を付けない
**効果**: よりクリーンな画像

---

## 🎨 その他のUI設定

### ウィンドウアニメーション速度
```bash
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
```
**設定値**: `0.001`（ほぼ瞬時）
**説明**: ウィンドウのリサイズアニメーション速度
**効果**: UIの反応が高速化

### 保存ダイアログの展開表示
```bash
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
```
**設定値**: `true`（常に展開）
**説明**: 保存ダイアログを常に詳細表示で開く
**効果**: 毎回展開ボタンを押す手間が省ける

### 印刷ダイアログの展開表示
```bash
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
```
**設定値**: `true`（常に展開）
**説明**: 印刷ダイアログを常に詳細表示で開く
**効果**: 印刷オプションがすぐに見える

### クラッシュレポートの無効化
```bash
defaults write com.apple.CrashReporter DialogType -string "none"
```
**設定値**: `none`（無効）
**説明**: アプリがクラッシュした時の報告ダイアログを表示しない
**効果**: 邪魔なダイアログが表示されない

---

## 🔄 設定の適用方法

### 自動適用（推奨）
```bash
cd ~/dotfiles
./setup.sh
```
セットアップ中に確認されます。

### 手動適用
```bash
cd ~/dotfiles
./macos-defaults.sh
```

### 特定の設定のみ適用
```bash
# Dockのサイズだけ変更
defaults write com.apple.dock tilesize -int 53
killall Dock

# Finderで隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder
```

---

## ⚠️ 注意事項

1. **設定の反映には再起動が必要**
   - Dock、Finderは自動で再起動されます
   - その他の設定は、アプリの再起動またはログアウト/ログインが必要な場合があります

2. **バックアップ**
   - 現在の設定は自動でバックアップされません
   - 心配な場合は、事前に設定をメモしておいてください

3. **元に戻す方法**
   - 各設定を手動で元に戻すか、macOSの「システム設定」から変更できます

---

## 📚 参考リンク

- [macOS defaults コマンドリファレンス](https://macos-defaults.com/)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)（有名なdotfilesリポジトリ）

---

## 💡 カスタマイズ

`macos-defaults.sh`を編集して、好みの設定に変更できます。

例：
```bash
# Dockを左に配置
defaults write com.apple.dock orientation -string "left"

# Dockのサイズを大きく
defaults write com.apple.dock tilesize -int 80

# スクリーンショットをデスクトップに保存
defaults write com.apple.screencapture location -string "~/Desktop"
defaults write com.apple.screencapture type -string "png"
```

設定を変更したら：
```bash
cd ~/dotfiles
git add macos-defaults.sh
git commit -m "Update macOS settings"
git push
```
