" -------------------------
" Set Leader Key
" -------------------------

let mapleader=" "                " Set mapleader to space

" -------------------------
" General Settings
" -------------------------

set history=500                 " Set history size to 500 entries
set autoread                    " Automatically read changes made outside of Vim
set title                       " Set the window title to the current file name
set number                      " Show absolute line numbers
set relativenumber              " Show relative line numbers
set scrolloff=8                 " Keep 8 lines above and below the cursor
set expandtab                   " Use spaces instead of tabs
set autoindent                  " Enable automatic indentation
set smartindent                 " Enable smart indentation
set smarttab                    " Enable smart tab handling
set shiftwidth=4                " Set the number of spaces for each indentation step
set tabstop=4                   " Set the number of spaces a <Tab> character represents
set softtabstop=4               " Set the number of spaces a <Tab> counts for while editing
set linebreak                   " Wrap lines at a character in 'breakat'
set textwidth=79                " Set maximum text width to 79 characters
set wrap                        " Enable line wrapping
set showmatch                   " Highlight matching brackets
set mat=0                       " Set blink duration to 0 tenths of second
set showtabline=2               " Always show the tab line
set cmdheight=1                 " Set command-line height to 1 line
set showcmd                     " Display incomplete commands in the bottom bar
set laststatus=2                " Always display the status line
set splitbelow                  " Open new horizontal splits below the current window
set splitright                  " Open new vertical splits to the right of the current window
set completeopt=menuone,longest " Customize completion options
set complete+=kspell            " Include spell checking in completion
set shortmess+=c                " Reduce the verbosity of completion messages
set wildmenu                    " Enable enhanced command-line completion
set ruler                       " Show the cursor position at the bottom
set backspace=eol,start,indent  " Allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l          " Allow cursor keys to move across line breaks
set ignorecase                  " Ignore case when searching
set smartcase                   " Override 'ignorecase' if search pattern contains uppercase letters
set incsearch                   " Enable incremental search
set lazyredraw                  " Redraw screen only when necessary (improves performance)
set magic                       " Enable 'magic' for regex patterns
set noerrorbells                " Disable error bells
set novisualbell                " Disable visual bells
set t_vb=                       " Disable terminal bell
set timeoutlen=500              " Set timeout length for mapped sequences to 500ms
set foldcolumn=1                " Show a fold column on the left side
set regexpengine=0              " Use the default regular expression engine
set encoding=utf8               " Use UTF-8 encoding
set nobackup                    " Disable backup files
set nowritebackup               " Disable backup before overwriting a file
set noswapfile                  " Disable swap files

" -------------------------
" Color Scheme Settings
" -------------------------

if $COLORTERM == 'gnome-terminal'
    set termguicolors            " Enable 24-bit RGB color in the terminal
endif

try
    colorscheme desert           " Set the color scheme to 'desert'
catch
endtry

" -------------------------
" Auto-Commands
" -------------------------

" Automatically reload files if changed outside of Vim
au FocusGained,BufEnter * silent! checktime

" -------------------------
" Custom Commands
" -------------------------

" Custom command to write the current file with sudo
command! W execute 'w !sudo tee % > /dev/null' | edit!

" -------------------------
" Language Settings
" -------------------------

let $LANG='en'                   " Set environment language to English
set langmenu=en                  " Set menu language to English
source $VIMRUNTIME/delmenu.vim   " Remove default menu items
source $VIMRUNTIME/menu.vim      " Reload default menu items

" -------------------------
" GUI Mode Settings
" -------------------------

if has("gui_running")
    set guioptions-=T            " Remove toolbar in GUI mode
    set guioptions-=e            " Remove scrollbar in GUI mode
    set termguicolors            " Enable 24-bit RGB color in the GUI
    set guitablabel=%M\ %t       " Set tab label to modified status and file name
    set mousescroll=ver:1,hor:1
endif

" -------------------------
" File Settings
" -------------------------

set fileformats=unix,dos,mac     " Support Unix, DOS, and Mac file formats

" -------------------------
" Status Line Settings
" -------------------------

" Custom status line format
set statusline=%{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %{getcwd()}\ \ Line:\ %l\ Column:\ %c

" -------------------------
" Visual Mode Mappings
" -------------------------

" Search for visually selected text forwards or backwards
vmap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vmap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Replace visually selected text (with confirmation) or replace globally
vmap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
vmap <leader>a "hy:%s/<C-r>h//gI<left><left><left>

" Move selected lines up or down and reselect
vmap J :m '>+1<cr>gv=gv
vmap K :m '>-2<cr>gv=gv

" Sort the selected lines
vmap <leader>s :sort<cr>

" -------------------------
" Normal Mode Mappings
" -------------------------

" Save file forcefully
nmap <leader>w :w!<cr>

" Hide line numbers and relative numbers
nmap <leader><backspace> :set nonu nornu<cr>

" Keep cursor centered when scrolling
nmap <C-U> <C-U>zz
nmap <C-D> <C-D>zz

" Keep cursor centered when navigating with 'n' and 'N'
nmap n nzz
nmap N Nzz

" Open vertical or horizontal splits
nmap <leader>v :vsplit .<cr>
nmap <leader>s :split .<cr>

" Easy window navigation
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" Save all files and open a terminal
nmap <leader>x :wa<cr>:vertical botright term ++kill=term<cr>

" Reload .vimrc configuration
nmap <F5> :source ~/.vimrc<cr>

" Open a new tab
nmap <leader>o :tabnew<cr>

" Jump to the last tab
let g:lasttab = 1
nmap <leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Tab navigation
nmap <leader>h :tabprevious<cr>
nmap <leader>l :tabnext<cr>
nmap <leader>c :tabclose<cr>

" Yank to the end of line
nmap Y y$

" Open a 25-line wide file explorer
nmap <leader>e :25Lex<cr>

" Navigate buffers with Tab and Shift-Tab
nmap <Tab> :bnext<cr>
nmap <S-tab> :bprevious<cr>

" Close the current buffer forcefully
nmap <leader>d :bd!<cr>

" Quick edit of the buffer file
nmap <leader>q :e ~/buffer<cr>

" -------------------------
" Insert Mode Mappings
" -------------------------

" Quick escape from insert mode using 'jk' or 'kj'
imap jk <esc>
imap kj <esc>

" Auto-insert brackets and move cursor between them
imap { {<cr>}<esc><up>A<cr>
imap {} {}<left><space><space><left>

" Quick insert for common integer types
imap i1 int8_t
imap i2 int16_t
imap i4 int32_t
imap i8 int64_t

" -------------------------
" Autocommands
" -------------------------

" Restore cursor position when reopening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remove trailing whitespace on save
if has("autocmd")
    autocmd BufWritePre * :call CleanExtraspaces()
endif

" -------------------------
" Helper Functions
" -------------------------

" Show 'PASTE' in status line if paste mode is enabled
function! HasPaste()
    return &paste ? 'PASTE ' : ''
endfunction

" Clean extra spaces from the end of lines
function! CleanExtraspaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

