set nocompatible
filetype off                   " required! by vundle

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'slack/vim-bufexplorer'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/VimClojure'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'kikijump/tslime.vim'
" vim-scripts repos
Bundle 'rails.vim'
Bundle 'kwbdi.vim'
Bundle 'Align'
Bundle 'repeat.vim'
Bundle 'surround.vim'
Bundle "ZoomWin"
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

" ...
" =========================
" Basic stuff
" =========================

let maplocalleader = ","
let mapleader = ","

syntax on
filetype on
filetype indent on
filetype plugin on


" Hide buffers when they are abandoned
set hidden

" Incremental search
set incsearch

" Switch syntax highlighting on
set hlsearch

" Show (partial) command in status line.
set showcmd

set smarttab autoindent

" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase


set expandtab
set shiftwidth=2
set tabstop=2

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" Set the textwidth to be 120 chars
set textwidth=120


" get rid of the silly characters in window separators
set fillchars=""



" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showmatch	" Show matching brackets.
set mouse=a		" Enable mouse usage (all modes) in terminals


set background=dark
"colorscheme vividchalk
"colorscheme navajo-night
"colorscheme xoria256
colorscheme solarized
"colorscheme blackboard


set mousehide	" Hide the mouse when typing text

"autocmd BufEnter * lcd %:p:h  " change to directory of current file automatically


set nowrap

set modeline

" make search results appear in the middle of the screen
" faz os resultados da busca aparecerem no meio da tela
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" remap motion keys for dvorak layout
noremap d h
noremap h j
noremap t k
noremap n l

" remap domino effect of the last remapping
noremap j d
noremap l n
noremap L N
noremap k t
noremap K T

noremap - $
noremap _ ^


" F2 to save all bufers
map <F2> :wa<CR>
imap <F2> <ESC>:wa<CR>a

" F1 to save all bufers
map <F1> :wa<CR>
imap <F1> <ESC>:wa<CR>a

" F4 to close a buffer
map <F4> :bd<CR>
imap <F4> <ESC>:bd<CR>


if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
"  set bomb
  set termencoding=utf-8
  set fileencodings=utf-8,iso-8859-1,iso-8859-3
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Activate git commit syntax highlighting
"if has("autocmd")
  "autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
"endif

" set guifont=ProggyCleanTT\ 12
 "set guifont=Sans\ 8
" set guifont=Droid\ Sans\ Mono\ 10
  "set guifont=Monaco\ 10
  "set guifont=Mensch\ 10
  set guifont=Anonymous\ Pro\ 12
"set guifont=Terminus\ 14
set linespace=1

if filereadable("/home/seba/.vim/abrev.vim")
  source /home/seba/.vim/abrev.vim
endif

" Make de unnamed clipboard match de X clipboard
set clipboard=unnamed

" use lists when completing, the wildmenu is annoying
set wildmode=longest,list
"set wildmenu

" backspace can backspace over anything
set backspace=indent,eol,start

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ \ Col:\ %c\ Buf:\ #%n%=[TYPE=%Y\ %{&ff}]




" next/prev buffer
" tab in normal mode does a :bn buffer-next
nmap <TAB> :bn<cr>
" shift-tab in normal mode does a :bp buffer-prev
nmap <S-TAB> :bp<cr>

"Fechamento automático de parênteses, chaves e colchetes
"imap { {}<left>
"imap ( ()<left>
"imap [ []<left>

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2


" Highlight redundant whitespace and tabs.
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/


" Typos
map :W :w
map :WQ :wq
map :Wq :wq
map :Q :q
map :E :e

" yss_ wrapps sentence in gettext call
let g:surround_95 = "_('\r')"
let g:surround_92 = "<%= _('\r') %>"

" Add recently accessed projects menu (project plugin)
set viminfo^=!

" buftabs config
:let g:buftabs_only_basename=1


" Minibuffer Explorer Settings
"let g:miniBufExplMapWindowNavVim = 1
""let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

set history=512  " Number of things to remember in history.
"set autowrite  " Writes on make/shell commands

"" Line numbering
set nu
"set numberwidth=5

set formatoptions+=c

" Mail writting
if has("autocmd")
  autocmd FileType mail set autoindent expandtab formatoptions+=n
  autocmd FileType mail highlight clear RedundantWhitespace
endif

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=l "remove scroll bars
:set guioptions-=L  "remove scroll bars
:set guioptions-=r  "remove scroll bars
:set guioptions-=R  "remove scroll bars
:set guioptions-=b  "remove scroll bars


" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Turn off that stupid highlight search
nnoremap <leader><space> :noh<cr>


" fix window movement

" Move the cursor to the window left of the current one
noremap <silent> ,d :wincmd h<cr>

" Move the cursor to the window below the current one
noremap <silent> ,h :wincmd j<cr>

" Move the cursor to the window above the current one
noremap <silent> ,t :wincmd k<cr>

" Move the cursor to the window right of the current one
noremap <silent> ,n :wincmd l<cr>

" switch screens
noremap <silent> ,sb :wincmd p<CR>


" Close the window below this one
noremap <silent> ,ch :wincmd h<cr>:close<cr>

" Close the window above this one
noremap <silent> ,ct :wincmd t<cr>:close<cr>

" Close the window to the left of this one
noremap <silent> ,cd :wincmd d<cr>:close<cr>

" Close the window to the right of this one
noremap <silent> ,cn :wincmd n<cr>:close<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Move the current window to the right of the main Vim window
noremap <silent> ,mn <C-W>N

" Move the current window to the top of the main Vim window
noremap <silent> ,mt <C-W>T

" Move the current window to the left of the main Vim window
noremap <silent> ,md <C-W>D

" Move the current window to the bottom of the main Vim window
noremap <silent> ,mh <C-W>H


"noremap <silent> <C-Right> <C-W>>
"noremap <silent> <C-Up> <C-W>+
"noremap <silent> <C-Down> <C-W>-
"noremap <silent> <C-Left> <C-W><



" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,


" Buffer commands
"noremap <silent> <leader>bd :bd<CR>


" Miscelaneus

" Set the search scan to wrap around the file
set wrapscan

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set visualbell

"highlight current line
"set cursorline
"
set ttyfast
set relativenumber


" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=4

" Allow the cursor to go in to "invalid" places
"set virtualedit=all

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048



let g:snippetsEmu_key = "<S-Enter>"

" vimclojure stuff
let vimclojure#WantNailgun = 0
let vimclojure#NailgunClient = "/home/seba/development/vimclojure/client/ng"
let vimclojure#HighlightBuiltins = 1
let vimclojure#HighlightContrib = 1
let vimclojure#ParenRainbow = 1
let vimclojure#DynamicHighlighting = 1


" Align plugin settings
let g:Align_xstrlen= 2

" super tab
"let g:SuperTabDefaultCompletionType = "context"

"-----------------------------------------------------------------------------
" FuzzyFinder Settings
"-----------------------------------------------------------------------------
let g:fuf_file_exclude         = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])(\.hg|\.git|\.bzr|\.bundle|public/system|public/images|vendor|public/javascripts/ckeditor)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|sw[po])$|(^|[/\\])(\.hg|\.git|\.bzr|\.bundle|public/system|public/images|vendor|public/javascripts/ckeditor)($|[/\\])'

"nmap <leader>fb :FufBuffer<CR>
"nmap <leader>ff :FufFile **/<CR>
"nmap <leader>ft :FufTag<CR>
"nmap <leader>fd :FufCoverageFile<CR>

" Command-T plugin config
let g:CommandTMatchWindowAtTop = 1
set wildignore+=*.o,*.obj,.git,vendor,public/system
nmap <silent> <Leader>f :CommandT<CR>


"fix Vim’s horribly broken default regex “handling” by
"automatically inserting a \v before any string you search for.
"This turns off Vim’s crazy default regex characters and makes
"searches use normal regex
nnoremap / /\v
vnoremap / /\v

"applies substitutions globally on lines.
"if you need the previous behavior you just tack on the g again
set gdefault

" draw color column at 85 chars to the right
set colorcolumn=85

" to normal mode with uu
inoremap uu <ESC>
" since I mapped a uu to esc, I don't want to use esc, comment out if already trained
"imap <ESC> <nop>

" help me insert empty lines in normal mode
:nmap <silent> <Enter> ouut

nnoremap <leader>a :Ack
nnoremap <silent> <leader>s :vsplit<CR>

nmap <leader>w :update<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" TwitVim config

let twitvim_browser_cmd = 'chromium'
let twitvim_api_root = "https://api.twitter.com/1"
let twitvim_count = 50
let twitvim_old_retweet = 1

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
set list




" ` is useful and hard to type, I almost never want '
map ' `


"When off the cursor is kept in the same column
"(if possible).  This applies to the commands: CTRL-D, CTRL-U, CTRL-B,
"CTRL-F, G, H, M, L, gg, and to the commands d, << and >>
set nostartofline



let g:slimv_lisp='"java -cp `./src/scripts/classpath`:src/main/clojure clojure.main"'

let g:snips_author='Sebastián Bernardo Galkin'

if (has("gui_running") || g:solarized_termtrans == 0)
  highlight NonText guifg=#003340
endif

nnoremap <F5> :GundoToggle<CR>
