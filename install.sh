#!/bin/bash

# for one user name in one git
# git config user.name "joecclin"

# for git config to push all branches
git config --global push.default matching
# for git config to push this working branches
#git config --global push.default simple


# set vimdiff to git diff 
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

# git alias ci to commit
git config --global alias.ci commit
git config --global alias.st status

# add symbolic link
cd ..
ln -s .vim/.vimrc ./vimrc
ln -s .vim/.vimproject_mappings ./vimproject_mappings

