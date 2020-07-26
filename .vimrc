"""""""""""""""""""""""""
"      dein 設定
"""""""""""""""""""""""""
if &compatible
    set nocompatible
endif

set runtimepath+=/Users/masaaki/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/masaaki/.vim/bundles')
    call dein#begin('/Users/masaaki/.vim/bundles')

    call dein#add('/Users/masaaki/.vim/bundles/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here like this:
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('scrooloose/nerdtree')
    call dein#add('tpope/vim-commentary')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

" カラーテーマ
set background=dark
colorscheme solarized

"""""""""""""""""""""""""
"      vim-airline
"""""""""""""""""""""""""
let g:airline_theme = 'wombat'                                " テーマ
let g:airline#extensions#tabline#enabled = 1                  " タブの有効化
let g:airline#extensions#tabline#buffer_idx_mode = 1          " タブ番号表示
let g:airline#extensions#whitespace#mixed_indent_algo = 1
nmap <C-p> <Plug>AirlineSelectPrevTab                         " Ctrl+pタブ切替
nmap <C-n> <Plug>AirlineSelectNextTab                         " Ctrl+nタブ切替

" power-fonts
let g:airline_powerline_fonts = 1
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"""""""""""""""""""""""""
"      インデント
"""""""""""""""""""""""""
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える

set tabstop=4           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=4        "自動インデントで入る空白数

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
set number              " 行番号を表示
set cursorline          " カーソル行の背景色を変える
set cmdheight=2         " メッセージ表示欄を2行確保
set showmatch           " 対応する括弧を強調表示
set wildmenu            " コマンドライン補完

" 空白可視化
set list
set listchars=tab:»-,trail:·,eol:¬,extends:»,precedes:«,nbsp:%

set mouse=a             " マウス設定
