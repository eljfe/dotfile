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


# {{{ DOTFILEREPO SETTINGS
# fancy config file footwork.                                                   
# this is very important for making the current setup work.                     
# the current setup = all `zsh`, `vim` and `kitty` .*rc's and                   
# packages are moved into a shared directory on each machine.                   
# Too many machines, too many users (14 at the time of this writing - 2023.07)  

container_test ()
{
  hn=$(echo $(hostname))
  if [[ $hn == *"container"* ]]; then
    echo 1
  else
    echo 0
  fi
}

os=$(uname)
if [[ $os == "Darwin" ]]; then
	osrc="/Users/Shared/.config/zsh/.macrc" 
elif [[ $os == "Linux" ]]; then
  if [[ $(container_test) == 1 ]]; then
    osrc="${HOME}/.zsh/.containerrc" 
  else 
    osrc="/srv/dotfile/.config/zsh/.linuxrc" 
  fi
else
  echo "unknown os! ... $os"
fi
source "$osrc"
# unset os                                      


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

# for use with pass the password store's autocompletion
autoload -Uz compinit && compinit
#}}}
#}}} 

#{{{ ALIASES
# NOTE $ZDOTDIR is set in /etc/.zshenv or /etc/zsh/.zshenv
# it is a very important setting for enabling the 
#    git dotfile repo/ one per machine setup

alias v=vim
alias gh="grephist"
alias dict="dictionary_lookup" 			# online english dictionary lookup
alias sqlite="sqlite3 -header -column"
alias nvim="env -u VIMINIT nvim" 				# escapes VIMINIT and allows
												#   nvim to run w/o vim settgs

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


#{{{ FUNCTIONS
dictionary_lookup() {
	# there are many interesting dictionaries to choose from 
	# including `jargon` or `fd-fra-eng` which translates french to english
	# or even `devil` 200yr old Devil's dictionary :-)
	echo dict://dict.org/d:{$1}:english
	curl dict://dict.org/d:{$1}:english
}
grephist() {
	grep "$1" ~/.zsh_history
}
#}}}

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


#{{{ RUST config
if [ -z "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env" 
fi
#}}}
