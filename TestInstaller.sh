#!/bin/bash
################################################
# Tests the GPGMail installer package
#
# @version  2010-07-26
# @author   Alexander Willner <alex@willner.ws>
#
################################################


################################################
# Configuration
################################################
_bundlePath="~/Library/Mail/Bundles/GPGMail.mailbundle";
_installer="./build/GPG_Mail.pkg";
################################################


################################################
# Functions
################################################
function assert() {
    expected=$1;
    actual=$2;
    text=$3;
    if [ "$1" != "$2" ]; then
        echo "FAIL: $text (expected '$expected', was '$actual')";
        exit 1;
    else
        echo "PASS: $text";
    fi
}
################################################


################################################
# Setup
################################################
defaults write com.apple.mail EnableBundles -bool NO
defaults write com.apple.mail BundleCompatibilityVersion -int 1
rm -rf "$_bundlePath";
################################################


################################################
# Read
################################################
_bundlesEnabled=`defaults read com.apple.mail EnableBundles`;
_bundlesVersion=`defaults read com.apple.mail BundleCompatibilityVersion`;
_bundleInstalled=`if [ -d "$_bundlePath" ]; then echo "1"; fi`;
_installerExist=`if [ -f "$_installer" ]; then echo "1"; fi`;
################################################


################################################
# Check
################################################
assert "0" "$_bundlesEnabled" "Bundles should be disabled";
assert "1" "$_bundlesVersion" "Bundles version should be 1";
assert "" "$_bundleInstalled" "Bundle should not be installed";
assert "1" "$_installerExist" "Installer should exist";
################################################


################################################
# Run
################################################
echo "Installing...";
installer -pkg "$_installer" -target "$HOME" > $0.log 2>&1;
assert "0" "$?" "Installation should have been successful"
################################################


################################################
# Read
################################################
_bundlesEnabled=`defaults read com.apple.mail EnableBundles`;
_bundlesVersion=`defaults read com.apple.mail BundleCompatibilityVersion`;
_bundleInstalled=`if [ -d ~/Library/Mail/Bundles/GPGMail.mailbundle ]; then echo "1"; fi`;
################################################


################################################
# Check
################################################
assert "1" "$_bundlesEnabled" "Bundles should be enabled";
assert "3" "$_bundlesVersion" "Bundles version should be 3";
assert "1" "$_bundleInstalled" "Bundle should be installed";
################################################
