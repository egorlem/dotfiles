# dotfiles

Config files for macOS (and a couple for Linux). This repo is the reference
copy; files in `$HOME` are kept in sync **by hand** — there is no symlink farm
or `chezmoi`/`stow` yet.

## Layout

| in repo | where it goes |
|---|---|
| `.zshrc`, `.zprofile` | `~/.zshrc`, `~/.zprofile` |
| `.vimrc` | `~/.vimrc` |
| `vim/spell/ru.utf-8.add` | `~/.vim/spell/ru.utf-8.add` |
| `.tmux.conf` | `~/.tmux.conf` |
| `.gitconfig` | `~/.gitconfig` |
| `.gitignore_global` | `~/.gitignore_global` |
| `.editorconfig` | `~/.editorconfig` |
| `.alacritty.toml` | `~/.alacritty.toml` |
| `vscode/settings.json` | `~/Library/Application Support/Code/User/settings.json` |
| `Ghostty/config` | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| `.local/MangoHud/MangoHud.conf` | `~/.config/MangoHud/MangoHud.conf` — Linux only |

## Not versioned on purpose

Vim spell dictionaries are compiled, not authored:

```sh
vim -u NONE -c "mkspell ~/.vim/spell/ru.utf-8.add ~/.vim/spell/ru.utf-8.add" -c q
```

Only `*.utf-8.add` (the word list) is tracked. `*.spl` / `*.sug` are ignored and
rebuilt locally — they used to add 4.2 MB of binaries to this repo.

## Restore on a new machine

```sh
git clone git@github.com:guezwhoz/dotfiles.git ~/oss/dotfiles
cd ~/oss/dotfiles

cp .zshrc .zprofile .vimrc .gitconfig .gitignore_global .editorconfig .alacritty.toml ~/
cp .tmux.conf ~/
mkdir -p ~/.vim/spell && cp vim/spell/ru.utf-8.add ~/.vim/spell/
mkdir -p ~/Library/Application\ Support/Code/User
cp vscode/settings.json ~/Library/Application\ Support/Code/User/
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
cp Ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/
```

Then open a new shell and rebuild the spell files (see above).
