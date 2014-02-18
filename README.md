dot-files
=========

my mac dot files

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
```

## install mosh
```
brew install mosh
```

## install tig
```
brew install tig
```

## install Ricky
```
cd /tmp
brew tap sanemat/font
brew install ricty
## このへんはコマンドに出てくる
cp -f /usr/local/Cellar/ricty/3.2.2/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf
```
