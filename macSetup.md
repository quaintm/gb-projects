## Setting up Mac for python, Java, fish, and misc niceness

###Programs that make life better
install from sites:
* Sublime Text
* iTerm 2
* PyCharm

###Install homebrew (installation will download xcode):

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
###Install Anaconda for python version management:

    https://conda.io/docs/user-guide/install/download.html

###Getting Java to work
Download Java from the oracle website

Download the java SE development kit:

   Java 7:  http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
   Java 8:  http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

###Getting mysql and the python connector to work
install xcode from app store and accept user agreement

get command line tools from here: https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-
   
    brew install mysql
    pip install MySQL-python

###Making fish the default shell

    brew install fish
    
add fish path to /etc/shells

    run chsh -s /usr/local/bin/fish
    
config file goes in ~/.config/fish

Getting fish to work with conda requires adding new conda activation scripts and then sourcing,
add the following line to ~.config/fish/config.fish :

    source $HOME/.config/fish/conda.fish
    
###Getting python to work (using the anaconda distro)

Download and install conda

put conda into the fish path:

    set fish_user_paths $fish_user_paths ~/anaconda/bin

###Rename the package for Sublime Text 2 in Applications to Sublime
In ~.config/fish/ add the file config.fish
    
Simlink the subl command:

    ln -s "/Applications/Sublime.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

Add to fish path:

    set fish_user_paths $fish_user_paths /usr/local/bin

Add to ~/.gitconfig:

    [alias]
        undo-commit = reset --soft HEAD^
        poh = push origin HEAD

To make github use your keychain, add to ~/.ssh/config file:

    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa

###Misc Mac setup
In system prefs > keyboard > input, select tab and spacebar to move for all controls
