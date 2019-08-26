# 環境変数用

# coreutils適用
case "$OSTYPE" in
  darwin*) export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
esac

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# anacnda
export PATH="$PYENV_ROOT/versions/anaconda3-2019.03/bin/:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# postgres
export PATH=/Library/PostgreSQL/11.4/bin:$PATH

# PostgreSQL
export PGDATA=/usr/local/var/postgres
