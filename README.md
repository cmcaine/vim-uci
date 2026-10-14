# vim-uci

Tiny, simple ftdetect, ftplugin and syntax scripts for OpenWRT's Unified
Configuration Interface files.

Don't have vim on your router? I don't either, but this works great with sshfs.

## Bonus features

`ftplugin/uci.vim` sets `commentstring` correctly, so tpope's
[vim-commentary](https://github.com/tpope/vim-commentary) works as intended!

<details>
<summary>UCI tag-file generator by @efahl</summary>

If you want to be able to jump to tags (named sections or options, etc).

```
#!/usr/bin/ucode -S
// Create tags for uci files, specifically targeting two items:
//   1) named sections:  config type 'thing'
//   2) sections containing a "name" option:  option name 'thing'
// In both cases, the literal "thing" becomes the tag.

import {open, glob} from "fs";

let tags = [];

function save_tag(tag, path, line)
{
        tag  = replace(tag, /['"]/g, "");
        line = replace(line, /\//g, "\\/"); // Feeble regex escaping...
        push(tags, sprintf("%s\t%s\t/^%s$/\n", tag, path, line));
}

for (let path in glob("/etc/config/*")) {
        let config = open(path, "r");
        if (config) {
                let line;
                while (line = config.read("line")) {
                        line = replace(line, "\n", "");
                        let parts = split(trim(line), /[[:space:]]+/);
                        if (length(parts) < 3) continue;
                        if (parts[0] == "config" ||
                            parts[0] == "option" && parts[1] == "name") {
                                save_tag(parts[2], path, line);
                        }
                }
                config.close();
        }
}

for (let line in sort(tags)) {
        print(line);
}
```

</details>

## Installation

If you don't have a preferred installation method, I recommend installing
[pathogen.vim](https://github.com/tpope/vim-pathogen), and then simply copy and
paste:

    cd ~/.vim/bundle
    git clone git://github.com/cmcaine/vim-uci.git

Vundle, etc. will probably work fine too.

## Reference

[UCI file parsing code](https://git.openwrt.org/?p=project/uci.git;a=blob;f=file.c;h=6610f531c2f64852b032e9ead2ec30b35d61873a;hb=HEAD#l505)

## License

Copyright Colin Caine. GPL v3.
