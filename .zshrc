
export PATH="/usr/local/sbin:$PATH"

case "$OSTYPE" in 
    darwin*)
        export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
        alias pyenv="SDKROOT=$(xcrun --show-sdk-path) pyenv"
    linux*) [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
esac

# 色の設定
eval `dircolors -b`
eval `dircolors ~/.dircolors`

autoload colors

zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# LANG
export LANG=ja_JP.UTF-8

# 自動補完
autoload -U compinit
compinit

# HISTORY
# 他のターミナルとヒストリーの共有
setopt share_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2

# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{010}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# prompt
PROMPT='
%F{205}%n@%m%f:%F{046}[%B%~%b]%f ${vcs_info_msg_0_}
$ '
RPROMPT=' %F{050}[%D{%a %m/%d %T}]%f'
# 最後の行だけRPROMPTが残る
setopt transient_rprompt

# alias settings
alias ls="ls --color=auto"
alias ll="ls --color=auto -la"
alias vim="nvim"
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

# 色の確認するだけ
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

# ----------env----------------------
# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# goenv
# default GOPATH=%HOME/go/$goversion$
# export GOENV_DISABLE_GOPATH=1
# export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# llvm
export PATH="/usr/local/opt/llvm/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

