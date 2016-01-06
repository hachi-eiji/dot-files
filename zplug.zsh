# see https://github.com/b4b4r07/zplug
source ~/.zplug/zplug

zplug "hachi-eiji/dot-files", of:.zshrc

zplug "plugins/git", from:oh-my-zsh, if:"which git"
zplug "themes/hachi", from:oh-my-zsh

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose
