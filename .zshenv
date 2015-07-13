if [ -d ${HOME}/.rbenv  ] ; then
  PATH=${HOME}/.rbenv/shims:${PATH}
  export PATH
  eval "$(rbenv init -)"
fi
