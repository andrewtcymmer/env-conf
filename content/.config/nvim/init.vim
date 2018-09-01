call plug#begin('~/.config/nvim/vim-plugs')
  " Color scheme
  Plug 'morhetz/gruvbox'
call plug#end()

" gruvbox-specific settings
let g:gruvbox_contrast_dark='hard'   " options are hard, medium, soft

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
set number
set nowrap

" tab trickery
set expandtab
set tabstop=2
set shiftwidth=2

