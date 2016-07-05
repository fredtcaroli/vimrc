"Makes vim vim
set nocompatible
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif " has("autocmd")

"Comma feels like a better suited <leader>
let mapleader=","

"Indentation stuff
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab

"Keep cursor line at least 10 lines away from top or bottom
set scrolloff=10

"Highlight the column 80 for space awareness
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

"Window navigation mappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Open new windows panes to right and bottom
set splitbelow
set splitright

"Show relative line numbers
set relativenumber

"Function to toggle to absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"Map Ctrl+n to call the previous toggle function
nnoremap <C-n> :call NumberToggle()<cr>

"Highlight current cursor line
set cursorline

"Visual autocomplete for menu commands
set wildmenu

"Search characters as they are entered in the menu command
set incsearch

"Highlight all search results
set hlsearch

"Erase results highlights pressing <leader><space>
nnoremap <leader><space> :nohlsearch<CR>

"If a line gets divided in two for lack of space, j or k won't skip it
nnoremap j gj
nnoremap k gk

"Using the arrow keys in Normal mode to navigate tabs
"Up and Down will move the tabs around
nnoremap <UP> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <DOWN> :execute 'silent! tabmove ' . (tabpagenr())<CR>
"Left and Right will navigate
nnoremap <RIGHT> :tabnext<CR>
nnoremap <LEFT> :tabprevious<CR>
"Ctrl-Up will open a new tab with the file explorer
nnoremap <C-UP> :tabedit %:h<CR>
"Ctrl-Down will close the current tab
nnoremap <C-DOWN> :tabclose<CR>

"Disable arrows while in Insert mode
inoremap <UP> <nop>
inoremap <DOWN> <nop>
inoremap <RIGHT> <nop>
inoremap <LEFT> <nop>

"I prefer the 0 key for the first non-blank character. ^ feels odd
nnoremap 0 ^

"In C and C++, I want the the { to be autoclosed in a newline
autocmd FileType c,cpp inoremap { {<CR>}<ESC>O

"In Makefiles, real tabs should be used
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

"Set to auto read when a file is changed from the outside
set autoread

"Always show file position on bottom right corner
set ruler

"This enables projects to have their own .vimrc files
set exrc

"Since exrc can be a security breach, this will prevent :autocmd, shell and
"write commands inside project-specific .vimrc files to be executed
set secure
