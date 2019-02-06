if &diff
else
    " disable cursoline as it can slow vim down a lot -- I can turn it on
    " later if I want
	" set cursorline
	set clipboard=unnamed

	" lazy redraw should speed up scrolling a little bit
	set lazyredraw

	" show line number, column number and percentage through file
	set ruler

	" allow backspacing over everything in insert mode
	set backspace=indent,eol,start

	" enable mouse inside vim
	" set mouse=a
	
	" show number of characters highlighted in visual mode:
	set showcmd

	" add numbers (add relativenumber if you want relative numbering -- it
	" is quite slow though)
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

	" projectionist
	Plug 'tpope/vim-projectionist'
	" surround
	Plug 'tpope/vim-surround'
	" fugitive
	Plug 'tpope/vim-fugitive'

	" vim-go
	Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

	" python formatting with black
	Plug 'ambv/black'

    " javascript
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'

    " snippets
    Plug 'https://github.com/SirVer/ultisnips'

    " multiple cursors! :)
    Plug 'terryma/vim-multiple-cursors'

    " vim-fish
    Plug 'dag/vim-fish'

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
	command! -nargs=* Ag call ack#Ack('grep!',<q-args>)

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

	" Filename at bottom of file
	set laststatus=2

	" NERDTreeTabs config:
	" Auto open NERDTreeTabs on startup
	"let g:nerdtree_tabs_open_on_console_startup=1
	"command NT NERDTreeTabsToggle

	" Vim Go customisation:
	let g:go_fmt_command = "goimports"

	" Vim Ale
	" add gometalinter:
	"let g:ale_linters = {'go': ['gometalinter']}
	" speed up for files with lots of errors:
	let g:ale_echo_delay = 100
  let g:ale_fixers = {'javascript': ['prettier'], 'css': ['prettier']}
  let g:ale_fix_on_save = 1
	command AT ALEToggle


	" Python highlighting
	let python_highlight_all=1
	syntax on

	" Snippets customisation
	let g:UltiSnipsUsePythonVersion = 3
	"let g:UltiSnippetsDir="~/.vim/snips"
	"let g:UltiSnipsSnippetDirectories=["snips"]
    let g:UltiSnipsListSnippets = '<C-l>'
    "let g:UltiSnipsExpandTrigger="<c-j>"

	" shorten the ranger new tab command
	command RNT RangerNewTab

    " vim multiple cursors
    "let g:multi_cursor_select_all_word_key = '<C-a>'
endif
" Moving around split screens with ctrl-h,j,k,l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python formatting
" au BufWritePre *.py execute ':Black'

" Python autoindents
au BufNewFile,BufRead *.py,*.feature
    \ set nornu |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set cc=88 |

" Frontend autoindents
au BufNewFile,BufRead *.js,*.json,*.html,*.css,*.vue
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Latex specification
au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nonumber |
    \ set nornu |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ let g:loaded_matchparen=1 |
    \ highlight clear OverLengthErr |

" C/go autoindents
au BufNewFile,BufRead *.m,*.h,*.c,*.cpp,*.go
    \ set nornu |
    \ set shiftwidth=8 |
    \ set softtabstop=8 |
    \ set tabstop=8 |


"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
