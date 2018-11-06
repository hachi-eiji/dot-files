echo 'install homebrew'
DOTFILE_DIR="$HOME/github.com/hachi-eiji/dot-files"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir $HOME/.config

brew doctor

brew install cmake \
  tmux reattach-to-user-namespace \
  mosh \
  tig \
  hub \
  editorconfig \
  direnv \
  rbenv ruby-build \
  pyenv pyenv-virtualenv \
  nodenv

rbenv init
pyenv init
nodenv init

brew tap universal-ctags/universal-ctags
brew install universal-ctags

brew tap peco/peco
brew install peco
ln -s $DOTFILE_DIR/.config/peco $HOME/.config
