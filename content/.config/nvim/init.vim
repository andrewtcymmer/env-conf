set nocompatible

call plug#begin('~/.config/nvim/vim-plugs')
  " Color scheme
  Plug 'morhetz/gruvbox'
  " utilities
  Plug 'vim-airline/vim-airline'
  " Javascript plugins
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'mustache/vim-mustache-handlebars'
  " Rust
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
call plug#end()

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

"This if-block is useful on my Mac, but looks bad with Arch+urxvt+i3wm
" if (has('termguicolors'))
"   set termguicolors
" endif
syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark='medium'   " options are hard, medium, soft
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

" Racer (rust)
augroup Racer
  autocmd!
  autocmd FileType rust nmap <buffer> gd          <Plug>(rust-def)
  autocmd FileType rust nmap <buffer> gs          <Plug>(rust-def-split)
  autocmd FileType rust nmap <buffer> gx          <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <buffer> gt          <Plug>(rust-def-tab)
  autocmd FileType rust nmap <buffer> <leader> gd <Plug>(rust-doc)
  autocmd FileType rust nmap <buffer> <leader> gD <Plug>(rust-doc-tab)
augroup END

