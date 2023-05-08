# TeleIRC

Go implementation of a Telegram &lt;=> IRC bridge for use with any IRC channel and Telegram group.

teleirc.com

<img src="https://github.com/RITlug/teleirc/blob/main/assets/svg/horizontal_color.svg?raw=true" alt="teleirc logo" width="60%" height="auto">

## How to use this Makejail

```
INCLUDE options/network.makejail

COPY usr

INCLUDE gh+AppJail-makejails/teleirc
```

Where `options/network.makejail` are the options that suit your environment, for example:

```
ARG network
ARG interface=teleirc

OPTION virtualnet=${network}:${interface} default
OPTION nat
```

The tree structure of the `usr/` directory is as follows:

```
# tree -pug usr/
[drwxr-xr-x root     wheel   ]  usr/
└── [drwxr-xr-x root     wheel   ]  local
    └── [drwxr-xr-x root     wheel   ]  etc
        └── [drwxr-xr-x root     wheel   ]  pkg
            └── [drwxr-xr-x root     wheel   ]  repos
                └── [-rw-r--r-- root     wheel   ]  FreeBSD.conf

5 directories, 1 file
```

Where `FreeBSD.conf` is a configuration file for `pkg(8)` to use the `latest` branch since teleirc is not yet compiled on the `quarterly` branch:

```
FreeBSD: {
  url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}
```

Open a shell and run `appjail makejail`:

```
appjail makejail -j teleirc -- \
	--network testing \
	--teleirc_irc_server irc.libera.chat \
	--teleirc_irc_channel '#channel' \
	--teleirc_irc_bot_realname 'Telegram bridge' \
	--teleirc_irc_edited_prefix '(edited) ' \
	--teleirc_irc_quit_message 'TeleIRC bridge stopped.' \
	--teleirc_telegram_chat_id '-0000000000000' \
	--teleirc_teleirc_token '000000000:AAAAAAaAAa2AaAAaoAAAA-a_aaAAaAaaaAA' \
	--teleirc_imgur_client_id '7d6b00b87043f58'
```

Note that the above values are not actual values, this is for demonstration purposes only, use the correct values for your environment.

### Arguments

This Makejail uses the following pattern to configure teleirc: `--teleirc_<parameter>` where `<parameter>` is a parameter described in `https://docs.teleirc.com/en/latest/user/config-file-glossary/`. Although, there are some parameters that have a default value with a special meaning:

* `teleirc_irc_host_ip`
* `teleirc_irc_server_password`
* `teleirc_irc_channel_key`
* `teleirc_irc_blacklist`
* `teleirc_irc_nickserv_user`
* `teleirc_irc_nickserv_pass`
* `teleirc_irc_no_forward_prefix`
* `teleirc_join_message_allow_list`
* `teleirc_leave_message_allow_list`
* `teleirc_imgur_client_secret`
* `teleirc_imgur_refresh_token`
* `teleirc_imgur_album_hash`

All of the above parameters have the value `0`, so in the resulting configuration, these parameters will have an empty value.
