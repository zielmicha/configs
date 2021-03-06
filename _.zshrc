# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1

set -k # interactive comments
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
export WORDCHARS=''

autoload -U colors && colors
fg[purple]=$'\e[0;35m'
#git_super_status() {}

. ~/.zsh/git-prompt/zshrc.sh
setopt PROMPT_SUBST
#export RPROMPT='$(git_super_status)'
if [[ $UID = 0 ]]; then
   export PROMPT="%{$fg[red]%}%m%{$reset_color%} %{$fg[purple]%}%~%{$reset_color%}] "
else
   _hostname=$(</etc/hostname)
   if [[ $_hostname =~ '\.' ]]; then
      export PROMPT='%{$fg[cyan]%}%n@%m%{$reset_color%} %{$fg[purple]%}%~%{$reset_color%}$(git_super_status)] '
   else
      export PROMPT='%{$fg[green]%}%n%{$reset_color%} %{$fg[purple]%}%~%{$reset_color%}$(git_super_status)] '
   fi
fi

#export PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
#export PS1='[%T] %n@%m:%~# '
REPORTTIME=10

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PROMPT_COMMAND="history -a; history -n"
export SDL_VIDEO_X11_DGAMOUSE=0
export SSH_ASKPASS=ssh-askpass

alias apt="sudo apt install"
alias apt-search="apt-cache search"
alias ..="cd .."
alias ls="ls --color"
alias mv="mv -i"
alias cp="cp -i"
alias l=ls
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias ocen="/home/michal/algo/ocen/ocen"
alias grep="grep --color=auto"
alias py="/usr/bin/ipython --no-confirm-exit --no-banner"
alias py3="ipython3 --no-confirm-exit --no-banner"
alias pyjvm="~/pyjvm/pyjvm"
alias sl=ls
alias sls=ls
alias lss=ls
alias ks=ls
alias sk=ls
alias lks=ls
alias pidgin="pidgin -f"
alias ack="ack-grep"

_mopen() {
	for i in "$@"; do
		echo "$i"
		xdg-open "$i" &>/dev/null &!
	done
}
alias open=_mopen

# base
export PATH="$PATH:$HOME/bin:/usr/sbin:/sbin"
# Nim
export PATH="$PATH:$HOME/.nimble/bin:$PATH:$HOME/apps/nim/bin"
# Android
export PATH="$PATH:$HOME/apps/android-sdk-linux/tools:$HOME/apps/android-sdk-linux/platform-tools:$HOME/apps/android-ndk-r9"
# depot_tools
export PATH="$PATH:$HOME/apps/depot_tools"
# robocore
export PATH="$PATH:$HOME/husarion/robocore-current/tools/amd64-linux"

export USE_CCACHE=1

autoload -U select-word-style
select-word-style bash

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export LD_LIBRARY_PATH=/usr/local/lib

#source ~/.zsh/zbell.sh

[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
[[ -e /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh ]] \
   && source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh


alias vi=vim
alias nano="emacs -nw -q -l ~/.emacs.d/nano.el"

export LLVM=$HOME/clang/bin
export SDL_VIDEO_FULLSCREEN_HEAD=0
export SDL_VIDEO_X11_DGAMOUSE=0

precmd () {print -Pn "\e]0;%n@%m: %~\a"}

alias ncr='nim c -r --verbosity:0'



x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xsel -i
}
zle -N x-copy-region-as-kill
x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | xsel -i
}
zle -N x-kill-region
x-yank () {
  CUTBUFFER=$(xsel -o </dev/null)
  zle yank
}
zle -N x-yank
bindkey -e '\eW' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank

#export ARDUINO_DIR=/home/sudar/apps/arduino-1.0.5
export ARDMK_DIR=/home/michal/apps/Arduino-Makefile
export AVR_TOOLS_DIR=/usr

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;$PWD\a"}
        preexec() {print -Pn "\e]0;$PWD: $2\a"}
        ;;
esac

export GOROOT=$HOME/apps/go

#alias find=findfix
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox

export ANDROID_HOME=/home/michal/apps/android-sdk-linux

enableqt() {
     export PATH="/home/michal/apps/Qt/5.4/gcc_64/bin:/home/michal/apps/Qt/Tools/QtCreator/bin:$PATH"
     rehash
}

hibernate() {
    i3lock
    sudo pm-suspend
    setxkbmap -layout pl
    xmodmap ~/.xmodmap
}

set_backlight() {
    sudo env VALUE="$1" python <<'EOF'
import os
v1 = int(os.environ['VALUE'])
p='/sys/class/backlight/intel_backlight/'
v = int(open(p + 'max_brightness').read().strip())
with open(p + 'brightness', 'w') as f:
     f.write(str(int(v * v1 / 100)))
EOF
}

retryssh() {
     while true; do
         ssh "$@"
         sleep 1 || break
     done
}

export DART_FLAGS='--checked'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source ~/configs/_.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


. /home/michal/rnn/torch/install/bin/torch-activate
