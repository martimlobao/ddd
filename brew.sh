#!/usr/bin/env bash

# Ask for the administrator password upfront and keep alive until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# INSTALL COMMAND-LINE TOOLS USING HOMEBREW                                   #
###############################################################################

# Update Homebrew and installed formulas.
brew update
brew upgrade

# Update system nano.
brew install nano

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell.
BREW_PREFIX=$(brew --prefix)
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
	echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install cht.sh (https://github.com/chubin/cheat.sh).
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
brew install rlwrap

###############################################################################
# Usage:
# $ cht.sh python random list elements
#
# Shell mode:
# $ cht.sh --shell python
# cht.sh/python> reverse a list
#
# Stealth mode:
# $ cht.sh --shell python
# cht.sh/python> stealth Q
# (selecting "reverse a list")
# stealth: reverse a list
# reverse_lst = lst[::-1]
###############################################################################

# Install git utilities
brew install git
brew install git-lfs

# Install other languages
brew install go
brew install node

# Install download utilities
brew install httpie
brew install wget
brew install youtube-dl

# Install fancy shell stuff
brew install autojump
brew install bat
brew install mas
brew install nnn
brew install tree

# Install shell formatting
brew install zsh-syntax-highlighting

# Install alternative shells for fun
brew install fish
brew install nushell

# Install very important stuff
brew install cowsay
brew install googler
brew install lolcat
brew install pastel
brew install neofetch
brew install thefuck

# Install newer versions of system binaries using different names
brew install gnu-sed # gsed
brew install grep # ggrep

# Install other useful binaries
brew install ack
brew install exiftool
brew install gifski
brew install gpg
brew install imagemagick
brew install jq
brew install pandoc

# Install developer tools
brew install docker
brew tap mongodb/brew
brew install mongodb-community@4.2
# brew services start mongodb-community
# sudo mkdir -p /data/db
# sudo chown -R $(whoami) /data/db
sudo chown -R $(whoami) $(brew --prefix)/*
brew install mysql@5.7
brew services start mysql
# sudo mysql.server start
brew install wine
brew install apache-spark
brew install elasticsearch
brew install postgresql
brew install redis
brew install aws-rotate-key

# Remove outdated versions from the cellar
brew cleanup
