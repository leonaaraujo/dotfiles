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

  " lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

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
  Plug 'APZelos/blamer.nvim'

  " git diff
  Plug 'nvim-lua/plenary.nvim'
  Plug 'sindrets/diffview.nvim'

  " searching
  " obs.: needs silversearcher-ag
  " sudo apt install -y silversearcher-ag
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

  " html
  Plug 'mattn/emmet-vim'

  " godot
  Plug 'habamax/vim-godot'

  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

call plug#end()

" shortcuts
nnoremap <C-s> :w<CR> " save
tnoremap <Esc> <C-\><C-n> " terminal go to normal mode

" Hybrid line numbers
"set number relativenumber
"set nu rnu

" Render whitespaces
set list listchars=space:·
nnoremap <leader>w <cmd>set list listchars=space:·<cr>
nnoremap <leader>ww <cmd>set list listchars=<cr>

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

" mouse
"set mouse+=a
nnoremap <leader>m <cmd>set mouse-=a<cr>
nnoremap <leader>mm <cmd>set mouse+=a<cr>

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

" lsp install setup
lua << EOF
local lsp_installer = require("nvim-lsp-installer").setup {}
--lsp_installer.on_server_ready(function(server)
    --local opts = {}
    --server:setup(opts)
--end)
EOF

" git gutter
command! GitGutterEnable
nnoremap <leader>g <cmd>:GitGutterDisable<cr>
nnoremap <leader>gg <cmd>:GitGutterEnable<cr>

" git blame
let g:blamer_enabled = 1

" silversearcher
nnoremap <silent> <C-p> :Ag<cr>
