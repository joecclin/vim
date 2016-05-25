#!/bin/bash

# for one user name in one git
# git config user.name "joecclin"

# for git config to push all branches
git config --global push.default matching
# for git config to push this working branches
#git config --global push.default simple


git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
