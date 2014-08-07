## Setting up Mac for python, Java, fish, and misc niceness

###Getting python to work
//still haven't found a package distro that I like, would rather install from source
install homebrew from source
    brew install python 
(gets you easy_install and pip)
  	pip install virtualenv
  	pip install ipython
  	pip install matplotlib
  	pip install pandas

###Programs that make life better
install from sites:
* Sublime Text 2
* iTerm 2
* Eclipse
* Sequel Pro

###Getting Java to work
Download Java from the oracle website
Download the java SE development kit (7 is here: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)

###Getting mysql and the python connector to work
install xtools from app store
get command line tools from here: https://developer.apple.com/downloads/index.action?name=for%20Xcode%20-
    brew install mysql
    pip install MySQL-python

###Making fish the default shell
    brew install fish
add fish path to /etc/shells
    run chsh -s /usr/local/bin/fish
config file goes in ~/.config/fish/functions

###Making Sublime the default text editor
Rename the package for Sublime Text 2 in Applications to Sublime
In ~.config/fish/ add the file config.fish
Add the line to config.fish:
    setenv EDITOR Sublime

###Getting Doc Handling
Dowload pandoc from source
Download MacTex from source

###Misc Mac setup
In system prefs > keyboard > input, select tab and spacebar to move for all controls









