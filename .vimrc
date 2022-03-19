" Necessary top of file settings {{{
"───────────────────────────────────────────────────────────────────────────────
" UTF-8 by default - at top because things below rely on it being set
if has('multi_byte')
	if &termencoding ==? ''
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	scriptencoding utf-8
	"setglobal bomb
	set fileencodings=utf-8,latin1
endif
"
"───────────────────────────────────────────────────────────────────────────────
" }}}
"
" Plugin/Explicit sourcings {{{
"───────────────────────────────────────────────────────────────────────────────
"	runtime macros/matchit.vim        " better % matching
"	:source $HOME/.vim/plugin/rcs.vim " RCS plugin

" source any hostname-specific items
function! LoadFileNoError(filename)
	let l:FILE=expand(a:filename)
	if filereadable(l:FILE)
		exe  'source '  l:FILE
	endif
endfunction
let g:HOST = substitute ( hostname(), '\..*$', '', 'g' )
exec LoadFileNoError( '~/.vimrc.' . g:HOST )

"───────────────────────────────────────────────────────────────────────────────
"
" vim-plug (https://github.com/junegunn/vim-plug) settings
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	augroup PlugInitial
		autocmd!
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	augroup END
endif
call plug#begin('~/.vim/plugged')
"───────────────────────────────────────────────────────────────────────────────
"                               Plugins
"───────────────────────────────────────────────────────────────────────────────
" Look/Feel Plugins
Plug 'ap/vim-buftabline'               " light bufferline
Plug 'itchyny/lightline.vim'           " light status line
Plug 'ryanoasis/vim-devicons'          " filetype icons for vim
Plug 'Yggdroot/indentline'             " faster indent guides
" ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
" Color Schemes
Plug 'ap/vim-css-color'                " preview colors when editing
Plug 'briancarper/gentooish.vim'       " gentooish
Plug 'jonathanfilip/vim-lucius'        " lucius color scheme
" Plug 'andymass/vim-matchup'            " better matchit.vim
Plug 'josuegaleas/jay'                 " jay
Plug 'Lokaltog/vim-distinguished'      " distinguished
Plug 'nanotech/jellybeans.vim'         " jellybeans color scheme
Plug 'romainl/Apprentice'              " Apprentice
"───────────────────────────────────────────────────────────────────────────────
" Feature enhancements / Addons
Plug 'ConradIrwin/vim-bracketed-paste' " autodetect pastex text without set paste
Plug 'godlygeek/tabular'               " easily text alignment
Plug 'henrik/vim-indexed-search'       " show count of matched searches and position
Plug 'haya14busa/is.vim'               " incremental search matching
Plug 'jamessan/vim-gnupg'              " editing gpg-encrypted files
Plug 'lifepillar/vim-mucomplete'       " lightweight fast vim completion
Plug 'luochen1990/rainbow'             " better highlighting for nested {[()]}
" Plug 'maxbrunsfeld/vim-yankstack'      " better cut/paste :reg stuff
" Plug 'mhinz/vim-startify'              " recently used files
Plug 'mjbrownie/swapit'                " toggle things like true/false with C-A/C-X
Plug 'mzlogin/vim-markdown-toc'        " generate markdown table of contents
Plug 'reedes/vim-litecorrect'          " vim-litecorrect - autocorrect
Plug 'rickhowe/diffchar.vim'           " better diff
Plug 'tmhedberg/SimpylFold'            " properly fold python
Plug 'tpope/vim-abolish'               " Easier abbreviations
Plug 'tpope/vim-commentary'            " comment things out easily
Plug 'tpope/vim-repeat'                " Easily repeat with . plugin-based actions
Plug 'tpope/vim-speeddating'           " Easy increment/decrement of dates/times
Plug 'tpope/vim-surround'              " Easily surround text objects with '{[( etc
Plug 'vim-scripts/indentpython.vim'    " better python indentation
Plug 'vim-scripts/Vitality'            " fix vim autosave when inside tmux
Plug 'vim-utils/vim-troll-stopper'     " detect and remove unicode 'troll' characters
Plug 'vimwiki/vimwiki'                 " vimwiki
Plug 'w0rp/ale'                        " async lint checking
" Plug 'zirrostig/vim-schlepp'           " visual mode block movement
" ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
" Syntax file additions
Plug 'hashivim/vim-terraform'          " terraform syntax
Plug 'pearofducks/ansible-vim'         " ansible syntax
Plug 'sunaku/vim-hicterm'              " console colors syntax highlighted to match the color they appear in console
Plug 'tmux-plugins/vim-tmux'           " tmux syntax
Plug 'vim-scripts/nginx.vim'           " nginx syntax
"───────────────────────────────────────────────────────────────────────────────
" Revision control enhancements
Plug 'ludovicchabant/vim-lawrencium'   " vim mercurial integration
Plug 'mhinz/vim-signify'               " marks changed lines of revision controlled files
" Plug 'tpope/vim-fugitive'              " vim git integration
"───────────────────────────────────────────────────────────────────────────────
call plug#end()
" }}}
"
" set Options {{{
"───────────────────────────────────────────────────────────────────────────────
color jellybeans                            " Color scheme
filetype on                                 " Enable file type detection.
syntax on                                   " turn on syntax highlighting
set autoindent                              " So useful.
set autowriteall                            " Save on any buffer change. Avoids crash loss
set background=dark                         " I'm always going to have a dark background
set backspace=2 whichwrap+=<,>,[,]          " backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start              " Allow backspacing over everything in insert mode
set fillchars+=vert:│                       " nicer looking vertical fill character
set hidden                                  " remembers marks and undo when switching buffers
set history=1000                            " Ex command history length
set hlsearch                                " highlight search
set ignorecase                              " Turn off ignorecase in a typed search if an uppercase char exists.
set incsearch                               " incremental search
set lazyredraw                              " speed up macros by not forcing redraw
set list                                    " make nonprinting chars visible
set listchars=tab:\│\ ,trail:·,nbsp:.,precedes:←,extends:→  " nonprinting characters to show
set modeline                                " enable processing of modelines
set modelines=1                             " either the first or last line is the modeline
set nobackup                                " I hate *~ files.
set noexpandtab                             " ASCII-9 chars when hitting tab
set noshowmode                              " mode is in my status line already
set number                                  " number all the lines...
set relativenumber                          " ...relatively
set ruler                                   " Ruler is useful
set scrolloff=5                             " minimum number of lines above and below cursor
set shiftround                              " round indent to multiple of shiftwidth
set shiftwidth=4                            " This is the >> << value.
set shortmess+=I                            " No start up message
set showcmd                                 " Usefull for select and visual modes.
set showmatch                               " Show me where the opening matches to closing ) } ] are.
set smartcase                               " override ignorecase when search has capitals
set smarttab                                " use shiftwidth to calculate tabs
set splitbelow                              " more natural split locations
set splitright
set synmaxcol=3000                          " highlight columns only up to col 3000 - speeds up loading when lines are long{{{}}}
set t_Co=256                                " set 256 color mode always
set tabstop=4                               " This is the tab key value.
set tags=./tags,~/.vim/tags                 " Tags
set timeout timeoutlen=300 ttimeoutlen=50   " remove delay when hitting o,O,etc..
set title                                   " changes xterm title automatically
set ttyfast                                 " ttyfast indicates a fast terminal connection. force this.
set visualbell
set wildmenu                                " better tab completion of hostnames - puts bar with names above
set wrap                                    " let's display nicely, shall we?
set viminfo=<800,'100,/50,:100,h,f0,s10
"            │    │   │   │    │ │  └ dunno, but this is the default. can't find documentation for it anywhere.
"            │    │   │   │    │ └ file marks 0-9,A-Z 0=NOT stored
"            │    │   │   │    └ disable 'hlsearch' loading viminfo
"            │    │   │   └ command-line history saved
"            │    │   └search history saved
"            │    └ files marks saved
"            └ lines saved each register (old name for <, vi6.2)
"
" persistent undo is really handy
if has('persistent_undo')
	if !isdirectory($HOME . "/.vim/undo")
		call mkdir($HOME . "/.vim/undo", "p", 0700)
	endif
	set undolevels=5000
	set undodir=$HOME/.vim/undo
	set undofile
	set updatecount=20
endif

" automatically wrap text to textwidth (t),
set formatoptions+=wjtcron
"                  ││││││└ better indentation of lists
"                  │││││└ insert comment char when inserting new lines
"                  ││││└ insert comment char when inserting new lines
"                  │││└ autowrap comments at textwidth
"                  ││└ wrap text to textwidth
"                  │└ delete comment char when joining lines
"                  └ space and end of line indicates paragraph continues

