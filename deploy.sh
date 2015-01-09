#!/bin/sh

get()
{
	git clone $1
}

(
cd $PWD/vim/bundle && rm -rf *
get https://github.com/mhinz/vim-startify.git
get https://github.com/nathanaelkane/vim-indent-guides.git
get https://github.com/scrooloose/nerdtree.git
get https://github.com/Lokaltog/vim-easymotion.git
get https://github.com/tpope/vim-fugitive.git
get https://github.com/airblade/vim-gitgutter.git
get https://github.com/itchyny/lightline.vim.git
)

ln -s $(readlink -f vimrc) $HOME/.vimrc
ln -s $(readlink -f vim) $HOME/.vim
