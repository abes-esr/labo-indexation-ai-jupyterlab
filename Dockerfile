FROM jupyter/minimal-notebook:lab-3.6.3

# https://github.com/jupyterlab/jupyterlab-git
# Attention : problème connu en version jupyterlab 4.0.2, le plugin jupyterlab-git ne fonctionne pas cf :
# https://github.com/jupyterlab/jupyterlab-git/issues/1245
RUN pip install jupyterlab-git 

USER root
COPY ./docker-entrypoint.overload.sh /
RUN fix-permissions "/docker-entrypoint.overload.sh"
USER $NB_USER

ENTRYPOINT ["/docker-entrypoint.overload.sh"]
# see https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile#L148
CMD ["start-notebook.sh", "--NotebookApp.allow_remote_access=true"]


