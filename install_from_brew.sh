#!/bin/sh

set -eu

if [ ! -x "`which ruby`" ]; then
	echo "install ruby at first"
	exit 1
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew docker
brew update

echo 'rbenv'
brew install rbenv ruby-build

echo 'pyenv'
brew install pyenv pyenv-virtualenv

echo 'install ctag. sudo mv /usr/bin/ctags /usr/bin/ctags.org'
brew install ctags

echo 'install tig'
brew install tig

echo 'install ricky'
brew upgrade ricty --vim-powerline --powerline
cp -f /usr/local/Cellar/ricty/4.0.1/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

echo 'install peco. copy my peco config'
brew tap peco/peco
brew install peco

echo 'hub'
brew install --HEAD hub

echo 'editorconfig'
brew install editorconfig

echo 'direnv'
brew install editorconfig

echo 'jq'
brew install jq

echo 'mosh'
brew install mosh

echo 'go'
brew install go
