ARG FREEBSD_RELEASE

FROM ghcr.io/appjail-makejails/core:${FREEBSD_RELEASE}

ARG NO_PKGCLEAN

LABEL org.opencontainers.image.title="TeleIRC" \
    org.opencontainers.image.description="Telegram/IRC bridge for use with any IRC channel and Telegram group" \
    org.opencontainers.image.source="https://github.com/AppJail-makejails/teleirc" \
    org.opencontainers.image.url="https://github.com/AppJail-makejails/teleirc" \
    org.opencontainers.image.vendor="DtxdF" \
    org.opencontainers.image.authors="Jesús Daniel Colmenares Oviedo <dtxdf@disroot.org>"

RUN set -xe; \
    \
    pkg update; \
    pkg install -U teleirc gettext-runtime; \
    \
    if [ -z "${NO_PKGCLEAN}" ]; then \
        pkg clean -a; \
        rm -rf /var/cache/pkg/*; \
    fi; \
    rm -rf /var/db/pkg/repos/*

RUN mkdir -p /templates

COPY teleirc.conf /templates

RUN rm -f /usr/local/etc/teleirc.conf

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

WORKDIR /app

RUN mkdir -p /app

ENTRYPOINT ["/entrypoint.sh"]
CMD ["teleirc", "-conf", "/usr/local/etc/teleirc.conf"]
