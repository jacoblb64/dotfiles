# plugins=(
#  docker
#  docker-compose
#  npm
#  nvm
#  git
#  thefuck
#  zsh-autosuggestions
#  osx
#  appup
#  zsh-iterm-touchbar
#  zsh-syntax-highlighting
# )

# docker shortcuts
alias dc="docker-compose"
alias follow="dc logs --follow --tail=30"

refollow() {
	dc restart $1 $2 $3 $4 $5 $6 $7 $8 $9
	follow $1 $2 $3 $4 $5 $6 $7 $8 $9
}

alias f="fuck -y"

alias bfg="java -jar ~/bfg.jar"
alias sl="script-list"

# git shortcuts
alias cleanbranches="git branch | grep -v 'development\|*' | xargs git branch -D"

branch() {
	git branch | sed "$1!d"
}

curbranch() {
	git rev-parse --abbrev-ref HEAD
}

# fzf functions

fbr() { # https://github.com/junegunn/fzf/wiki/examples
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbro() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# export personal settings
export EDITOR=rsubl
export PATH=~/bin:$PATH

# evals and other config required by plugins
eval $(thefuck --alias)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
