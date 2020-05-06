# 環境変数用

# coreutils適用
case "$OSTYPE" in
  darwin*) export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
esac

# postgres
export PATH="/usr/local/Cellar/postgresql/12.2/bin/:$PATH"

# PostgreSQL
export PGDATA=/usr/local/var/postgres
