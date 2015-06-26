"" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

"" General settings
"let g:neocomplete#enable_at_startup = 1
set mouse=a
set splitright
set splitbelow
set shell=/bin/sh
set term=xterm-256color
set tabstop=4
set shiftwidth=4
set history=200
set title
set ttimeoutlen=40
set laststatus=2
set hidden
set title titlestring=VIM\ %F
set clipboard+=unnamed
set paste
set go+=a
set expandtab
set scrolloff=5
autocmd FileType sh set noexpandtab
autocmd FileType bash set noexpandtab
autocmd FileType go set noexpandtab
autocmd FileType vim set noexpandtab
filetype plugin indent on
set autoindent
"source ~/.vim/bundle/vim-autoswap-i3/autoswap_i3.vim
let g:gundo_preview_bottom = 1
let g:gundo_preview_height = winheight(1)/2

"let g:gundo_preview_height = 20

let g:gundo_right = 1

"" Visuals
colorscheme Tomorrow
syntax on
set fillchars+=vert:\
set number
set colorcolumn=80
set hlsearch
set cursorline
set noshowmode
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
" For dark colorscheme
"highlight IndentGuidesOdd ctermbg=black
"highlight IndentGuidesEven ctermbg=232
"highlight IndentGuidesOdd ctermfg=237
"highlight IndentGuidesEven ctermfg=238
" For bright colorscheme
"highlight IndentGuidesOdd ctermbg=3
highlight IndentGuidesEven ctermbg=7
highlight IndentGuidesOdd ctermfg=237
highlight IndentGuidesEven ctermfg=238
""
map m :GitGutterLineHighlightsToggle<CR>
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

highlight ExtraWhitespace ctermbg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"" vimdiff configuration
if &diff
	set cursorbind
	set scrollbind
"	map <Down> j:syncbind<CR>
"	map <Up> k:syncbind<CR>
	map <Down> j<C-w><C-w><C-w><C-w>
	map <Up> k<C-w><C-w><C-w><C-w>
endif

"" Mappings
let mapleader=" "
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
nnoremap ö :
nnoremap  <silent>   <tab>  :bn<CR>
nnoremap  <silent> <s-tab>  :bp<CR>
nnoremap <C-P> "*p
nnoremap <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F6> :TagbarToggle<CR>

"" Dictionary completion
set dictionary+=/usr/share/dict/words
set thesaurus+=~/.thesaurus
set complete+=k

"" Functions

" Show diff in split window
function ShowDiff()
	if winwidth(1) > 160
		vnew
	elseif winheight(1) > 50
		new
	else
		tabnew
	endif
	0read ! git diff --cached
	set filetype=diff
	tabfirst
endfunction

"" Autocommands
autocmd FileType gitcommit exec ShowDiff()

"" Fancy statusbar settings
"" If using dark scheme, set colorscheme to 'wombat'
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"\uE0A2":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }
