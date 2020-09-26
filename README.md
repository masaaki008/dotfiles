# 設定ファイルインストール
```sh
cd dotfiles
sh ./install.sh
```

# 設定ファイルアンインストール
```sh
cd dotfiles
sh ./uninstall
```

# neovim用python環境作成
```sh
# python 3.8~
pip install virtualenv
virtualenv ~/nvim-python3
source ~/nvim-python3/bin/activate
pip install -r ~/dotfiles/requirements.txt
```
