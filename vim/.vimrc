set cursorline


set clipboard=unnamed

set number

set iskeyword-=_

set viminfo='100,<1000,s1000,h "'100 Increases the number of files that buggers are stored for to 100,

" Set the encoding to utf-8:
set encoding=utf-8

" Case insensitive searches
set ignorecase

" Case sensitive search if search contains capital letters
set smartcase

" Try the following if your GUI uses a dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/

" Fix coloring in vimdiff
" if &diff
"   colorscheme mycolorscheme
" endif

" Highlight overlength (120+) lengths as red.
highlight OverlengthErr ctermbg=red ctermfg=black

2match OverlengthErr /\%121v.\+/

" Clear last search
command Clear let @/ = ""

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

"""""""""""""""""""""""""
" Vundle stuff:
" To install the plugins, open vim and type :PluginInstall
"""""""""""""""""""""""""

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""
" Vundle over
"""""""""""""""""""""""""

" YouCompleteMe customisations:
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '/home/li/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_autoclose_preview_window_after_completion=1
set completeopt=longest,menu


" turn back on filetype
filetype plugin indent on

" Python highlighting
let python_highlight_all=1
syntax on

" Moving around split screens with ctrl-h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Powerline config:
" To get all the symbols working I had to install Source Code Pro for
" Powerline from here: https://github.com/powerline/fonts/tree/master/SourceCodePro
" In the end though I preferred this font for powerline, Meslo LG M which I
" downloaded from https://github.com/powerline/fonts/tree/master/Meslo%20Slashed
" and set that to be my font in iterm2
let g:Powerline_symbols = 'fancy'
set laststatus=2

" Python autoindents
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Fullstack autoindents
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
