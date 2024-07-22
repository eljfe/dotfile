# `za` to toggle a fold
# `zo` to open; `zc` to close a fold
# `zr` to open all folds, `zm` to close them

#{{{ GLOBALVARS
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

#{{{ LOCATION SETTINGS
export LANGUAGE=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8
export LANG=en_CA.UTF-8
export LC_TYPE=en_CA.UTF-8
# }}}

INSERT_MODE_INDICATOR="%F{yellow}+%f" # changes cursor to a yellow |
HIST_STAMPS="yyyy-mm-dd"
export CLICOLOR="Yes"

# {{{ PROMPT
export RPROMPT='%F{124}%*%f'
hn=$(hostname)
# this line creates a 6 line bottom gutter so you aren't always typing 
# ... in the bottom cm of the screen.  6 newlines, and `/e[6A` apparently
# ... bumps the prompt back up by 6.
# ... fine but IT DOESN'T WORK.  FSR it eats commands.  Try `whoami` or `pwd`
# PS1=$'\n\n\n\n\n\e[6A'
# basic shared prompt
PS1=$'%F{243}%n@%m%f %F{192}%1~%f '
if [[ $hn == "mac-office.shevy-lan" ]]; then
    export PS1="$PS1\U1F332 "
elif [[ $hn == "asus-laptop" ]]; then
    export PS1="$PS1\U1F4A5 "
elif [[ $hn == "sherrysmbp" ]]; then
    export PS1=$PS1"🐌 "
elif [[ $hn =~ "homeoffthership.*" ]]; then
	export PS1=$PS1"🌲 "
elif [[ $hn == "pihole" ]]; then
    export PS1=$PS1"🥧 "
elif [[ $hn == "obsequious" ]]; then
    export PS1=$PS1"🧅 "
else
    export PS1="$PS1🌭 "
fi
# }}}

# {{{ DOTFILEREPO SETTINGS
# fancy config file footwork.                                                   
# this is very important for making the current setup work.                     
# the current setup = all `zsh`, `vim` and `kitty` .*rc's and                   
# packages are moved into a shared directory on each machine.                   
# Too many machines, too many users (14 at the time of this writing - 2023.07)  
os=$(uname)                                                                     
if [[ $os == "Darwin" ]]; then                                                  
	osrc=".macrc" 
	export DOTFILES='/Users/Shared/.config'                                     
	source "$DOTFILES/zsh/$osrc"
elif [[ $os == "Linux" ]]; then                                                 
	osrc=".linuxrc" 
	export DOTFILES='/srv/dotfile/.config'                                      
	source "$DOTFILES/zsh/$osrc"
else                                                                            
    echo "unknown os! ... $os"                                                  
fi                                                                              
# unset os                                      

export VIMINIT="source $DOTFILES/vim/.vimrc"                                    
export KITTY_CONFIG_DIRECTORY="$DOTFILES/kitty"                                 

# $gitbin set in $osrc
git-dotfile() { 
	$gitbin --git-dir="${DOTFILES}/.git/" \
		--work-tree="$DOTFILES" "$@" ; 
}
# }}}

# PATH variables in $osrc

# {{{ PROGRAMMING VARIABLES
# see $osrc
#}}}

# {{{ ZSH COMMANDLINE BEHAVIOURS
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space
# }}}

# {{{ HISTORY SETUP
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
# }}}

# {{{AUTOCOMPLETION
# initialize autocompletion
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
#}}}
#}}} 

#{{{ ALIASES
# NOTE $ZDOTDIR is set in /etc/.zshenv or /etc/zsh/.zshenv
# it is a very important setting for enabling the 
#    git dotfile repo/ one per machine setup

alias v=vim
alias vz="vim $ZDOTDIR/.zshrc"
alias sz="source $ZDOTDIR/.zshrc"
alias vv="vim $DOTFILES/vim/.vimrc"
alias pingpi="ping 192.168.2.200"
alias sshpi="ssh eljfe@192.168.2.200"
alias sshob="ssh eljfe@obsequious.shevylan" 	# obsequious.local breaks
alias pingpi45="ping 192.168.2.45"
alias sshpi45="ssh eljfe@192.168.2.45"
alias scanlocal="nmap -sn 192.168.2.0/24"
alias sshjs="ssh u52305743@home276229807.1and1-data.host"

# kitty specific 
# if [[ -n $TERM && "xterm-kitty" == $TERM  ]]; then
#   alias ssh="kitty +kitten ssh"
# fi

# https://sw.kovidgoyal.net/kitty/shell-integration/#manual-shell-integration
# pihole fail
if test -n "$KITTY_INSTALLATION_DIR"; then
	    export KITTY_SHELL_INTEGRATION="enabled"
		    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
			    kitty-integration
				    unfunction kitty-integration
fi
# }}}

#{{{ BIND KEYS

# NOTE: these mapping are all macOS specific
# autocompletion using arrow keys (based on history)
# 
# NOTE: an easy way to test on you test on your system is to run
#       `cat <ENTER>` 
#       this will leave the console waiting for keyboard input.
#       type the keys you want to know the unicode for and it will
#       helpfully echo unicode to the console
#       `Ctl-c` to bounce out of the `cat` command

# 2024-06 bit sure these are relevant
# bindkey "^[[1;3D" backward-word
# bindkey "^[[1;3C" forward-word
# 
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward


#}}}

#{{{ PLUGINS

#{{{ zsh-vi-mode
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_VI_SURROUND_BINDKEY='classic'
#}}}

#}}}

#{{{ 3RD PARTY APP INTEGRATION

# for use with pass the password manager
# fpath=(/opt/local/share/zsh/site-functions $fpath)

#}}}

#{{{ some old junk

#}}}
