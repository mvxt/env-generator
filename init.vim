" Plug (vim-plug) - plugin manager
" https://github.com/junegunn/vim-plug
" Basically: after adding a plug, just remember to run 'PlugInstall'
" This is best with neovim!
" https://neovim.io/
" http://nerditya.com/code/guide-to-neovim/
" Other helpful links:
" http://learnvimscriptthehardway.stevelosh.com/
" http://andrewradev.com/2011/08/06/making-vim-pretty-with-custom-colors/
" =====================================
call plug#begin()
" -------------------------------------
" ==============
"  THEME COLORS
" ==============
" https://github.com/rafi/awesome-vim-colorschemes
Plug 'joshdick/onedark.vim'
Plug 'hukl/Smyck-Color-Scheme'
Plug 'mhartington/oceanic-next'

" ===========================================
"  SYNTAX HIGHLIGHTING FOR LANGUAGES & TOOLS
" ===========================================

" Dart syntax
" https://github.com/dart-lang/dart-vim-plugin
Plug 'dart-lang/dart-vim-plugin'

" Dockerfile syntax
" https://github.com/ekalinin/Dockerfile.vim
Plug 'ekalinin/Dockerfile.vim'

" Go syntax
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go'

" JavaScript/ReactJS/JSX syntax
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'

" Markdown syntax
" https://github.com/plasticboy/vim-markdown
Plug 'plasticboy/vim-markdown'

" Terraform syntax
" https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform'

" Vim Stylus Syntax Highlighting
" https://github.com/wavded/vim-stylus
Plug 'wavded/vim-stylus'

" ===============================
"  MISCELLANEOUS TOOLS & PLUGINS
" ===============================
" Enforce editor settings
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" NERD Tree - tree explorer
" https://github.com/scrooloose/nerdtree
" (loaded on first invocation of the command)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" vim-misc
" https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Tagbar
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

" Vim multiple cursors
Plug 'terryma/vim-multiple-cursors'

" indentline
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" -------------------------------------
" Add plugins to &runtimepath
call plug#end()
" =====================================

" ===============================
"  PLUGIN-SPECIFIC CONFIGURATION
" ===============================

"""" ===========
""""  NERD Tree
"""" ===========
" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Show hidden files in NERD tree
let NERDTreeShowHidden=1

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" :q works as expected if the only window open is NERD Tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ========================
"  MISCELLANEOUS SETTINGS
" ========================

" Disable vim folding for json, markdown, etc.
set nofoldenable
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Highlight matches when searching
" Use C-l to clear (see key map section)
set hlsearch

" Line numbering
set number

" enable line and column display
set ruler

" Disable cursor changes from terminal
"set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Set tabs to 2 spaces, replace all tabs with spaces
set tabstop=2 shiftwidth=2 expandtab

" file type recognition
filetype on
filetype plugin on
filetype indent on

" Use goimports
let g:go_fmt_command = "goimports"

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" syntax highlighting
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme onedark

" Backspace behaves like other programs
set backspace=indent,eol,start

" =====================================
" key map
" Understand mapping modes:
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#answer-3776182
" http://stackoverflow.com/questions/22849386/difference-between-nnoremap-and-inoremap#answer-22849425
" =====================================

" EJS syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" change the leader key from "\" to ";" ("," is also popular)
let mapleader=";"

" use ;-Space for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap <A-Space> <Esc>

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Keys to retab files
nnoremap <silent> <C-Tab> :retab

" Insert newlines before and after remap
nnoremap <S-Enter> O<Esc>
nnoremap <C-Enter> o<Esc>

" Copy to clipboard MAC
vnoremap <leader>c :w !pbcopy<CR><CR>

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle NERDTree
" " Can't get <C-Space> by itself to work, so this works as Ctrl - space -
" space
" " https://github.com/neovim/neovim/issues/3101
" "
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim#answer-24550772
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" horizontal split with new buffer
nnoremap <silent> <leader>d :vnew<CR>
" vertical split with new buffer
nnoremap <silent> <leader><S-d> :new<CR>
" Move up and down between the buffers
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>

" Show current buffers
nnoremap <silent> <leader>b :buffers<CR>:b<Space>
" Switch to buffer x
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Show list of buffers after switching
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>

" redraw screan and clear search highlighted items
" "http://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting#answer-25569434
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

