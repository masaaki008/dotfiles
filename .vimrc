"""""""""""""""""""""""""
"      dein 設定
"""""""""""""""""""""""""
if &compatible
    set nocompatible
endif

let g:python3_host_prog = $PYENV_ROOT.'/shims/python'
let g:dein_path = $HOME.'/.vim/bundles'
let g:dein_repo_path = '/repos/github.com/Shougo/dein.vim'
let g:toml_dir = $HOME.'/.config/vim/dein/toml'
let g:toml = g:toml_dir.'/dein.toml'
let g:lazy_toml = g:toml_dir.'/dein_lazy.toml'

set runtimepath+=$HOME/.vim/bundles/repos/github.com/Shougo/dein.vim
set runtimepath+=$HOME/.vim/bundles/repos/github.com/altercation/vim-colors-solarized

if dein#load_state(g:dein_path)

    call dein#begin(g:dein_path)

    call dein#load_toml(g:toml, {'lazy': 0})
    call dein#load_toml(g:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif

" 文字コード
set encoding=UTF-8

"""""""""""""""""""""""""
"      ale
"""""""""""""""""""""""""
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['golint'],
\}
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1

"""""""""""""""""""""""""
"      インデント
"""""""""""""""""""""""""
set autoindent                            "改行時に前の行のインデントを計測
set smartindent                           "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent                               "Cプログラムファイルの自動インデントを始める
set smarttab                              "新しい行を作った時に高度な自動インデントを行う
set expandtab                             "タブ入力を複数の空白に置き換える

set tabstop=4                             "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=4                          "自動インデントで入る空白数

" go, cpp, c, h はexpandtab解除
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab
    autocmd BufNewFile,BufRead *.cpp setlocal noexpandtab
    autocmd BufNewFile,BufRead *.c setlocal noexpandtab
    autocmd BufNewFile,BufRead *.h setlocal noexpandtab
augroup END

"""""""""""""""""""""""""
"      画面関連
"""""""""""""""""""""""""
set number                                 " 行番号を表示
set cursorline                             " カーソル行の背景色を変える
set cmdheight=2                            " メッセージ表示欄を2行確保
set showmatch                              " 対応する括弧を強調表示
set wildmenu                               " コマンドライン補完

" 空白可視化
set list
set listchars=tab:▸-,trail:·,eol:¬,extends:»,precedes:«,nbsp:%

set mouse=a                               " マウス設定

" NERDTree 実行
autocmd VimEnter * execute 'NERDTree'
