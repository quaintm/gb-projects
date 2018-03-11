# Setting up Mac for python, Java, fish, and misc niceness

### Tools that make life better

install from sites:

* Sublime Text
* iTerm 2
* PyCharm

### Install homebrew (installation will download xcode):

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Getting Java to work
Download Java from the oracle website

Download the java SE development kit:

   Java 7:  http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
   
   Java 8:  http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

### Getting mysql and the python connector to work
install xcode from app store and accept user agreement

get command line tools from here: https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-
   
    brew install mysql
    pip install MySQL-python

### Making fish the default shell

    brew install fish
    
add fish path to /etc/shells file:

    /usr/local/bin/fish

to change shell to fish, run:

    chsh -s /usr/local/bin/fish
    
mkdir ~/.config/fish and move config.fish file into that dir

Getting fish to work with conda requires adding new conda activation scripts and then sourcing, so add the following line to ~.config/fish/config.fish file (should be in there already):

    source $HOME/anaconda2/etc/fish/conf.d/conda.fish
    
### Getting python to work (using the anaconda distro)

Install Anaconda for python version management:

    https://conda.io/docs/user-guide/install/download.html

put conda into the fish path:

    set fish_user_paths $fish_user_paths ~/anaconda2/bin

to create a conda env:
    
    conda create --name pydev python=2.7.13 scipy
    conda install --name pydev pip

to active a conda env:

    conda activate pydev

### Simlinking Sublime's CLI function
    
Simlink the subl command:

    ln -s "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

Add to fish path:

    set fish_user_paths $fish_user_paths /usr/local/bin

### Setting up git and Github

Generate new ssh key for github:

    https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/

Add to ~/.gitconfig:

    [alias]
        undo-commit = reset --soft HEAD^
        poh = push origin HEAD

To make github use your keychain, add to ~/.ssh/config file:

    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa

### Misc Mac setup

In system prefs > keyboard > input, select tab and spacebar to move for all controls

Fix trackpad sensitivity
