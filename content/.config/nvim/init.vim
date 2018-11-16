set nocompatible

call plug#begin('~/.config/nvim/vim-plugs')
  " Color scheme
  Plug 'morhetz/gruvbox'
  " utilities
  Plug 'vim-airline/vim-airline'
  " Javascript plugins
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
call plug#end()

" gruvbox-specific settings
let g:gruvbox_contrast_dark='hard'   " options are hard, medium, soft

" vim-airline specific settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" standard stuff
filetype on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8

" visuals 
syntax on
colorscheme gruvbox
set background=dark
set relativenumber
set nowrap
set colorcolumn=120

" tab trickery
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" key mappings
map <F4> :NERDTreeToggle<CR>
