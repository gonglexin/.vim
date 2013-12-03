#!/usr/bin/env bash
echo ""
echo "Deploy vimrc ......"

rm -f $HOME/.vimrc
rm -f $HOME/.gvimrc

cd $HOME/.vim
mkdir bundle
cd bundle
git clone https://github.com/gmarik/vundle.git
cd $HOME/.vim
ln -s vimrc $HOME/.vimrc
vim +BundleInstall +qall

echo "Done."


