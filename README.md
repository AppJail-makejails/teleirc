# TeleIRC

TeleIRC is a Go implementation of a Telegram <=> IRC bridge. TeleIRC works with any IRC channel and Telegram group. It bridges messages between a Telegram group and an IRC channel.

teleirc.com

<img src="https://github.com/RITlug/teleirc/raw/main/assets/svg/horizontal_color.svg?raw=true" width="30%" height="auto" alt="TeleIRC logo">

## How to use this Makejail

```console
$ appjail oci run -Pd \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    -e TELEIRC_IRC_SERVER="irc.libera.chat" \
    -e TELEIRC_IRC_CHANNEL="#channel" \
    -e TELEIRC_IRC_BOT_REALNAME="Telegram bridge" \
    -e TELEIRC_IRC_EDITED_PREFIX="(edited) " \
    -e TELEIRC_IRC_QUIT_MESSAGE="TeleIRC bridge stopped." \
    -e TELEIRC_TELEGRAM_CHAT_ID="-0000000000000" \
    -e TELEIRC_TELEIRC_TOKEN="000000000:AAAAAAaAAa2AaAAaoAAAA-a_aaAAaAaaaAA" \
    -e TELEIRC_IMGUR_CLIENT_ID="7d6b00b87043f58" \
    ghcr.io/appjail-makejails/teleirc teleirc
```

Note that the above values are not actual values, this is for demonstration purposes only, use the correct values for your environment.

This image uses `envsubst` and [this template](teleirc.conf) to create the configuration file used by TeleIRC. See the template for a list of all available environment variables.

### Arguments (stage: build)

* `teleirc_from` (default: `ghcr.io/appjail-makejails/teleirc`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `teleirc_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```
