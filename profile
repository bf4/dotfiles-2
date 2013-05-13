
alias _="sudo"
alias x="exit"
alias X="x"

PATH=$PATH:$HOME/bin:node_modules/.bin/:/usr/local/bin/:/usr/local/n/versions/0.6.7/bin
PATH=$PATH:/usr/local/share/python

alias m8.="mate ."

# srsly Apple, why?
alias ci="echo 'someday maybe: uninstall RCS' ; git ci $*"

# apps
alias chrome="open -a Chrome"
alias firefox="open -a Firefox"
alias quicktime="open -a QuickTime\ Player $1"
alias safari="open -a Safari"

# maybe give this a shot later; eliminates duplicates in history
# export HISTCONTROL=erasedups

# use vi as line editor
# activate: set -o vi
# deactivate: set +o vi

# prompt

function this() { # obtain git branch
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function blam() {
  git push origin $(this)
}


# rvm-prompt snippet from http://rvm.beginrescueend.com/workflow/prompt/
export PS1="\[\033[0;34m\]<airbook:\u> \[\033[0;32m\][\$(date +%m-%d\" \"%H:%M)]\[\033[0m\] \[\033[0;36m\]\w\[\033[0m\] \[\033[0;32m\]\$(this)\[\033[0m\]\[\033[0;31m\]\n \$(~/.rvm/bin/rvm-prompt) \[\033[0m\] \n\[\033[0;34m\] ↪ \[\033[0m\] "
# export PS1="\[\033[0;34m\]<airbook:\u> "

# general
alias 3001="mongrel_rails start -d -p 3001"
alias a?="ack $1"
alias ar?="ack --ruby --follow $1"
alias br?="git br | g? $1"
alias cool="lame $*" # srsly, who names their project "lame"? wtf?
alias g?="grep"
alias h="history"
alias hosts="_ vi /etc/hosts"
alias jtd="ruby /Users/giles/bin/journal_today.rb"
alias network_alive?="ping google.com"
alias n?="network_alive?"
alias ll="ls -lhFa"
alias p?="password -? $1"
alias .p="source /Users/giles/.profile"
alias password?="password -? $1"
alias rake?="rake -T | g? $1"
# slicehost scp: scp -P 23532 [path] admin@67.23.3.57:[path]
# alias spex="spec spec"
alias x="exit"
alias X="x"

function h?() {
  history | grep $*
}

function ps?() {
  ps ax | grep $*
}

alias zap="amazon -b giles $1"
# the other half of this is blogdir, and an ~/Uploads dir

git_grep() { git log -p -S$1; }

# tab completion for ssh hosts
# http://drawohara.tumblr.com/post/6584031
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
cut -f 1 -d ' ' | \
sed -e s/,.*//g | \
uniq | \
egrep -v [0123456789]) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh

# how to do mysql imports
# mysql -uusername -p databasename < file.sql 

# search Gmail THIS WAY, not by going to the Inbox
# (possible this doesn't work any more)
search_gmail() {
  open "https://mail.google.com/mail/u/0/#search/$*"
}


# how to find apache on Snow Leopard
# /etc/apache2/other/git.conf
# _ /usr/sbin/apachectl graceful

gem_src() {
  # I now use rbenv so will probably use "pushd $(gem env gemdir)" instead
  pushd ~/.rvm/gems/`rvm-prompt | sed -e s/\@/\\\\\@/`/gems
}
# you can also do "bundle open gem_name"
export EDITOR="vi"


# ugh
# http://yehudakatz.com/2011/05/30/gem-versioning-and-bundler-doing-it-right/
alias be="bundle exec $*"
alias brake="be rake"
alias brake?="brake -T | g? $1"


# git undo: git reset --hard commit_sha
# where commit_sha is the last valid commit prior to fucking up

# aaargh /usr/local/var/mysql

# it happens
function tgit() {
  git $*; echo 'have some coffee'
}

# typo
alias rpsec="rspec"

# open any man page as a PDF
# (mainly useful to see the page count! also good for sending to iPad)
function pdf_man() {
  man -t $* | open -f -a /Applications/Preview.app
}


function silencing_stderr() {
  $* 2>/dev/null
}

function silencing_stdout() {
  $* >/dev/null
}

function capturing_stderr() {
  $* 2>&1 >/dev/null 
}

function excerpt() {
  cut -d ' ' -f $*
}

# run "walk_later" whenever you sit down at the computer.
function walk_later() {
  $(sleep 1500 && say -v Victoria "walk for five minnutes") &
  $(sleep 1800 && say -v Victoria "done walking") &
}

# ...or this one
function stand_later() {
  $(sleep 1500 && say -v Victoria "stand up") &
}

# how to use sed to change a bunch of file and variable names throughout
# a code base very easily:
# sed -i '' s/StupidName/SmartName/g lib/*.rb spec/*.rb
# sed -i '' s/stupid_name/smart_name/g lib/*.rb spec/*.rb

# syncing to upstream remotes
# https://help.github.com/articles/syncing-a-fork

function symlink() {
  # first arg represents the real file
  # second represents the link name you want
  ln -s $1 $2;
}



function launch() {
  open -a "$1" && x
}


function hub_sync() {
  git co master &&
  git fetch --all
  git merge upstream/master &&
  git push origin master &&
  git st
}

