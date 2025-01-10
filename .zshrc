#load the auto completion 
autoload -U compinit; compinit

#load the zmv module
autoload zmv

autoload zcalc

#use menu completions
zstyle ':completion:*' menu select=1

#Cache completion results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcach

#Where to save history and how much to keep
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.history
export NODE_PATH=/usr/local/lib/node_modules
setopt hist_ignore_dups # ignore same commands run more than once
setopt appendhistory    # don't overwrite history
setopt auto_pushd # cd - TAB history

DIRSTACKSIZE=${DIRSTACKSIZE:-20}
dirstack_file=${dirstack_file:-${HOME}/.zdirs}

if [[ -f ${dirstack_file} ]] && [[ ${#dirstack[*]} -eq 0 ]] ; then
  dirstack=( ${(f)"$(< $dirstack_file)"} )
  # "cd -" won't work after login by just setting $OLDPWD, so
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_dirpersist
chpwd_dirpersist() {
  if (( $DIRSTACKSIZE <= 0 )) || [[ -z $dirstack_file ]]; then return; fi
  local -ax my_stack
  my_stack=( ${PWD} ${dirstack} )
  builtin print -l ${(u)my_stack} >! ${dirstack_file}
}


#Set my prompt up
#export PS1="%m:%/% > "
export PS1="%F{blue}%B%m%b%f:%2~%B>%b"
export PS2="> "

#set up $PATH 
typeset -U path
path=(
	$HOME/bin
	/bin	
	/sbin
	/usr/bin
	/usr/sbin
	/usr/X11R6/bin
	/usr/local/bin
	/usr/local/sbin
	/usr/games
	~/.local/share/coursier/bin
        ~/.cargo/bin
	.
	$path
)

#if we're running on OpenBSD set PKG_PATH and set TERM properly
if [ X"$(uname)" = X"OpenBSD" ]; then
  #site="ftp.public-internet.co.uk/pub/OpenBSD/"
  site="http://mirror.ox.ac.uk/pub/OpenBSD"
  site="https://mirror.bytemark.co.uk/OpenBSD"
  version=`uname -r`
  arch=`uname -m`
  export PKG_PATH="$site/$version/packages/$arch/"
  export TERM=xterm-color	
fi

#export JAVA_HOME=/usr/local/java

alias ..="cd .."
alias vi="vim"
alias l="ls -lah"
alias suod="sudo"
alias mountipod="sudo mount /dev/sdc2 -o rw,user,gid=100,umask=003 /tmp/pod"
alias unmountipod="sudo umount /tmp/pod"
alias grep="egrep --color=auto"
alias ppv="puppet parser validate"
alias pull='git pull'
alias gs='git status'
alias gb='git branch'
alias gd='git diff'
alias push='git push'
alias bers='bundle2.0 exec rake syntax'
alias be='bundle2.0 exec'
alias scpme="echo -n $HOSTNAME; echo -n ':'; readlink -f"
alias gdb="gdb -q"
alias tf="terraform"
alias ema="emacs"
alias ls="ls --color"
alias mkpyvenv="python3 -m venv venv && source venv/bin/activate && rehash"

# What else! 
export EDITOR=emacs

# use this so that ? and ?? works nicely in ipython
export PAGER="/usr/bin/less -R"

# dont use a pager fopr systemctl
export SYSTEMD_PAGER=''

# some colours for grep
export GREP_COLORS='0;31'

# Disable console beep
#xset -b
#xset b off

# setup ls colours as opensuse (dircolors)
LS_COLORS='di=01;37:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.ogv=01\:35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'; 

# tmux on RHEL5.5 needed this
#set -o emacs

# Strip .svn file  from current directory
#function stripdotsvn 
#{
#    find . -name .svn -type d -print0 | xargs -0 rm -rf
#}

#disable ctl-s and ctl q flow control.  
stty -ixon

# get all those lovely colours test with tput color
#export TERM=xterm-256color	

# set the xterm title
precmd () {print -Pn "\e]0;%n@%m: %~\a"}
preexec () { print -Pn "\e]0;$1\a" }


setxkbmap -option ctrl:nocaps

# Alt-{left,right}  
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

