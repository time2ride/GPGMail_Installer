This is only the Installer for the GPGMail project (http://gpgmail.org).
Please visit the development page for GPGMail on github http://github.com/gpgmail/GPGMail for any bugreports or support.

Current version of the bundle:

To see which commit the submodule is pointing to, run "git submodules", the number before GPGMail is the reference point.

To get the newest version of GPGMail do:
cd GPGMail
git checkout HEAD

To permanently add that as the latest version you have to commit.
cd .. (only if you are still in the GPGMail subdirectory)
git add .
git commit -m "<your message>"
