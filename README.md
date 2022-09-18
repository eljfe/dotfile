# Why
Tired of screwing up config settings.  There was an incident...


# git Setup Adventures


## The Steps
1. set it up locally 
2. set it up on github
3. sync everything

### 1. set it up locally


1.1 create a home/working directory  
`git init --bare $HOME/.dotfilerepo/.git`
   
1.2 zsh alias in rc  

```.zshrc
dotfile() { 
	git --git-dir="${HOME}/.dotfilerepo/.git/" --work-tree="$HOME" "$@" ; 
}
```
This function just alias all your git commands.

1.3 this flags then repo (for what it does I do not know)   
`dotfile config --local status.showUntrackedFiles no`


### 2. set it up on git hub

2.1 log in
2.2 create repo  
> Repositories > New > [fill in the form]

![](https://user-images.githubusercontent.com/45724186/161364445-9675e394-7c7f-477b-a50d-4d40c83eed2d.jpeg)


### 3. sync everything
This was the hard part.  Ugh.

[Again](https://www.atlassian.com/git/tutorials/dotfiles)

If you havent already (`gmdf config --list`) register your github account with the local git.

```
git config --global user.name "eljfe"
git config --global user.email "jeff@passedpawn.com"
```

(still no sure but maybe you need to do this `gmdf` too?)

get the repo from github 

```
gmdf clone "https://github.com/eljfe/dotfiles.git"
```

is it working?

```
gmdf status
```

add/commit a file with note

```
gmdf add .zshrc
gmdf commit -m "Add vimrc"
gmdf push
```

`gmdf push` will prompt for a password **You need the PIN you made in step 2 at github**

----

### References

- My main guy [Yet another ...](https://dev.to/nimai/yet-another-guide-on-backing-up-dotfiles-3be6)
- The [general Idea](https://www.atlassian.com/git/tutorials/dotfiles) here. A few lines of code to set up a thing locally.
- [Somewhat useful](https://gist.github.com/mindplace/b4b094157d7a3be6afd2c96370d39fad) this walks you through the process of working with a little repo
- Also this [video](https://www.youtube.com/watch?v=0Rb8LXftWDk)

