
export PATH="/usr/local/sbin:$PATH"

# coreutils適用
case "$OSTYPE" in
    darwin*) export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
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
%F{205}%n@%m%f:%F{green}[%B%~%b]%f ${vcs_info_msg_0_}
$ '
RPROMPT=' %F{050}[%D{%a %m/%d %T}]%f'
# 最後の行だけRPROMPTが残る
setopt transient_rprompt

# alias settings
alias ls="ls --color=auto"
alias ll="ls --color=auto -la"
alias spsql="postgres -D /usr/local/var/postgres"

alias brew="env PATH=${PATH/\/Users\/masaaki\/\.pyenv\/shims:/} brew"
alias brew="env PATH=${PATH/\/Users\/masaaki\/\.pyenv\/versions\/anaconda3-2019/.03\/bin:/} brew"

# 色の確認するだけ
# if [ $COL_TEST = 1 ]; then
# 	for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
# fi

# ----------env----------------------
# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
# pyenv なぜかzshenvじゃ通らない
eval "$(pyenv init -)"

# goenv
# default GOPATH=%HOME/go/$goversion$
# export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/masaaki/.pyenv/versions/anaconda3-2019.03/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/masaaki/.pyenv/versions/anaconda3-2019.03/etc/profile.d/conda.sh" ]; then
        . "/Users/masaaki/.pyenv/versions/anaconda3-2019.03/etc/profile.d/conda.sh"
    else
        export PATH="/Users/masaaki/.pyenv/versions/anaconda3-2019.03/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

