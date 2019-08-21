
# LANG
export LANG=ja_jp.UTF-8

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

# prompt
PROMPT='%n@%m:%F{green}[%B%~%b]%f
$ '
RPROMPT=' %F{cyan}[%*]%f'
# 最後の行だけRPROMPTが残る
setopt transient_rprompt

# pyenv なぜかzshenvじゃ通らない
eval "$(pyenv init -)"
