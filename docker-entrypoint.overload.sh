#!/bin/bash


# Clone des dépôts git
if [ "$LABO_INDEXATION_AI_GIT_REPO1_NAME" != "" ]; then
  if [ ! -d /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO1_NAME/.git/ ]; then
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $LABO_INDEXATION_AI_GIT_REPO1_NAME pour le JupyterLab"
    rm -rf /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO1_NAME/
    git config --global pull.rebase false
    git clone "$LABO_INDEXATION_AI_GIT_REPO1_URL" /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO1_NAME/
  else
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $LABO_INDEXATION_AI_GIT_REPO1_URL déjà réalisé dans /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO1_NAME"
  fi
else
  echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Warning: LABO_INDEXATION_AI_GIT_REPO1_URL LABO_INDEXATION_AI_GIT_REPO1_NAME doivent être renseignées pour pouvoir travailler avec des fichiers ipynb collaborativement"
fi
if [ "$LABO_INDEXATION_AI_GIT_REPO2_NAME" != "" ]; then
  if [ ! -d /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO2_NAME/.git/ ]; then
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $LABO_INDEXATION_AI_GIT_REPO2_NAME pour le JupyterLab"
    rm -rf /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO2_NAME/
    git config --global pull.rebase false
    git clone "$LABO_INDEXATION_AI_GIT_REPO2_URL" /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO2_NAME/
  else
    echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Git clone du dépot $LABO_INDEXATION_AI_GIT_REPO2_URL déjà réalisé dans /home/jovyan/work/$LABO_INDEXATION_AI_GIT_REPO2_NAME"
  fi
else
  echo "--> $(date '+%Y-%m-%d %H:%M:%S') - Warning: LABO_INDEXATION_AI_GIT_REPO2_URL LABO_INDEXATION_AI_GIT_REPO2_NAME doivent être renseignées pour pouvoir travailler avec des fichiers ipynb collaborativement"
fi



# start the real entrypoint
# see https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile#L147
exec tini -g -- $@
