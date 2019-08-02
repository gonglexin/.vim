#!/usr/bin/env sh
echo ""

VIM_HOME=~/.vim

if [-e $VIM_HOME ]; then
  echo "$VIM_HOME already exists!"
  exit 1
fi

echo "Fetching vimrc..."
rm -rf "$VIM_HOME"
git clone git@github.com:gonglexin/.vim.git $VIM_HOME

echo "Fetching vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing plugins..."
vim +PlugInstall +q

echo "Done."
