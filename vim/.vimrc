if &diff
else
	set cursorline
	set clipboard=unnamed

	" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

	" enable mouse inside vim
	set mouse=a
	set number relativenumber

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

	" Clear last search
	command Clear let @/ = ""

	" Enable copying by highlighting with mouse
	command Copy set nonu |
	  \ set mouse= |
	"  \ NT

	command Uncopy set nu |
	  \ set mouse=a |
	"  \ NT

	" Maintain undo history between sessions
	set undofile
	set undodir=~/.vim/undodir

	" Enable folding
	set foldmethod=indent
	set foldlevel=1
	" Enable folding with the spacebar
	nnoremap <space> za

	" ignore files in NERDTree
	"let NERDTreeIgnore=['\.pyc$', '\~$']

	"""""""""""""""""""""""""
	" Vundle stuff:
	" To install the plugins, open vim and type :PlugInstall
	"""""""""""""""""""""""""

	set nocompatible              " required
	filetype off                  " required

	call plug#begin('~/.vim/plugged')

	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plug 'gmarik/Vundle.vim'

	" replacement for syntastic
	Plug 'w0rp/ale'

	" Folding plugins
	Plug 'tmhedberg/SimpylFold'
	Plug 'Konfekt/FastFold'
	"Bundle 'Valloric/YouCompleteMe'
	Plug 'nvie/vim-flake8'
	Plug 'jnurmine/Zenburn'
	"Plug 'scrooloose/nerdtree'
	"Plug 'jistr/vim-nerdtree-tabs'
	Plug 'francoiscabrol/ranger.vim'
	" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
	" Fuzzy file finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	" Search repo from within vim
	Plug 'mileszs/ack.vim'
	" Vue js syntax
	Plug 'posva/vim-vue'

	" All of your Plugs must be added before the following line
	call plug#end()            " required
	filetype plugin indent on    " required

	"""""""""""""""""""""""""
	" Vundle over
	"""""""""""""""""""""""""

	" Search using ag instead of ack:
	if executable('ag')
		let g:ackprg = 'ag --vimgrep'
	endif
	" Rename Ack! command to Ag
	command Ag Ack!
	" YouCompleteMe customisations:
	" let g:ycm_seed_identifiers_with_syntax=1
	" let g:ycm_global_ycm_extra_conf = '/home/li/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
	" let g:ycm_confirm_extra_conf=0
	" let g:ycm_collect_identifiers_from_tag_files = 1
	" let g:ycm_autoclose_preview_window_after_completion=1
	" set completeopt=longest,menu

	" Powerline config:
	" To get all the symbols working I had to install Source Code Pro for
	" Powerline from here: https://github.com/powerline/fonts/tree/master/SourceCodePro
	" In the end though I preferred this font for powerline, Meslo LG M which I
	" downloaded from https://github.com/powerline/fonts/tree/master/Meslo%20Slashed
	" and set that to be my font in iterm2
	let g:Powerline_symbols = 'fancy'
	set laststatus=2

	" NERDTreeTabs config:
	" Auto open NERDTreeTabs on startup
	"let g:nerdtree_tabs_open_on_console_startup=1
	"command NT NERDTreeTabsToggle

	" Python highlighting
	let python_highlight_all=1
	syntax on

	" shorten the ranger new tab command
	command RNT RangerNewTab
endif
" Moving around split screens with ctrl-h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Python autoindents
au BufNewFile,BufRead *.py,*.feature
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set cc=80 |

" Frontend autoindents
au BufNewFile,BufRead *.js,*.html,*.css,*.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Latex autoindents
au BufNewFile,BufRead *.tex
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ highlight clear OverLengthErr |


"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
