FROM bitnami/kubectl:1.17-ol-7 AS prepare
LABEL maintainer "Tunarider <tunarider@tunaground.net>"

USER 0

RUN yum install -y openssl && \
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sh

FROM oraclelinux:7-slim AS app

COPY --from=prepare /opt/bitnami/kubectl/bin/kubectl /usr/local/bin
COPY --from=prepare /usr/local/bin/helm /usr/local/bin

CMD [ "helm" ]
