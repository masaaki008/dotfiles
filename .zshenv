# 環境変数用

# coreutils適用
case "$OSTYPE" in
  darwin*) export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
esac
