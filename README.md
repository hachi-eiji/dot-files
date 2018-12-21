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

install homebrew package
--

```
./install_brew_package.sh
```

install tmux
--

```
gem install tmuxinator

```

install vim vundle
--

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s <repository>/.vimrc.lightline ~/.vimrc.lightline
```

install Ricky
--

```
$ brew tap sanemat/font
$ brew install --powerline --vim-powerline ricty
$ cp -f /usr/local/Cellar/ricty/4.0.1/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
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

install pyenv
---

```
CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" \
LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7-dev
pyenv-virtualenv
```

install phpenv
---

```
git clone --depth 1 https://github.com/CHH/phpenv.git /tmp/
cd /tmp/phpenv/bin
./phpenv-install.sh
```
