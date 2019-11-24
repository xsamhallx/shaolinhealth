#!/bin/bash
# A script outlining the requirements to write blog posts locally in Apple Pages or Word and
# then using 'publish.command' in the Finder App which employs Pandoc to convert blog posts into markdown and publish to github

# Install Command Line Tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Git
brew install git

# Set git to use the osxkeychain credential helper
git config --global credential.helper osxkeychain

# Install Pandoc
brew install pandoc