dotvim
======

`.vim` folder setup for how I like to use it

Includes a `vimrc` file that is meant to be used as the main configuration file.

## Basic Usage

1. Clone this repo into `~/.vim`
  ```
    cd ~
    mkdir -p ~/.vim
    cd ~/.vim
    git clone <this repo>
  ```
2. `ln -s ~/.vim/vimrc ~/.vimrc`
3. Open Vim

### Extra Requirements 

**NOTE**: This is to use ASCII and Border commands to have text visuals.

#### Text Visual Keymaps

```
<leader>f? - Converts text to ASCII specified
<leader>F - Converts text to standard ASCII
<leader>f - Converts text to small ASCII
<leader>Fb - Converts text to standard ASCII with border
<leader>fb - Converts text to small ASCII with border
<leader>b - Adds a border around a selection
```

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
Installation of Vim plugins is simple. Just open vim (with or without a file) and it will install `vim-plug` and the suggested plugins.


Adding plugins 
--------------
1. Edit `~/.vim/vimrc`
2. Look for the following text block
  ```
    " =================================
    " ------[ BEGIN add plugins ]------
    " =================================
  ```
3. Add the plugin of your choice, see [reference](https://github.com/junegunn/vim-plug) for more specifics



Updating all plugins
--------------------
Updating plugins can be done within Vim by running the following:
```
  :PlugInstall
```


