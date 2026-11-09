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
| `herdr/themes/guezwhoz.json` | `~/.config/herdr-app/themes/guezwhoz.json` |
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

mkdir -p ~/.config/herdr-app/themes
cp herdr/themes/guezwhoz.json ~/.config/herdr-app/themes/
herdr-app do app.theme --name guezwhoz
```

## Herdr theme

`herdr/themes/guezwhoz.json` is a terminal theme for
[Herdr](https://herdr.dev) (the desktop app for terminals and agents). It is
the same palette as the other configs here: `#1b1b1b` background, `#D9D9D9`
text, blue `#5AA0D6` accent, green/teal ANSI set.

Herdr reads every `themes/*.json` on its own and picks it up live, no restart.
The file has the six keys the format knows — `background`, `foreground`,
`selection`, `cursor`, `ansi` (16 colors) and `colors` — and `colors` here
overrides the panel colors Herdr would otherwise derive (`surface`, `popover`,
`raised`, `hover`, `border`, `accent`, status colors, …).

Pick it in Settings → Look, or from the shell:

```sh
herdr-app do app.theme --name guezwhoz
```

To check it loaded, `herdr-app status` must show `"errors": []`; a parse error
there means the layout with that theme was not applied.
