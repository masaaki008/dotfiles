# coreutils適用
case "$OSTYPE" in
  darwin*) export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
esac

export PATH="$HOME/.poetry/bin:$PATH"
