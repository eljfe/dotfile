# Why
Tired of screwing up config settings.  There was an incident...


# git Setup Adventures


## The Steps
1. set it up locally 
2. set it up on github
3. sync everything

### 1. set it up locally

The [general Idea](https://www.atlassian.com/git/tutorials/dotfiles) here. A few lines of code to set up a thing locally.  

1.1 create a home/working directory  
`git init --bare $HOME/.mydotfiles`
   
1.2 create an alias that maps the git command to the new directory/repo (my alias stands for **G**it **M**y **D**ot **F**iles)  
`alias gmdf='/usr/bin/git --git-dir=$HOME/.mydotfiles/ --work-tree=$HOME'`

1.3 this flags then repo (for what it does I do not know)   
`gmdf config --local status.showUntrackedFiles no`

1.4 then the copy the alias into the shell rc file so it's always there.  
`nvim .zshrc`

That's it!  Now all together:  

	git init --bare $HOME/.mydotfiles  
	alias gmdf='/usr/bin/git --git-dir=$HOME/.mydotfiles/ --work-tree=$HOME'  
	gmdf config --local status.showUntrackedFiles no
	nvim .zshrc

### 2. set it up on git hub

2.1 log in
2.2 create repo  
> Repositories > New > [fill in the form]

![](https://user-images.githubusercontent.com/45724186/161364445-9675e394-7c7f-477b-a50d-4d40c83eed2d.jpeg)

Then generate the PAC (personal access token)... a temporary password.   

Go to your 
> picture (op right) > settings 

![](https://user-images.githubusercontent.com/45724186/161364449-ba3268e3-36d5-4438-b679-a3431cb1ced4.jpeg)

lower left

> Developer settings
 
![](https://user-images.githubusercontent.com/45724186/161364451-d9427656-cd7c-4599-af50-fbb86d83e19a.jpeg)

> Personal Access Key

![](https://user-images.githubusercontent.com/45724186/161364452-9d559284-44bf-45af-b408-852941d6b531.jpeg)

... and fill out the form.  I stale dated the PAC to last a month.

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

[Somewhat useful](https://gist.github.com/mindplace/b4b094157d7a3be6afd2c96370d39fad) this walks you through the process of working with a little repo

Also this [video](https://www.youtube.com/watch?v=0Rb8LXftWDk)

