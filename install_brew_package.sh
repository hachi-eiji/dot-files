echo 'install homebrew'
DOTFILE_DIR="$HOME/github.com/hachi-eiji/dot-files"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir $HOME/.config

brew doctor

brew install tmux reattach-to-user-namespace

brew tap universal-ctags/universal-ctags
brew install universal-ctags

brew install mosh

brew install tig

brew tap peco/peco
brew install peco
ln -s $DOTFILE_DIR/.config/peco $HOME/.config

brew install hub

brew install editorconfig

brew install direnv

brew install rbenv ruby-build
rbenv init

brew install pyenv pyenv-virtualenv
pyenv init

brew install nodenv
nodenv init
