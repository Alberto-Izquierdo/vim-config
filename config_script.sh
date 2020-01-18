#!/bin/bash
_processInput() {
    declare -l var
    var=$1
    if [[ "$var" == "y" ]] || [[ "$var" == "yes" ]] ; then
        return
    fi
    false
}
# Install dependencies
read -p "Install dependencies from apt? [y/N]: " answer_y_n
if _processInput $answer_y_n
then
    sudo apt-get install curl git vim clang-format silversearcher-ag
fi
# Create directories
mkdir -p ~/.vim/bundle
mkdir ~/.vim/colors
# Copy vimrc
cp vimrc ~/.vimrc
cp clang-format.py ~/.vim/
# Install plugins
cd ~/.vim/bundle
read -p "Install vim-go plugin? (if go is not installed you will get an error each time you open vim) [y/N]: " answer_y_n
if _processInput $answer_y_n
then
    git clone https://github.com/fatih/vim-go.git
fi
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/msanders/snipmate.vim.git
# Remove default snippets, it will clone custom ones
cd snipmate.vim
rm -r snippets
cd ~/.vim/bundle
git clone https://github.com/Alberto-Izquierdo/vim-snippets
git clone https://github.com/rust-lang/rust.vim.git
git clone https://github.com/rust-lang/rust.vim.git
git clone https://github.com/tpope/vim-fugitive.git
# Clone pathogen
pushd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git
cp -r vim-pathogen/autoload ~/.vim
sudo rm -r vim-pathogen
# Install color
cd ~/.vim/colors
git clone https://github.com/morhetz/gruvbox
cp gruvbox/colors/* .
if ! grep -q 'stty -ixon' ~/.bashrc
then
    echo 'stty -ixon' >> ~/.bashrc
fi
unset -f _processInput
unset -v answer_y_n
popd
