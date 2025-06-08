eval "$(starship init zsh)"
function zsh_reset(){reset ; zle redisplay} ; zle -N zsh_reset ; bindkey '^[k' zsh_reset
  
plugins=(
  # romkatv/powerlevel10k
  romkatv/zsh-defer
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  # zsh-users/zsh-history-substring-search
  # zsh-users/zaw
  jeffreytse/zsh-vi-mode
  # omz/archlinux
    # omz/fancy-ctrl-z
    # omz/fzf
)

ZDOTDIR=$HOME/.zsh/


function plugin-load {
  local repo plugdir initfile initfiles=()
  : ${ZPLUGINDIR:=${ZDOTDIR:-~/.config/zsh}/plugins}
  for plugin in $plugins; do
    if [[ ! -d $ZDOTDIR/plugins/${plugin:t} ]]; then
      if [[ ${plugin:h} == 'omz' ]]; then
        curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/${plugin:t}/${plugin:t}.plugin.zsh \
          --create-dirs --silent --show-error \
          --output $ZDOTDIR/plugins/${plugin:t}/${plugin:t}.plugin.zsh
      else
        git clone https://github.com/${plugin} $ZDOTDIR/plugins/${plugin:t}
      fi
    fi
    if [[ -f $ZDOTDIR/plugins/${plugin:t}/${plugin:t}.plugin.zsh ]]; then
      source $ZDOTDIR/plugins/${plugin:t}/${plugin:t}.plugin.zsh
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}
plugin-load $plugins

# vim
bindkey -v
export KEYTIMEOUT=1
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# function plugin-update {
#   ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
#   for d in $ZPLUGINDIR/*/.git(/); do
#     echo "Updating ${d:h:t}..."
#     command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
#   done
# }
# plugin-update

# function plugin-compile {
#   ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
#   autoload -U zrecompile
#   local f
#   for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
#     zrecompile -pq "$f"
#   done
# }
# plugin-compile

# export ZSH="$HOME/.oh-my-zsh"
#
# ZSH_THEME="agnosterzak"
#
# plugins=(
#     git
#     archlinux
#     zsh-autosuggestions
#     zsh-syntax-highlighting
# )
#
# source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
# alias ls='lsd'
# alias l='ls -l'
# alias la='ls -a'
# alias lla='ls -la'
# alias lt='ls --tree'
# bindkey '^P' history-substring-search-up
# bindkey '^N' history-substring-search-down

alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' 
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E '^\.'"

alias ..='cd ..'
alias s='sudo'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

eval $(thefuck --alias f)

alias n='nvim'
alias t='tmux'
alias y='yazi'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
bindkey '^G' fzf-history-widget

eval "$(zoxide init zsh)"
alias cd='z'

export PATH=$PATH:$HOME/.tmux/plugins/tmuxifier/bin
eval "$(tmuxifier init -)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export PATH=$PATH:/home/vlad/.spicetify

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

### Added by Zinit's installer
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi
#
# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit
#
# zinit ice depth"1" # git clone depth
# zinit light romkatv/powerlevel10k
#
# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-completions
#
# zinit ice depth=1
# zinit light jeffreytse/zsh-vi-mode
#
# # Load a few important annexes, without Turbo
# # (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
