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
"
" Theme Colors
Plug 'vim-scripts/Relaxed-Green'
Plug 'Yggdroot/duoduo'
Plug 'vim-scripts/dante.vim'
Plug 'gkjgh/cobalt'
Plug 'broduo/broduo-color-scheme'
Plug 'davb5/wombat256dave'
Plug 'crater2150/vim-theme-chroma'
Plug 'encody/nvim'
Plug 'posva/vim-vue'
Plug 'vim-scripts/Relaxed-Green'
Plug 'hukl/Smyck-Color-Scheme'

" NERD Tree - tree explorer
" https://github.com/scrooloose/nerdtree
" http://usevim.com/2012/07/18/nerdtree/
" (loaded on first invocation of the command)
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" robotframework syntax
" https://github.com/mfukar/robotframework-vim
Plug 'mfukar/robotframework-vim'

" vim-airline
" Enhanced statusline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

" vim yang-mode
Plug 'nathanalderson/yang.vim'

" Go mode
Plug 'fatih/vim-go'

" Save/restore session support
" https://github.com/tpope/vim-obsession
" tmux users also see: https://github.com/tmux-plugins/tmux-resurrect/blob/master/docs/restoring_vim_and_neovim_sessions.md
Plug 'tpope/vim-obsession'

" Dockerfile syntax
" https://github.com/ekalinin/Dockerfile.vim
Plug 'ekalinin/Dockerfile.vim'

" Excellent git wrapper
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" Enforce editor settings
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" vim-misc
" https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Terraform mode
" https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform'

" Tagbar
" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

" Markdown support
" https://github.com/plasticboy/vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Vim multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Fuzzy file, buffer, mru, tag, etc finder
" ctrlp.vim
" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" OMG - insanely awesome fuzzy search and blazing fast grep
" https://github.com/junegunn/fzf (parent project)
" https://github.com/junegunn/fzf.vim (more extensive wrapper)
" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2#.rkhrm332m
" To update: :PlugUpdate fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" indentline
" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

" -------------------------------------
" Add plugins to &runtimepath
call plug#end()
" =====================================
"
" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Show hidden files in NERD tree
let NERDTreeShowHidden=1

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =====================================
" Initial settings
" =====================================
"
" highlight matches when searching
" Use C-l to clear (see key map section)
set hlsearch

" Line numbering
" Toggle set to ';n' in key map section
set number

" enable line and column display
set ruler

" Disable vim folding for json, markdown, etc.
set nofoldenable

"disable showmode since using vim-airline; otherwise use 'set showmode'
set noshowmode

" Disable cursor changes from terminal
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Set tabs to 2 spaces, replace all tabs with spaces
set tabstop=2 shiftwidth=2 expandtab

" file type recognition
filetype on
filetype plugin on
filetype indent on

" syntax highlighting
syntax on

" markdown
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1

" open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" Use Ag (the silver searcher) instack of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

set bg=dark
colorscheme smyck
set termguicolors

" Backspace behaves like other programs
set backspace=indent,eol,start

" =====================================
" key map
" Understand mapping modes:
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping#answer-3776182
" http://stackoverflow.com/questions/22849386/difference-between-nnoremap-and-inoremap#answer-22849425
" =====================================

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

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|class\|cisco-ios\|netsim\|ncs-cdb\|state\|logs\|packages/juniper-junos\|dist'
"let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat .ctrlpignore`"'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_autoignore_extension = 0
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
        let g:ctrlp_user_command = 'ag -l -g "" %s'
endif
nmap <c-t> :CtrlPBufTag<cr>
nmap <c-r> :CtrlPMRUFiles<cr>
nmap <c-c> :CtrlPClearAllCaches<cr>