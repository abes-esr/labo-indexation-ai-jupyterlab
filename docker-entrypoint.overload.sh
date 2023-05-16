#!/bin/bash


# Clone des dépôts git
if [ "$GIT_REPO1_NAME" != "" ]; then
  if [ ! -d /home/jovyan/work/$GIT_REPO1_NAME/.git/ ]; then
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $GIT_REPO1_NAME pour le JupyterLab"
    rm -rf /home/jovyan/work/$GIT_REPO1_NAME/
    git config --global pull.rebase false
    git clone "$GIT_REPO1_URL" /home/jovyan/work/$GIT_REPO1_NAME/
  else
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $GIT_REPO1_URL déjà réalisé dans /home/jovyan/work/$GIT_REPO1_NAME"
  fi
else
  echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Erreur: GIT_REPO1_URL GIT_REPO1_NAME doivent être renseignées pour pouvoir travailler avec des fichiers ipynb collaborativement"
fi
if [ "$GIT_REPO2_NAME" != "" ]; then
  if [ ! -d /home/jovyan/work/$GIT_REPO2_NAME/.git/ ]; then
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $GIT_REPO2_NAME pour le JupyterLab"
    rm -rf /home/jovyan/work/$GIT_REPO2_NAME/
    git config --global pull.rebase false
    git clone "$GIT_REPO2_URL" /home/jovyan/work/$GIT_REPO2_NAME/
  else
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $GIT_REPO2_URL déjà réalisé dans /home/jovyan/work/$GIT_REPO2_NAME"
  fi
else
  echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Erreur: GIT_REPO2_URL GIT_REPO2_NAME doivent être renseignées pour pouvoir travailler avec des fichiers ipynb collaborativement"
fi



# start the real entrypoint
# see https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile#L147
exec tini -g -- $@
