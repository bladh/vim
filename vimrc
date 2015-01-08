"" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"" General settings
set mouse=a
set splitright
set splitbelow
set shell=/bin/sh
set term=xterm-256color
set tabstop=4
set shiftwidth=4
set title
set fillchars+=vert:\
set ttimeoutlen=40
set noshowmode
set laststatus=2
set hidden

"" Visuals
colorscheme distinguished
syntax on
set number
set colorcolumn=80
set hlsearch

"" Mappings
let mapleader=" "
map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
nnoremap ö :
nnoremap  <silent>   <tab>  :bn<CR>
nnoremap  <silent> <s-tab>  :bp<CR>
nnoremap <C-P> "*p
nnoremap <Space> :nohlsearch<Bar>:echo<CR>

" show excessive whitespace:
highlight ExtraWhitespace ctermbg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"" Functions
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

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
autocmd VimEnter * call StartUp()
autocmd FileType gitcommit exec ShowDiff()

"" Fancy statusbar settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
