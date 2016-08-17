set nocompatible              " be iMproved, required
filetype on                   " required
set t_Co=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
let g:vundle_default_git_proto='git'

" For nerdtree-git
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'taglist-plus'
let Tlist_Use_Right_Window = 1

Plugin 'ervandew/supertab'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/DidYouMean'

"Plugin 'klen/python-mode'
" Override go-to.definition key shortcut to Ctrl-]
"let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
"let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
"let g:pymode_doc_bind = "<C-S-d>"

Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

Plugin 'nathanaelkane/vim-indent-guides'
set ts=4 sw=4 et
set background=dark
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/vimprj'
" Library for Vimprj and indexer.tar.gz
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'easymotion/vim-easymotion'

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11'

Plugin 'Rip-Rip/clang_complete'
let g:clang_use_library = 1
let g:clang_library_path = '/home/chenyun/opt/llvm/lib/libclang.so'

Plugin 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre= "@brief   "
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_className="yes"
let g:DoxygenToolkit_briefTag_structName="yes"
let g:DoxygenToolkit_briefTag_enumName="yes"
let g:DoxygenToolkit_briefTag_namespaceName="yes"
let g:DoxygenToolkit_briefTag_post="- "
let g:DoxygenToolkit_paramTag_pre= "@param   "
let g:DoxygenToolkit_paramTag_post=": "
let g:DoxygenToolkit_returnTag=    "@returns "
let g:DoxygenToolkit_fileTag=      "@file    "
let g:DoxygenToolkit_versionTag=   "@version "
let g:DoxygenToolkit_authorTag=    "@author  "
let g:DoxygenToolkit_authorName="Chen Yun, chenyun@lanshifund.com"
let g:DoxygenToolkit_dateTag=      "@date    "
let g:DoxygenToolkit_blockTag=     "@name    "
let g:DoxygenToolkit_classTag=     "@class   "
let g:DoxygenToolkit_throwTag_pre= "@throw   "
let g:DoxygenToolkit_templateParamTag_pre="@tparam  "
let g:doxygen_enhanced_color=1
" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
filetype plugin indent on    " required

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
"set ignorecase " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
"set autowrite  " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
set mouse=a     " Enable mouse usage (all modes)
set nu          " Show line number
set autoindent  " Do auto indent
"set cindent    " Use indent for C
"set ts=4        " 4 space in 1 Tab
set expandtab   " Use blankspace for Tab
set hlsearch    " High light for search
set shiftwidth=4    " Set shift width to 4
set textwidth=80    " Add /n at 80
set wildmenu
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set colorcolumn=81

" 配色
hi Comment ctermfg = blue
hi Normal ctermfg=grey ctermbg=black

map <C-N> <Esc>:tabnew<Enter>
nnoremap nt :NERDTreeTabsToggle<Enter>
nnoremap tt :TlistToggle<Enter>
map <C-F5> <Esc>:!ctags --erlang-kinds=+dfmr -R --exclude=sql --exclude=doc --exclude=logs --exclude=ebin -f tags<Enter>
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

nnoremap <S-D> <Esc>:Dox<Enter>
