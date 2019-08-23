
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
PROMPT='%F{205}%n@%m%f:%F{green}[%B%~%b]%f ${vcs_info_msg_0_}
$ '
RPROMPT=' %F{050}[%D{%a %m/%d %T}]%f'
# 最後の行だけRPROMPTが残る
setopt transient_rprompt

# pyenv なぜかzshenvじゃ通らない
eval "$(pyenv init -)"

# alias settings
alias ls="ls --color=auto"
alias ll="ls --color=auto -la"

# 色の確認するだけ
if [ $COL_TEST = 1 ]; then
	for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
fi
