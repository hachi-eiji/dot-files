# source peco
#
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^x^r' peco-select-history

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^x^@' peco-cdr

function peco-git-checkout-b(){
  local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/remotes | \
      perl -pne 's{^refs/(heads|remotes)/}{}' | \
      peco)
  if [ -n "$selected_branch" ]; then
      BUFFER="git checkout -t ${selected_branch}"
      zle accept-line
  fi
  zle clear-screen
}
zle -N peco-git-checkout-b
bindkey '^g^b' peco-git-checkout-b

function peco-git-vim (){
  local selected_file=$(git ls-files | peco)
  if [ -n "$selected_file" ]; then
    BUFFER="vim $selected_file"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-git-vim 
bindkey '^x^f' peco-git-vim


function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-branches
bindkey '^x^b' peco-git-recent-branches

function peco-git-recent-all-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads refs/remotes | \
        perl -pne 's{^refs/(heads|remotes)/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout -t ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-recent-all-branches
bindkey '^xb' peco-git-recent-all-branches
