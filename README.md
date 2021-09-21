dotvim
======

.vim folder backups

Includes .vimrc and plugins as submodules

## Extra Requirements 

* Figlet
```
brew install figlet
```

* Toilet
```
brew install toilet
```


Installation
------------
To setup the vim environment on another machine:

    cd ~
    mkdir -p ~/.vim (make the dir if it doesn't exist)
    git clone http://github.com/decoderling/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule update --init


Adding plugins as submodules
----------------------------
    cd ~/.vim
    git submodule add <URL to git repo> bundle/<name of plugin>
    git add .
    git commit


Updating a single plugin
------------------------
    cd ~/.vim/bundle/<name of plugin>
    git pull origin master


Updating all plugins
--------------------
    git submodule foreach git pull origin master


