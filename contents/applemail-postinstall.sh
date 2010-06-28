#!/bin/sh

# enable bundles in Mail
defaults write com.apple.mail EnableBundles -bool YES 
# set whatever
defaults write com.apple.mail BundleCompatibilityVersion -int 3 
