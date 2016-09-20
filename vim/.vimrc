" setting
"文字コードをUFT-8に設定
set fenc=utf-8
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
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"dein Scripts-----------------------------
if &compatible
set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/hiroki/.vim/dein/./repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/hiroki/.vim/dein/.')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add complete
call dein#add('Shougo/neocomplete.vim')
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Use underbar completion.
let g:neocomplete#enable_underbar_completion = 1
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
" Unite {{{
"     " Search and display information from arbitrary sources
call dein#add('Shougo/unite.vim', {
          \ 'depends': ['vimproc'],
          \ 'on_cmd': ['Unite'],
          \ 'lazy': 1})
" Source for unite: mru
call dein#add('Shougo/neomru.vim', {'depdens': ['unite.vim']})
" Source for unite: mark
call dein#add('tacroe/unite-mark', {'depdens': ['unite.vim']})

" Source for unite: help
call dein#add('tsukkee/unite-help', {'depdens': ['unite.vim']})

" Source for unite: history/command, history/search
call dein#add('thinca/vim-unite-history', {'depdens':['unite.vim']})

" Source for unite: history/yank
call dein#add('Shougo/neoyank.vim', {'depdens':['unite.vim']})
" }}}

" Markdown {{{
call dein#add('junegunn/vader.vim')
call dein#add('godlygeek/tabular')
call dein#add('joker1007/vim-markdown-quote-syntax')
call dein#add('rcmdnk/vim-markdown')
" }}}

" Diff {{{
" linediff
call dein#add('AndrewRadev/linediff.vim', {
\ 'on_cmd': ['Linediff'],
\ 'lazy': 1})

call dein#add('tomasr/molokai')
call dein#add('nathanaelkane/vim-indent-guides')
" failer :e
call dein#add('scrooloose/nerdtree')
nnoremap <silent><C-e> :NERDTreeToggle<CR>
call dein#add('tpope/vim-fugitive')
call dein#add('thinca/vim-visualstar')


" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" scala syntax hilite
call dein#add('derekwyatt/vim-scala')
au BufRead,BufNewFile *.scala  set filetype=scala
au BufRead,BufNewFile *.sbt  set filetype=scala

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
