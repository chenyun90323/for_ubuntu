set nocompatible " be improved, required
filetype off " required

color elflord

set rtp+=~/.local/lib/python3.6/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" For nerdtree-git
Plugin 'scrooloose/nerdtree'
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=34
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\.swp']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'taglist-plus'
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联

Plugin 'ervandew/supertab'

Plugin 'Valloric/YouCompleteMe'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

Plugin 'vim-syntastic/syntastic'

Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_bgcolor_term = 202

Plugin 'tell-k/vim-autopep8'

Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line"

" set ruler
" set rulerformat=%55(%{strftime('%A\ %F\ %H:%M:%S')}\ %5l,%-6(%c%V%)\ %P%)

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

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
set autowrite  " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)
set nu          " Show line number
set autoindent  " Do auto indent
"set cindent    " Use indent for C
set ts=4        " 4 space in 1 Tab
set expandtab   " Use blankspace for Tab
set hlsearch    " High light for search
set shiftwidth=4    " Set shift width to 4
"set textwidth=80    " Add /n at 80
"set wildmenu
"set laststatus=2 " Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
"set colorcolumn=81
set scrolloff=3     "距离顶部和底部3行"
set encoding=utf-8  "编码
set fenc=utf-8      "编码

map <C-N> <Esc>:tabnew<Enter>
nnoremap nt :NERDTreeToggle<Enter>
nnoremap tt :TlistToggle<Enter>
map <C-F5> <Esc>:!ctags -R --exclude=logs -f tags<Enter>
"--exclude=*eunit*
nnoremap <Tab> <Esc>:tabn<Enter>
nnoremap <S-Tab> <Esc>:tabp<Enter>
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
nnoremap <A-Up> <C-W>+
nnoremap <A-Down> <C-W>-
nnoremap <A-Left> <C-W><
nnoremap <A-Right> <C-W>>
