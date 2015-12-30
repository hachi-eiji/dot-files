dot-files
=========

my mac dot files

at first 
```
export DOT_FILE_PATH=""
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
brew install tmux
gem install tmuxinator

```

install ctag
--

```
# install ctags
brew install ctags
# remove original ctags
sudo mv /usr/bin/ctags /usr/bin/ctags.org
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
cd /tmp
brew tap sanemat/font
brew install ricty
## このへんはコマンドに出てくる
cp -f /usr/local/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
# patch for vim lightline
git clone git@github.com:Lokaltog/vim-powerline.git
cd vim-powerline/fontpatcher
fontforge -lang=py -script fontpatcher ~/Library/Fonts/Ricty-Bold.ttf
fontforge -lang=py -script fontpatcher ~/Library/Fonts/Ricty-Regular.ttf
mv Ricty* ~/Library/Fonts
```

install peco
--

```
brew tap peco/peco
brew install peco
mkdir -p $HOME/.config/peco
ln -s $HOME/.config/peco .config/peco/config.json
```

install zplug
--

```
curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
ln -s $DOT_FILE_PATH/zplug.zsh $HOME/.zshrc
source $HOME/.zshrc
ln -s ln -s $DOT_FILE_PATH/hachi.zsh-theme $HOME/.zplug/repos/robbyrussell/oh-my-zsh/themes/
source $HOME/.zshrc
```

install hub
--

https://github.com/github/hub

```
brew install --HEAD hub
ln -s $DOT_FILE_PATH/.zsh-functions $HOME/.zsh-functions
```

install nvm
--

```
brew install nvm
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
