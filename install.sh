#!/bin/sh 

WORK_DIR='/tmp'
DOT_FILE_DIR=`pwd`
TMP_FILE='/tmp/makelink.sh'

echo 'install brew'
ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)
brew doctor

echo 'install ctag'
brew install ctags
sudo mv /usr/bin/ctags /usr/bin/ctags.org

echo 'install tmux'
brew install tmux

echo 'install mosh'
brew install mosh

echo 'install tig'
brew install tig 

echo 'install Ricky'
cd $WORK_DIR
brew tap sanemat/font
brew install ricty
cp -f /usr/local/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

git clone git@github.com:Lokaltog/vim-powerline.git
cd vim-powerline/fontpatcher
fontforge -lang=py -script fontpatcher ~/Library/Fonts/Ricty-Bold.ttf
fontforge -lang=py -script fontpatcher ~/Library/Fonts/Ricty-Regular.ttf
mv Ricty* ~/Library/Fonts

echo 'vim vundle'
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo 'install oh-my-zsh'
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

find `pwd` -maxdepth 1 -mindepth 1 -type f -name ".*" | awk -F"/" '{print "ln -is",$0,"~/"$NF}' > $TMP_FILE
sh $TMP_FILE
