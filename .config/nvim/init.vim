" ----------------------------------------------------------------------------------------------------------------------------------
" PLUGINS
" ----------------------------------------------------------------------------------------------------------------------------------

call plug#begin('~/.nvim/plugged')

  " theme
  Plug 'monsonjeremy/onedark.nvim'

  " comments
  Plug 'scrooloose/nerdcommenter'

  " tabs
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'

  " filetree
  Plug 'kyazdani42/nvim-tree.lua'

  " auto-formatter
  Plug 'sbdchd/neoformat'

  " bottom bar
  Plug 'hoob3rt/lualine.nvim'

  " editorconfig
  Plug 'editorconfig/editorconfig-vim'

  " wakatime
  Plug 'wakatime/vim-wakatime'

  " tree sitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " git diff
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'

  " debugger
  Plug 'puremourning/vimspector'

  " LSP + mason
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'

  " LSPSaga
  Plug 'nvimdev/lspsaga.nvim'

  " git blame
  Plug 'f-person/git-blame.nvim'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
  Plug 'nvim-telescope/telescope.nvim'

call plug#end()


" ----------------------------------------------------------------------------------------------------------------------------------
" ESSENTIALS SETUP
" ----------------------------------------------------------------------------------------------------------------------------------

" shortcuts
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Render whitespaces
set list listchars=space:·
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

" mouse
nnoremap <leader>m <cmd>set mouse-=a<cr>
nnoremap <leader>mm <cmd>set mouse+=a<cr>

" windows bash fix
set shell=bash
set shellcmdflag=-c

" indent
lua << EOF
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
EOF

" ----------------------------------------------------------------------------------------------------------------------------------
" PLUGINS SETUP
" ----------------------------------------------------------------------------------------------------------------------------------

" theme
syntax on
lua << EOF
require('onedark').setup({ transparent = true })
EOF

" bottor bar
lua << EOF
require('lualine').setup {options = {theme = 'onedark'}}
EOF

" tabs
nnoremap <silent> <Tab> :BufferNext<CR>
nnoremap <silent> <C-c> :BufferClose<CR>

" tree.lua setup
lua << EOF
require'nvim-tree'.setup { }
local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end
tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end
return tree
EOF

" tabs
nnoremap <silent> <C-b> :NvimTreeToggle<CR>
" inverse tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" git gutter
command! GitGutterEnable
nnoremap <leader>g <cmd>:GitGutterDisable<cr>
nnoremap <leader>gg <cmd>:GitGutterEnable<cr>

" Telescope
nnoremap <silent> <C-p> :Telescope find_files<cr>

" auto-formatter
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" LSPSaga
lua << EOF
local saga = require('lspsaga')
saga.setup({})
EOF

" LSP servers
lua << EOF
vim.lsp.enable({ 'omnisharp', 'prismals' })
EOF

" Mason
lua << EOF
require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})
require('mason-lspconfig').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "vtsls" },
})
EOF
