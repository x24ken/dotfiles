# 🚀 Mac環境セットアップ（dotfiles）

新しいMacで開発環境を素早く構築するための自動セットアップリポジトリです。

## ⚡ クイックスタート（新しいMac）

### フェーズ1: 基本ツールのインストール

ターミナル.appで以下を順番に実行（iTerm2はセットアップ後に使えるようになります）：

```bash
# Homebrew のインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# リポジトリのクローン
git clone https://github.com/x24ken/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Claude Codeのインストール
./bootstrap-minimal.sh
```

### フェーズ2: Claude Codeで自動セットアップ

```bash
claude --dangerously-skip-permissions
```

Claude Codeに以下のように伝える：

```
セットアップして！
```

<details>
<summary>手動セットアップの場合</summary>

```bash
cd ~/dotfiles
./setup.sh
nano ~/.gitconfig.local
nano ~/.env
exec zsh
```

</details>

---

## 📋 セットアップされるもの一覧

### パッケージ

| パッケージ | 種類 | 用途 |
|---|---|---|
| gh | CLI | GitHub操作 |
| tree | CLI | ディレクトリ表示 |
| iterm2 | App | ターミナル |
| claude-code | CLI | AI開発支援（curl経由でインストール） |

### シェル環境

| 項目 | 設定 |
|---|---|
| oh-my-zsh | テーマ: agnoster |
| zshプラグイン | syntax-highlighting, autosuggestions, you-should-use |
| Powerlineフォント | agnosterテーマ用 |
| NVM | Node.jsバージョン管理 |
| デフォルトエディタ | cursor |

### エイリアス

| エイリアス | 展開先 | |
|---|---|---|
| cc | claude | |
| ccc | claude --continue | |
| ccr | claude --resume | |
| ccw | claude --worktree | |
| gw | git worktree | |
| git s / l / cm / a / p / ds | status / log --oneline / commit -m / add / push / diff --staged | |
| python / pip | python3 / pip3 | |
| code | cursor | |

### Git設定

| 項目 | 設定 |
|---|---|
| core.editor | cursor |
| push.autoSetupRemote | true（新ブランチのpushで--set-upstream不要） |

### Claude Code設定

| 項目 | 設定 |
|---|---|
| パーミッション | ほぼ全許可（破壊コマンドはdeny/ask） |
| statusline | ctx/5h/7d使用率 + worktree検出 |
| alwaysThinking | ON |
| autoMemory | ON |

### macOS設定（オプション）

| カテゴリ | 設定 |
|---|---|
| Dock | サイズ53、下配置、自動非表示、最近のアプリ非表示 |
| Finder | 隠しファイル表示、拡張子表示、パスバー、ステータスバー、リスト表示、ホームフォルダ |
| キーボード | リピート最速、開始時間最短 |
| トラックパッド | タップでクリック、ナチュラルスクロール |
| スクリーンショット | クリップボードのみ、影なし |
| UI | ダークモード、アニメーション高速化、スクロールバーはスクロール時のみ |
| テキスト入力 | スペルチェックOFF、スマート引用符OFF、自動大文字化OFF、ライブ変換OFF |

### セキュリティ

| 項目 | 設定 |
|---|---|
| pre-commit hook | 秘密情報（APIキー、トークン、メール等）の混入を自動検出・ブロック |
| .gitignore | .env, .gitconfig.local, .zshrc.local を除外 |

---

## 🎛️ オプション設定

### iTerm2 ホットキーウィンドウ

ショートカットキーで上からターミナルがスライドして出てくる設定。

```bash
# Dynamic Profilesとしてインストール
cp ~/dotfiles/iterm2/hotkey-window.json ~/Library/Application\ Support/iTerm2/DynamicProfiles/
```

インストール後、iTerm2で以下を手動設定：

1. Settings > Profiles > Hotkey Window > Keys > Hotkey Window で Configure Hotkey Window
2. 以下の設定にする：
   - **Double-tap key**: Control にチェック
   - **Pin hotkey window**: ON（フォーカスを失っても閉じない）
   - **Animate showing and hiding**: ON
   - **Floating window**: ON
   - **On Dock icon click**: Show this Hotkey Window

---

## 📁 ファイル構成

```
~/dotfiles/
├── bootstrap-minimal.sh          # Claude Codeインストール
├── setup.sh                      # メインセットアップスクリプト
├── macos-defaults.sh             # macOSシステム設定
├── Brewfile                      # Homebrewパッケージリスト
├── hooks/pre-commit              # 秘密情報混入防止hook
├── .zshrc                        # zsh設定
├── .gitconfig                    # Git設定
├── .gitconfig.local.template     # Git個人設定テンプレート
├── .env.template                 # 環境変数テンプレート
├── .claude/settings.json         # Claude Code設定
├── .claude/statusline.py         # Claude Code statusline
├── CLAUDE.md                     # Claude Code向け指示・セットアップ手順
└── README.md                     # このファイル
```

---

## ⚠️ トラブルシューティング

### Homebrew のエラー

```bash
brew update
brew doctor
```

### oh-my-zsh のインストールが失敗する

```bash
rm -rf ~/.oh-my-zsh
./setup.sh
```

---

## 📄 ライセンス

MIT License
