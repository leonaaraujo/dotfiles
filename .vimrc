" requirements:
"
" coc: node >= 14.14

call plug#begin('~/.vim/plugged')

    " languages package
    Plug 'sheerun/vim-polyglot'

    " theme
    Plug 'joshdick/onedark.vim'

    " bottom bar
    Plug 'vim-airline/vim-airline'

    " comments
    Plug 'scrooloose/nerdcommenter'

    " lsp
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " auto-complete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'rhysd/git-messenger.vim'

call plug#end()

" colors setup
syntax on
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    set t_Co=256
endif
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" shortcuts
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Render whitespaces
set list listchars=space:·
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

" auto reload and format files
set autoread
set autoindent copyindent smartindent

" format
vmap <buffer> <leader>f <plug>(coc-format-selected)
nmap <buffer> <leader>f <plug>(coc-format)

" coc remapping
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
