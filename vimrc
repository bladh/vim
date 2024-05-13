" general settings
set nu
syntax on
colorscheme delek
set expandtab
set shiftwidth=4
set colorcolumn=80
set hlsearch

" highlight whitespace
set list
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
highlight ExtraWhitespace ctermbg=red
highlight SpecialKey ctermbg=7
highlight SpecialKey ctermfg=13
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" wild menu
set wildmenu
set wildmode=list:longest,full
set wildignore=*/.git/**/*
set wildignorecase

" buffers
set hidden
nnoremap gb :ls<CR>:b<Space>

" tabs
nnoremap <tab> :tabnext<CR>
nnoremap <s-tab> :tabp<CR>
nnoremap <c-n> :tabnew<CR>:Lexplore<CR>
set showtabline=2

" file exploration
nnoremap < :Lexplore<CR>

" netrw conf
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3
autocmd FileType netrw autocmd BufLeave <buffer> if &filetype == 'netrw' | :bd | endif

"" vimdiff configuration
if &diff
	set cursorbind
	set scrollbind
	map <Down> j<C-w><C-w><C-w><C-w>
	map <Up> k<C-w><C-w><C-w><C-w>
endif

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

autocmd FileType gitcommit exec ShowDiff()
