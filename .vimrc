syntax enable
syntax on
set t_Co=256

set background=dark
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plug 'Valloric/YouCompleteMe'
"
" JS/Typescript
" Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'curist/vim-angular-template'
Plug 'Valloric/MatchTagAlways'
"

" 
" Directory browser 
Plug 'tpope/vim-vinegar' " Enhances the default directory browser
" Plug 'scrooloose/nerdtree'


" Plug 'reasonml-editor/vim-reason-plus'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx' " JSX indentation and highlight


" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf' " Search
Plug 'junegunn/fzf.vim' " Search dependency

Plug 'tpope/vim-fugitive' " Git plugin

Plug 'lifepillar/vim-mucomplete' " Autocompletion
" Plug 'ervandew/supertab' " Autocompletion

Plug 'w0rp/ale' " Linter


" Color schemes
" Plug 'altercation/Vim-colors-solarized'   " Solarized color scheme
" Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'jordwalke/vim-taste'

Plug 'Galooshi/vim-import-js'

Plug 'vim-scripts/vim-auto-save' 

Plug 'reasonml-editor/vim-reason'
" Rust syntax highlighting
Plug 'rust-lang/rust.vim' 

" Surround things
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()




" CONFIGS
set hidden " Dont have to save a file when jumping to another one
set wildignore+=**/node_modules/** " Ignore node_modules in search
let mapleader = ","

" SPACES &  TABS
set tabstop=2       " number of visual spaces per tab
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces


" UI CONFIGS
set number          " show line numbers
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" set mouse=a             " accept mouse click

" colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colorscheme onehalfdark


" newtr (Directory navigation)
let g:netrw_banner = 0 " dont show header in navigation


" MU-COMPLETE
let g:mucomplete#buffer_relative_paths = 1
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=menuone " required
set completeopt+=noinsert,noselect " for automatic completion to work
set completeopt-=preview
let g:mucomplete#chains = {
      \ 'vim': ['path', 'cmd', 'keyn'],
      \ 'python': ['path', 'keyn', 'keyp', 'dict'],
      \ 'default': ['path', 'omni', 'keyn', 'keyp', 'dict']
      \ }





" LANGUAGE CLIENT
" let g:LanguageClient_serverCommands = {
"      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"    \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" NERDTREE
" let NERDTreeShowHidden=1 " show .files in NERDTree
" autocmd StdinReadPre * let s:std_in=1 " Always open NERDTree
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> :NERDTreeToggle<CR> " Map Ctrl n to toggle NERDTree

" CTRL-P
" set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" FZF
let FZF_DEFAULT_COMMAND = 'ag --nocolor --ignore node_modules -g ""'

" ALE (LINTER)
" Define linters to use to fix files
"let g:ale_fixers = {
" \   'javascript': ['eslint'],
" \}
" nmap <leader>d <Plug>(ale_fix)
" let g:ale_completion_enabled = 1 " completion
"
let g:ale_change_sign_column_color = 1 " Sets column with signs to same background color
let g:ale_lint_delay = 8
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '→'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ocaml': ['merlin'],
\}
let g:ale_completion_enabled = 1


" AUTO SAVE
" let g:auto_save = 1  " enable AutoSave on Vim startup


" SYNTASTIC
" Default recommended START
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" Default recommended STOP
" let g:syntastic_ocaml_checkers = ['merlin'] " Specify checker for ocaml
" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" OTHER STUFF
set shiftwidth=2


" MERLIN
let g:opamshare = substitute(system('opam config var share'),'\n$','','''') "required find merlin config
execute "set rtp+=" . g:opamshare . "/merlin/vim"

