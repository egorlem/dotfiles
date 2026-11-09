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
| `herdr/themes/gwz.json` | `~/.config/herdr-app/themes/gwz.json` |
| `herdr/tui-theme.toml` | `[theme]` block of `~/.config/herdr/config.toml` — merge by hand |
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
cp herdr/themes/gwz.json ~/.config/herdr-app/themes/
herdr-app do app.theme --name gwz

# TUI: paste the [theme] block from herdr/tui-theme.toml into
# ~/.config/herdr/config.toml, then validate:
herdr config check
```

## Herdr theme

`herdr/themes/gwz.json` is a terminal theme for
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
herdr-app do app.theme --name gwz
```

To check it loaded, `herdr-app status` must show `"errors": []`; a parse error
there means the layout with that theme was not applied.

### TUI (`herdr`)

`herdr/tui-theme.toml` carries the same palette to the terminal build of
Herdr (the `herdr` binary). It is a snippet, not a whole config: it is the
`[theme]` block of `~/.config/herdr/config.toml`. Replace the existing
`[theme]` / `[theme.custom]` blocks with it and run `herdr config check`
(`config: ok` means it parses; the TUI reads it on next start).

Mapping from the app theme, so both versions look the same:

| Herdr app | TUI token |
|---|---|
| `background` | `panel_bg` |
| `chrome` | `sidebar_bg` |
| `canvas` | `surface_dim` |
| `surface` / `raised` | `surface0` / `active_row_bg` |
| `popover` | `surface1` |
| `selected` | `selection_bg` — a step brighter (`#313a45` instead of `#24262c`) so the Navigate cursor still reads above `active_row_bg` |
| `foreground` | `text` |
| `muted` / `dim` | `subtext0` / `overlay1` |
| `border` | `overlay0` — set to `#8C8C8C`, not the app's `#333333` border: Herdr draws dim UI text with it and `#333333` was unreadable |
| `accent` | `accent`, `blue` |
| `cyan` `ansi6`, `mauve` `ansi5` | `teal`, `mauve` |
| `working` `ansi3`, `blocked` `ansi1`, `done` `ansi2` | `yellow`, `red`, `green` |

The TUI has no per-pane ANSI palette of its own — pane colors come from the
host terminal, which already runs the same scheme (`theme = guezwhoz` in
Ghostty). `peach` has no counterpart in the app theme (no orange in the
palette) and is set to `ansi11` `#d1ed85`.
