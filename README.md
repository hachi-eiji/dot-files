dot-files
=========

my mac dot files

at first 
```
export DOT_FILE_PATH=""
git config --system user.name "name"
git config --system user.email "email"
brew install macvim --with-override-system-vim
```

install zsh
--

```bash
sudo vi /etc/shells
# add zsh pass
$ chsh
```

changing chsh

```diff
+ Shell: /bin/zsh
- Shell: /bin/bash
```

install brew 
--

```
ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)
brew doctor
```

install tmux
--

```
brew install tmux reattach-to-user-namespace
gem install tmuxinator

```

install ctag
--

```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

install vim vundle
--

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s <repository>/.vimrc.lightline ~/.vimrc.lightline
```

install mosh
--

```
brew install mosh
```

## install tig
```
brew install tig
```

install Ricky
--

```
$ brew tap sanemat/font
$ brew reinstall --powerline --vim-powerline ricty
$ cp -f /usr/local/Cellar/ricty/4.0.1/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```

install peco
--

```
brew tap peco/peco
brew install peco
mkdir -p $HOME/.config/peco
ln -s $HOME/.config/peco .config/peco/config.json
```

install oh-my-zsh
--

```
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
## remove link
rm ~/.zshrc
ln -s $DOT_FILE_PATH/oh-my-zsh.template ~/.zshrc
ln -s $DOT_FILE_PATH/hachi.zsh-theme ~/.oh-my-zsh/themes/hachi.zsh-theme
ln -s $DOT_FILE_PATH/.zshrc $ZSH_CUSTOM/my-zsh-config.zsh
ln -s $DOT_FILE_PATH/.peco_function.zsh $HOME/.peco_function.zsh
```

install rbenv
--
* https://github.com/rbenv/rbenv#homebrew-on-mac-os-x
* https://github.com/rbenv/ruby-build#installing-with-homebrew-for-os-x-users

install pyenv
--
* https://github.com/yyuu/pyenv#command-reference
* https://github.com/yyuu/pyenv-virtualenv

install nodenv
--
https://github.com/nodenv/nodenv#homebrew-on-mac-os-x

install hub
--

https://github.com/github/hub

```
brew install --HEAD hub
ln -s $DOT_FILE_PATH/dot-files/.zsh-functions $HOME/.zsh-functions
```

install editorconfig
--
```
brew install editorconfig
```

install direnv
--

```
brew install direnv
```
