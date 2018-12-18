echo 'install homebrew'
DOTFILE_DIR="$HOME/github.com/hachi-eiji/dot-files"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

mkdir $HOME/.config

brew doctor

brew install zsh git \
  cmake \
  tmux reattach-to-user-namespace \
  mosh \
  tig \
  hub \
  editorconfig \
  direnv \
  rbenv ruby-build \
  nodenv \
  boost \
  pt \
  icu4c

rbenv init
nodenv init

brew tap universal-ctags/universal-ctags
brew install universal-ctags

brew tap peco/peco
brew install peco
ln -s $DOTFILE_DIR/.config/peco $HOME/.config

brew link icu4c
