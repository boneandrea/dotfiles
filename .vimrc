""""""""""""""""
" set the runtime path to include Vundle and initialize
"
" https://github.com/VundleVim/Vundle.Vim#quick-start
"
" Set up Vundle:
"   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" Install Plugins:
"
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall
"
"
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'mattn/vim-sqlfmt'
"Plugin ''
"Plugin ''

call vundle#end()
filetype plugin indent on

""" How to install plugins
" 
"vim を開いた状態で、以下を入力して Enter
":PluginInstall
"ターミナル上で以下のコマンドを実行
"$ vim +PluginInstall +qall


""""""""""""" custom config

set foldmethod=syntax
let perl_fold=1
set foldlevel=100

set number
filetype on
autocmd FileType python setl autoindent 
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

set number
set notitle
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set nrformats-=octal
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start

set nofixeol


set autoindent

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

set sw=2 ts=8 ai

" setting
"文字コードをUFT-8に設定

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
"set virtualedit=onemore
set visualbell
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2



