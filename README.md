# dotfiles

Config files for macOS (and a couple for Linux). This repo is the reference
copy; files in `$HOME` are kept in sync **by hand** — there is no symlink farm
or `chezmoi`/`stow` yet.

Shell (`zsh`) and Vim configs are intentionally **not** tracked here.

## Layout

| in repo | where it goes |
|---|---|
| `.tmux.conf` | `~/.tmux.conf` |
| `.gitconfig` | `~/.gitconfig` |
| `.gitignore_global` | `~/.gitignore_global` |
| `.editorconfig` | `~/.editorconfig` |
| `.alacritty.toml` | `~/.alacritty.toml` |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` |
| `Ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| `.local/MangoHud/MangoHud.conf` | `~/.config/MangoHud/MangoHud.conf` — Linux only |

## Restore on a new machine

```sh
git clone git@github.com:guezwhoz/dotfiles.git ~/oss/dotfiles
cd ~/oss/dotfiles

cp .tmux.conf .gitconfig .gitignore_global .editorconfig .alacritty.toml ~/

mkdir -p ~/Library/Application\ Support/Code/User
cp vscode/settings.json ~/Library/Application\ Support/Code/User/

mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp Ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/
```
