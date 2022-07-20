ARG REGISTRY=docker.io/
ARG ALPINE_VERSION=3.16
ARG UID=5355
ARG NPROC=


FROM ${REGISTRY}alpine:${ALPINE_VERSION} AS builder

RUN set -eux; \
    apk add \
        --no-cache \
        coreutils \
        git \
        make \
    ;


FROM builder as redbean-build

ARG REDBEAN_GIT_PREFIX=https://github.com/jart
ARG REDBEAN_GIT_COMMIT=d3f3cb7ab4ac64ca96fc26a2b9887dee332cb826
ARG NPROC

RUN set -eux; \
    git clone ${REDBEAN_GIT_PREFIX}/cosmopolitan /cosmopolitan; \
    (cd /cosmopolitan; git reset --hard $REDBEAN_GIT_COMMIT); \
    make -C /cosmopolitan -j${NPROC} MODE=tinylinux o/tinylinux/tool/net; \
    find . -name "*redbean*"


FROM scratch

ARG UID

COPY --from=redbean-build /cosmopolitan/o/tinylinux/tool/net/redbean-static.com /redbean.com
COPY www www

USER $UID
EXPOSE 80

CMD ["/redbean.com", "-vv", "-p", "80", "-D", "www"]
