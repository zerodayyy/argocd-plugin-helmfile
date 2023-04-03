FROM ghcr.io/helmfile/helmfile:v0.152.0

ENV XDG_CONFIG_HOME /helm/.config
ENV XDG_CACHE_HOME /helm/.cache
ENV XDG_DATA_HOME /helm/.local/share
ENV HOME /helm

RUN chown -R 999 /helm
USER 999

COPY plugin.yaml /home/argocd/cmp-server/config/
