#!/usr/bin/env sh
echo ""

VIM_HOME=~/.vim
BUNDLE_DIR=$VIM_HOME/bundle

if [-e $VIM_HOME ]; then
  echo "$VIM_HOME already exists!"
  exit 1
fi

echo "Fetching vimrc..."
rm -rf "$VIM_HOME"
git clone git@github.com:gonglexin/.vim.git $VIM_HOME

echo "Fetching NeoBundle..."
mkdir -p $BUNDLE_DIR
git clone https://github.com/Shougo/neobundle.vim $VIM_HOME/bundle/neobundle.vim

echo "Installing plugins..."
vim +NeoBundleInstall +q

echo "Done."
