fpath=($fpath $HOME/.zsh-functions/)

autoload -U compinit && compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# ディレクトリ名を入力するだけで移動
setopt auto_cd
# 同じ高さのディレクトリに移動するときに../打たなくてよい
cdpath=(.. ~)
# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd
# コマンド訂正
setopt correct
# 補完候補を詰めて表示する
setopt list_packed
# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# share
setopt share_history
setopt hist_no_store
# 重複を記録しない
setopt hist_ignore_dups

function print_known_hosts (){ 
if [ -f $HOME/.ssh/known_hosts ]; then
cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1 
fi
}
_cache_hosts=($( print_known_hosts ))

## source peco function
source $HOME/.peco_function.zsh

# vim config 
# add .bash_profile
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export SHELL='/bin/zsh'
# User configuration
export GOPATH=$HOME/.go/current
export PATH=$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin
#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# export MANPATH="/usr/local/man:$MANPATH"
path=(
    /opt/*/(s|)bin(N-/)
    $path
)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8"

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias t='tmux'
alias ta='tmux a'
alias tl='tmux list-sessions'
alias ls='ls -G'
test -e ~/.tmuxinator/tmuxinator.zsh && source ~/.tmuxinator/tmuxinator.zsh

# hub setting
function git(){hub "$@"}
