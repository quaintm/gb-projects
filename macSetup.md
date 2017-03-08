## Setting up Mac for python, Java, fish, and misc niceness

###Programs that make life better
install from sites:
* Sublime Text 2
* iTerm 2
* PyCharm
* Sequel Pro (mysql)
* DBeaver (mysql, vertica)

###Getting Java to work
Download Java from the oracle website

Download the java SE development kit (7 is here):

http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)

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

###Making Sublime the default text editor
Rename the package for Sublime Text 2 in Applications to Sublime
In ~.config/fish/ add the file config.fish

Add the line to config.fish:

    setenv EDITOR Sublime
    
Simlink the subl command:

    ln -s "/Applications/Sublime.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

Add to fish path:

    set fish_user_paths $fish_user_paths /usr/local/bin

Add to ~/.gitconfig:

    [alias]
        undo-commit = reset --soft HEAD^
        poh = push origin HEAD

To make github use your keychain, add to ~/.ssh/config:

    Host *
        UseKeychain yes

###Getting Doc Handling

Dowload pandoc from source

Download MacTex from source

###Misc Mac setup
In system prefs > keyboard > input, select tab and spacebar to move for all controls









