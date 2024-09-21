# TeleIRC

Go implementation of a Telegram &lt;=> IRC bridge for use with any IRC channel and Telegram group.

teleirc.com

<img src="https://github.com/RITlug/teleirc/blob/main/assets/svg/horizontal_color.svg?raw=true" alt="teleirc logo" width="60%" height="auto">

## How to use this Makejail

```
appjail makejail \
    -j teleirc \
    -f gh+AppJail-makejails/teleirc \
    -o virtualnet=":<random> default" \
    -o nat \
    -- \
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

* `teleirc_tag` (default: `13.4`): see [#tags](#tags).
* This Makejail uses the following pattern to configure teleirc: `--teleirc_<parameter>` where `<parameter>` is a parameter described in `https://docs.teleirc.com/en/latest/user/config-file-glossary/`.

## Tags

| Tag    | Arch    | Version        | Type   |
| ------ | ------- | -------------- | ------ |
| `13.4` | `amd64` | `13.4-RELEASE` | `thin` |
| `14.1` | `amd64` | `14.1-RELEASE` | `thin` |
