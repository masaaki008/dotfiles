# coreutils適用
case "$OSTYPE" in
  darwin*) export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
esac

alias brew="env PATH=${PATH/\/Users\/masaaki\/\.pyenv\/shims:/} brew"
