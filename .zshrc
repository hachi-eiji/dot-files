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

# nodejs setting
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# vim config 
# add .bash_profile
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export SHELL='/bin/zsh'
# User configuration
export GOPATH=$HOME/.go/current
export GOROOT=/usr/local/opt/go/libexec
export PATH=$HOME/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH:$GOPATH/bin:$GOROOT/bin
#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if type docker-machine > /dev/null 2>&1 ; then
 eval "$(docker-machine env default)"
fi

# export MANPATH="/usr/local/man:$MANPATH"
path=(
    /opt/*/(s|)bin(N-/)
    $path
)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8 -Dsun.jnu.encoding=UTF-8"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias tmux='tmux -u'
alias t='tmux'
alias tad='tmux a -d -t'
alias tl='tmux list-sessions'
alias ls='ls -G'
alias grum='git fetch upstream && git rebase upstream/master'
test -e ~/.tmuxinator/tmuxinator.zsh && source ~/.tmuxinator/tmuxinator.zsh

export COMPANY_DOT_FILE="/Users/a12390/development/ghe.ca-tools.org/hachiya-eiji/ca-dot-file"
test -e $COMPANY_DOT_FILE/env.sh && source $COMPANY_DOT_FILE/env.sh

# hub setting
#alias git='hub'

# ctr-sがきかない対策
stty -ixoff
stty stop undef
stty start undef

## cdr system stuff.
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
zstyle ':filter-select' case-insensitive yes 
typeset -U name_of_the_variable

# The next line updates PATH for the Google Cloud SDK.
GCP_ZSH="$HOME/google-cloud-sdk/path.zsh.inc"
test -e $GCP_ZSH && source $GCP_ZSH

# The next line enables shell command completion for gcloud.
GCP_COMP="$HOME/google-cloud-sdk/completion.zsh.inc"
test -e $GCP_COMP && source $GCP_COMP
