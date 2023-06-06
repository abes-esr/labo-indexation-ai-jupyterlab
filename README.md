# labo-indexation-ai-jupyterlab

Image docker 🐳 pour le projet Abes Labo indexation-ai permettant de déployer un JuptyerLab avec des dépôt Git intégrés

## Usage du plugin jupyterlab-git

Deux vidéos pour montrer comment faire un commit depuis jupyterlab sur un dépôt github avec la particularité de devoir utiliser un personal access tocken pour l'authentification (pre-requis github)


todo : ajouter vidéo




## Developpements

Pour tester l'image :

```
docker build . -t labo-image-test

docker run --rm -p 8888:8888 \
   -e LABO_INDEXATION_AI_GIT_REPO1_NAME=labo-indexation-ai \
   -e LABO_INDEXATION_AI_GIT_REPO1_URL=https://github.com/abes-esr/labo-indexation-ai.git \
   -e LABO_INDEXATION_AI_GIT_REPO2_NAME=abes-labo-movies \
   -e LABO_INDEXATION_AI_GIT_REPO2_URL=https://github.com/abes-esr/abes-labo-movies.git \
   -e JUPYTER_ENABLE_LAB=yes \
   -e JUPYTER_TOKEN=secret \
   --name labo-container-test \
   labo-image-test


```
