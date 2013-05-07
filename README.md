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
