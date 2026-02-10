# iTerm2 Dynamic Profiles 設定

iTerm2の設定をDynamic Profilesで管理するためのプロジェクトです。

## 📁 ディレクトリ構造

```
~/dotfiles/iterm2/
├── DynamicProfiles/
│   └── profiles.json          # プロファイル定義
├── README.md                   # このファイル
└── com.googlecode.iterm2.plist.backup  # バックアップ
```

## 🚀 セットアップ方法

### 1. Shell Integrationの有効化（必須）

Automatic Profile Switchingを使うには、iTerm2がディレクトリを追跡できる必要があります。

```bash
# .zshrcに以下を追加（すでに追加済み）
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
```

または、iTerm2メニューから：
iTerm2 > Install Shell Integration

### 2. シンボリックリンクの作成

```bash
# iTerm2のDynamicProfilesディレクトリにリンクを作成
ln -sf ~/dotfiles/iterm2/DynamicProfiles/profiles.json \
  ~/Library/Application\ Support/iTerm2/DynamicProfiles/profiles.json
```

### 3. iTerm2の再起動

設定を反映するために、iTerm2を再起動してください。

### 4. プロファイルの確認

iTerm2 > Preferences > Profiles で以下のプロファイルが追加されているはずです：

- 🟢 Dev Project (緑のボックスカーソル)
- 🟠 Staging (オレンジの縦棒カーソル)
- 🔴 Production (赤のアンダーラインカーソル)
- 🏠 Personal (青のボックスカーソル)
- ⚙️ Algomatic (紫の縦棒カーソル) - **~/algomatic配下で自動切り替え**

## 🎨 プロファイルの特徴

### カーソルの種類
- **Type 0**: ボックス (■)
- **Type 1**: 縦棒 (|)
- **Type 2**: アンダーライン (_)

### 色による区別
各プロファイルは以下で区別できます：
- カーソルの色
- バッジ（右上の薄いラベル）
- カーソルガイドの色

## 🔧 カスタマイズ方法

### 新しいプロファイルの追加

`DynamicProfiles/profiles.json` を編集して、`Profiles` 配列に追加：

```json
{
  "Name": "新しいプロファイル",
  "Guid": "unique-id-here",
  "Dynamic Profile Parent Name": "Default",
  "Cursor Type": 0,
  "Cursor Color": {
    "Red Component": 1.0,
    "Green Component": 1.0,
    "Blue Component": 1.0
  },
  "Badge Text": "🎯 LABEL",
  "Tags": ["custom"]
}
```

### フォルダーごとに自動切り替え

プロファイルのJSONに `"Automatic Profile Switching Rules"` を追加することで、ディレクトリベースの自動切り替えができます。

```json
{
  "Name": "My Project",
  "Automatic Profile Switching Rules": [
    "/Users/yourname/my-project/*"
  ]
}
```

**重要な注意点：**
- パスは絶対パスで指定（`~`は使えません）
- ワイルドカード`*`でサブディレクトリも含める
- Shell Integrationが必須

**すでに設定済みの自動切り替え：**
- `/Users/x24ken/algomatic/*` → ⚙️ Algomatic プロファイル

GUIからも設定可能：
iTerm2 > Preferences > Profiles > 各プロファイル > Advanced > Automatic Profile Switching

## 📝 設定ファイルの管理

### バックアップの復元

問題が発生した場合：

```bash
cp ~/dotfiles/iterm2/com.googlecode.iterm2.plist.backup \
  ~/Library/Preferences/com.googlecode.iterm2.plist
```

### 変更の確認

```bash
# 設定ファイルの内容を確認
cat ~/dotfiles/iterm2/DynamicProfiles/profiles.json | jq .
```

### Gitで管理

```bash
cd ~/dotfiles
git add iterm2/
git commit -m "Update iTerm2 profiles"
```

## 🎯 おすすめの使い方

1. **まずは試す**: デフォルトで用意された4つのプロファイルを試してみる
2. **自動切り替えを設定**: よく使うディレクトリで自動切り替えを設定
3. **カスタマイズ**: 必要に応じて色やカーソルタイプを調整
4. **Gitで管理**: 変更をコミットして履歴を残す

## 🔗 参考リンク

- [iTerm2 Dynamic Profiles 公式ドキュメント](https://iterm2.com/documentation-dynamic-profiles.html)
- [iTerm2 Automatic Profile Switching](https://iterm2.com/documentation-automatic-profile-switching.html)

## ⚠️ 注意事項

- プロファイルのGuidは必ず一意にしてください
- iTerm2を再起動しないと変更が反映されない場合があります
- 既存のプロファイルと名前が被らないように注意してください
