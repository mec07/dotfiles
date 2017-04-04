set cursorline

set clipboard=unnamed

set number

set iskeyword-=_

set tabstop=2 shiftwidth=2 expandtab

set viminfo='100,<1000,s1000,h "'100 Increases the number of files that buggers are stored for to 100,

" Case insensitive searches

set ignorecase

" Case sensitive search if search contains capital letters

set smartcase

 

" Try the following if your GUI uses a dark background.

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

 

" Show trailing whitespace:

match ExtraWhitespace /\s\+$/

 

" Fix coloring in vimdiff

#if &diff
#
#  colorscheme mycolorscheme
#
#endif

 

" Highlight overlength (120+) lengths as red.

highlight OverlengthErr ctermbg=red ctermfg=black

2match OverlengthErr /\%121v.\+/

 

" Clear last search

command Clear let @/ = ""
