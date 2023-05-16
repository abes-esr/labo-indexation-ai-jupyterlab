# labo-indexation-ai-jupyterlab

Image docker 🐳 pour le projet Abes Labo indexation-ai permettant de déployer un JuptyerLab avec des dépôt Git intégrés


## Developpements

Pour tester l'image :

```
docker build . -t labo-image-test

docker run --rm -p 8888:8888 \
   -e GIT_REPO=https://github.com/abes-esr/labo-indexation-ai.git \
   -e JUPYTER_ENABLE_LAB=yes \
   -e JUPYTER_TOKEN=secret \
   --name labo-container-test \
   labo-image-test


docker run --rm -p 8888:8888 \
   -e GIT_REPO1_NAME=labo-indexation-ai \
   -e GIT_REPO1_URL=https://github.com/abes-esr/labo-indexation-ai.git \
   -e GIT_REPO2_NAME=abes-labo-movies \
   -e GIT_REPO2_URL=https://github.com/abes-esr/abes-labo-movies.git \
   -e JUPYTER_ENABLE_LAB=yes \
   -e JUPYTER_TOKEN=secret \
   --name labo-container-test \
   labo-image-test


```
