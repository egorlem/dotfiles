typeset -g GHOSTTY_ZSH='/Applications/Ghostty.app/Contents/Resources/zsh'
typeset -U fpath

fpath+=($HOME/.zsh/zsh-completions/src)              # zsh-users/zsh-completions
fpath+=($HOME/.zsh/zsh-completions-generated)        # 
fpath+=($GHOSTTY_ZSH/site-functions)                 # ghostty 
fpath+=(/opt/homebrew/completions/zsh)               # brew
# fpath+=($HOME/.zsh/ultima)                                 
# fpath+=($HOME/.zsh/pure)                                 


# Veil -------------------------------------------------------------------------

VEIL_MODULES=(
  aliases 
  completion 
  cursor 
  env 
  history 
  keybindings 
  less 
  ls
  navigation
)

# THEME=ultima
# source "$HOME/opensource/veil/veil.zsh"
# source "$HOME/.zsh/veil/veil.zsh"

# zsh-users plugins ------------------------------------------------------------

# source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# DEV -------------------------------------------------------------------------- 

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"

unsetopt BEEP

# export VCS="git"

# autoload -U promptinit; promptinit
# prompt ultima

# export ULTIMA_CUSTOM_MODULES_DIR="$HOME/mdl"
# export VEIL_THEMES_DIR="$HOME/opensource/ultima.zsh-theme/.tmp/powerlevel10k"
# eport ULTIMA_CUSTOM_THEMES_DIR="$HOME/theme"

# typeset -gx VEIL_MODULES=('env')
# VEIL_MODULES=('env' 'cursor')
# VEIL_MODULES=""
# VEIL_MODULES="aliases completion cursor env keybindings less ls navigation history"
# VEIL_THEMES_DIR="$HOME/.pure"

# VEIL_MODULES_VERBOSE=1

source "$HOME/oss/veil/veil.zsh"
# source "$HOME/oss/veil/veil.plugin.zsh"

# source "$HOME/.pure/async.zsh"
# source "$HOME/.pure/pure.zsh"

# Completion UI styling --------------------------------------------------------

zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS} "ma=92;48;5;23"

# fpath+=($HOME/.pure)

# autoload -U promptinit; promptinit
# prompt pure
# source "~/.pure/pure.zsh"

# source "$HOME/opensource/veil/veil.plugin.zsh"

# source "$HOME/workspace/zsh-autosuggestions/zsh-autosuggestions.zsh"

# source "$HOME/ultima.workspace/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# source "$HOME/opensource/zsh-framework-benchmark/run.zsh" -f veil
# source "$HOME/opensource/zsh-framework-benchmark/run.zsh" -f zimfw
# source "$HOME/opensource/zsh-framework-benchmark/run.zsh" -f ohmyzsh
# source "$HOME/opensource/zsh-framework-benchmark/run.zsh" -f zcomet
# source "$HOME/opensource/zsh-framework-benchmark/run.zsh" -f vanilla

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

# bindkey "^[[1;3C" forward-word
# bindkey "^[[1;3D" backward-word

# bindkey "^[w" backward-kill-line
# bindkey "^[u" backward-kill-word

# bindkey "[C" forward-word
# bindkey "[D" backward-word

# bindkey "D" beginning-of-line
# bindkey "C" end-of-line
# bindkey "^[a" beginning-of-line
# bindkey "^[e" end-of-line

# ^[[1;3C ^[[1;3D




# ------------------------------------------------------------------------------
# SHARED VARIABLES (available to all modules)
# ------------------------------------------------------------------------------

# __ultimaIssueDemo() {
#   echo 'Demonstration of a bug related to this issue'
#   echo 'foo'
#   echo 'baz'
#   echo 'bar'
# }

# add-zsh-hook precmd __ultimaIssueDemo


# for ultima ${(s.:.)LS_COLORS} "ma=92;48;5;23"



# autoload -Uz compinit
# compinit
# ~/.veil/components/modules/about.module.zsh

# Массив описаний модулей
# typeset -A VEIL_MODULE_DESCRIPTIONS

# VEIL_MODULE_DESCRIPTIONS=(
#   completion "Provides smart tab completion for commands, files, and options."
#   history    "Enhanced history navigation across sessions and terminals."
#   navigation "Improves directory navigation: cd, autojump, and shortcuts."
#   aliases    "Commonly used aliases for ls, git, man, etc."
#   less       "Better pager defaults for viewing files."
#   ls         "Colorized and enhanced 'ls' output."
#   man        "Improved 'man' page display."
# )

# # Функция about
# about() {
#   local module="$1"
  
#   if [[ -z "$module" ]]; then
#     echo "Usage: veil_about <module>"
#     echo "Available modules: ${(@k)VEIL_MODULE_DESCRIPTIONS}"
#     return 1
#   fi

#   if [[ -n "${VEIL_MODULE_DESCRIPTIONS[$module]}" ]]; then
#     echo "${module}: ${VEIL_MODULE_DESCRIPTIONS[$module]}"
#   else
#     echo "Module '$module' not found. Available modules: ${(@k)VEIL_MODULE_DESCRIPTIONS}"
#   fi
# }

# _veil_about_completion() {
#   local -a modules
#   modules=(${(@k)VEIL_MODULE_DESCRIPTIONS})  # все ключи массива — названия модулей
#   _describe 'Veil modules' modules
# }

# # Привязываем автодополнение к veil_about
# compdef _veil_about_completion about

function demo {
  echo 'its dem demo'
}

function pwon {
  wakeonlan '38:7c:76:4a:85:ce'
}

# nvm removed — Node.js установлен системно из официального pkg (см. .zprofile PATH)
