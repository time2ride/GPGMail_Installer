This is only the Installer for the GPGMail project (http://www.gpgmail.org).
Please visit the development page for GPGMail on github http://github.com/gpgmail/GPGMail for any bugreports or support.

Current version of the bundle:

To see which commit the submodule is pointing to, run "git submodule", the number before GPGMail is the reference point.

To easily resolve all dependencies (eg. init submodules and update them) run "./resolve-dependencies.sh".

To get the newest version of GPGMail do:
cd GPGMail
git checkout HEAD

To permanently add that as the latest version you have to commit.
cd .. (only if you are still in the GPGMail subdirectory)
git add .
git commit -m "<your message>"
