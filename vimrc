set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" For nerdtree-git
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-erlang-skeleteons'

Plugin 'taglist-plus'
let Tlist_Use_Right_Window = 1

Plugin 'ervandew/supertab'
Plugin 'jimenezrick/vimerl'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-scripts/DidYouMean'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

hi CursorLine   cterm=NONE ctermbg=black guibg=black
nnoremap ct :set cursorline!<Enter>

set ruler
set rulerformat=%55(%{strftime('%A\ %F\ %H:%M:%S')}\ %5l,%-6(%c%V%)\ %P%)

function ShowSpaces(...)
    let @/='\v(\s+$)|( +\ze\t)'
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction

function TrimSpaces() range
    let oldhlsearch=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

let g:erlangManPath="/usr/lib/erlang/man"

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch	" Show matching brackets.
"set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
"set autowrite	" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nu			" Show line number
set autoindent	" Do auto indent
"set cindent	" Use indent for C
set ts=4		" 4 space in 1 Tab
set expandtab	" Use blankspace for Tab
set hlsearch    " High light for search
set shiftwidth=4    " Set shift width to 4
set textwidth=80    " Add /n at 80
set wildmenu
"colo vividchalk
map <C-N> <Esc>:tabnew<Enter>
nnoremap nt :NERDTreeTabsToggle<Enter>
nnoremap tt :TlistToggle<Enter>
map <C-F5> <Esc>:!ctags --erlang-kinds=+dfmr -R --exclude=sql --exclude=doc --exclude=logs --exclude=ebin -f tags<Enter>
"--exclude=*eunit*
nnoremap <Tab> <Esc>:tabn<Enter>
nnoremap h<space> :nohlsearch<Enter>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" highlight last inserted text
nnoremap gV `[v`]
nnoremap <C-A> <Esc>ggvG$
nnoremap cp :set paste<Enter>
nnoremap ci :set nopaste<Enter>
" inoremap <C-[> <Esc><Esc>
