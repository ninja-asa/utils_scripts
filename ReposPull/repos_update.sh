#!/bin/bash
YE='\e[33m'
NC='\e[0m'
GE='\e[32m'

if [[ -z "${REPOROOT}" ]]; then
  echo -e "${GE} You do not have REPOROOT variable set. Define one.${NC}"
  read reposroot
  cd $reposroot
  echo "export REPOROOT=$reposroot" >> ~/.bashrc
else
  echo -e "${YE}Your REPOROOT is set as $REPOROOT${NC}"
  cd $REPOROOT
fi
 
echo -e "Configuring git alias - update"
echo "git config --global alias.up '!git remote update -p; git merge --ff-only" $
git config --global alias.up '!git remote update -p; git merge --ff-only @{u}'
echo "Going over your repositories ... "
for repos in */ ; do
    cd $repos
    echo -e "${YE}Updating $repos${NC}" 
    git up
    cd ..
done
exec bash --login
