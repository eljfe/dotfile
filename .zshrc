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

# location settings
export LANGUAGE=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8
export LANG=en_CA.UTF-8
export LC_TYPE=en_CA.UTF-8
export CLICOLOR="Yes"
export RPROMPT='%F{124}%*%f '
export PS1=$'%F{243}%n@%m%f %F{192}%1~%f \U1F344 '

# this PYTHONPATH setting requires `:` path seperators
export PYTHONPATH="$HOME/.local/lib/python-3x/site-packages"

KITTYPATH="/Applications/MacPorts/kitty.app/Contents/MacOS"
BUDGET_PATH="$HOME/Documents/Business/Financials/Budget"
PCFIN_PATH="$HOME/Documents/Business/Financials/PCFin"
LATEXPATH="/Library/TeX/texbin"
LVIMPATH="$HOME/.local/bin"

#lunarvim/npm local setup requirement
export PATH=$PATH:$HOME/.npm-global/bin

export PATH="/opt/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:\
/Library/Apple/usr/bin:$HOME/Library/Python/3.10/bin:$KITTYPATH:$LATEXPATH:\
$LVIMPATH"

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# AUTOCOMPLETION
# initialize autocompletion
zstyle ':completion:*' completer _extensions _complete _approximate

#}}} 

#{{{ LOCALVARS

INSERT_MODE_INDICATOR="%F{yellow}+%f" # changes cursor to a yellow |
HIST_STAMPS="yyyy-mm-dd"

#}}}

#{{{ ALIASES
alias ll='ls -laFG'
alias v=vim
alias vz="vim $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias vv="vim $HOME/.vimrc"
alias gmdf='/opt/local/bin/git --git-dir=$HOME/.mydotfiles/ --work-tree=$HOME'
alias lsp="ls -G | less -iXRS" 
alias pingpi="ping 192.168.2.200"
alias sshpi="ssh eljfe@192.168.2.200"
alias pingpi41="ping 192.168.2.45"
alias sshpi41="ssh pi@192.168.2.45"
alias scanlocal="nmap -sn 192.168.2.0/24"
alias sshjs="ssh u52305743@home276229807.1and1-data.host"
alias srcb="cd $BUDGET_PATH; source Budget-venv/bin/activate"
alias srcp="cd $PCFIN_PATH; source PCFin-venv/bin/activate"
alias ggit="/usr/local/bin/git"  # homebrew git

git-dotfile() { 
	ggit --git-dir="${HOME}/.config/dotfilerepo/.git/" \
		--work-tree="$HOME" "$@" ; 
}

git-python-utils() { 
	ggit --git-dir="${HOME}/.local/lib/.git/" \
		--work-tree="$HOME/.local/lib/" "$@" ; 
}

# kitty specific 
if [[ -n $TERM && "xterm-kitty"=$TERM  ]]; then
  alias ssh="kitty +kitten ssh"
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

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


#}}}

#{{{ PLUGINS

#{{{ zsh-vim-mode
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
#}}}

#}}}

#{{{ 3RD PARTY APP INTEGRATION

# for use with pass the password manager
fpath=(/opt/local/share/zsh/site-functions $fpath)

#}}}

#{{{ some old junk

# VIM mode
# bindkey -v
# export KEYTIMEOUT=1
# bindkey -M viins 'jk' vi-cmd-mode
# In zsh-vim-mode instruction


# Yank to the system clipboard
# thnx [https://stackoverflow.com/questions/61466461/yank-in-visual-vim-mode-in-zsh-does-not-copy-to-clipboard-in-ordert-to-paste-w/62141665#62141665]
# function vi-yank-xclip {
    # zle vi-yank
   # echo "$CUTBUFFER" | pbcopy -i
# }  
# 
# zle -N vi-yank-xclip
# bindkey -M vicmd 'y' vi-yank-xclip
#}}}
