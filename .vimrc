" Frankenstein .vimrc from various sources


" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on       " enable detection, plugins and indenting in one step
syntax on


"""""""""""""""""""
" General
"""""""""""""""""""

" Always show what mode we're currently editing in
set showmode

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Sudo save
command W w !sudo tee % > /dev/null

" hide the launch screen
set shortmess+=I

" normal OS clipboard interaction
set clipboard=unnamed

" set path to where ever vim was opened
set path=$PWD/**


"""""""""""""""""""
" VIM UI
"""""""""""""""""""

" Display line numbers
set number

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Change terminal's title
set title

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Enable line numbers
setlocal number

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hidden

" Height of the command bar
set cmdheight=2

"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" don't beep
set visualbell
set noerrorbells

" highlight cursor row
set cursorline


"""""""""""""""""""
" COLOR/FONT
"""""""""""""""""""

set t_Co=256
set encoding=utf8

set background=dark

try
    colorscheme badwolf
    let g:badwolf_darkgutter=1
catch
endtry

" Enable syntax highlighting
syntax enable 


"""""""""""""""""""
" TEXT
"""""""""""""""""""

set smarttab
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Tabs
set ts=4
set sw=4
set sts=0
set noet

" Whitespace highlighting
set listchars=tab:➝\ 
"set listchars=tab:¦\ 
set listchars+=trail:∙
set list


"""""""""""""""""""
" NAVIGATION
"""""""""""""""""""

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" execute makefile view result
nmap <F5> :make<CR>

" Error navigation
nmap <C-left> :cp<CR>
nmap <C-right> :cn<CR>

" Open/close quickfix menu
nmap <C-up> :cope<CR>
nmap <C-down> :ccl<CR>

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" create/focus on NERDTree
map <silent> <C-w>n :NERDTreeFocus<CR>

"""""""""""""""""""
" STATUS LINE
"""""""""""""""""""
set laststatus=2

" Status line format
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""
" MAPPINGS
"""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^


"""""""""""""""""""
" PLUGIN CONFIG
"""""""""""""""""""

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'


" cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1


" youcompleteme
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

" NERDTree
" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

"changing tree root cahnges root for ctrl-p
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
