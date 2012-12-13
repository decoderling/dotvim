dotvim
======

.vim folder backups

Includes .vimrc and plugins as submodules

Installation
------------
To setup the vim environment on another machine:

    cd ~
    mkdir -p ~/.vim (make the dir if it doesn't exist)
    git clone http://github.com/decoderling/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

