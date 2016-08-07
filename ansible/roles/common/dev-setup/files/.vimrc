" Set Vim properties

set nocompatible              " be iMproved, required
set rnu
set hlsearch
set number
set rtp+=~/.vim/bundle/Vundle.vim

filetype off                  " required

" Vim Plugins
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'slim-template/vim-slim.git'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required

syntax enable
filetype plugin indent on    " required

" Shift Enter will insert new line without going to insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" NERDTree helpers
" autocmd VimEnter * NERDTree
" autocmd BufEnter * NERDTreeMirror
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Vim Better Whitespace
" Remove whitespace by default
autocmd BufWritePre * StripWhitespace

" Styling
colorscheme jellybeans
