# ------------------------------------------------------------
# Environment variables
# ------------------------------------------------------------
export GBDKDIR=/opt/gbdk
export DEVKITPRO=/opt/devkitpro
export DEVKITARM="$DEVKITPRO/devkitARM"
export DEVKITPPC="$DEVKITPRO/devkitPPC"

export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"
export PNPM_HOME="$HOME/Library/pnpm"

# ------------------------------------------------------------
# Standard macOS paths: /etc/paths + /etc/paths.d
# ------------------------------------------------------------
if [ -x /usr/libexec/path_helper ]; then
  eval "$(/usr/libexec/path_helper -s)"
fi

# ------------------------------------------------------------
# PATH: user tools first, then language/tool managers, then system
# ------------------------------------------------------------
typeset -U path

path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  "$HOME/.spoof-dpi/bin"

  "$HOME/.cargo/bin"
  "$HOME/go/bin"
  "$HOME/.npm-global/bin"

  "$DENO_INSTALL/bin"
  "$BUN_INSTALL/bin"
  "$PNPM_HOME"

  "/Library/Frameworks/Python.framework/Versions/3.11/bin"

  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"

  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

  "$DEVKITPRO/tools/bin"
  "$DEVKITARM/bin"

  "/usr/local/bin"
  "/usr/local/sbin"

  $path
)

export PATH

