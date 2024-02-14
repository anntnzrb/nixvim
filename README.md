# annt's nixvim

The following project is a my personally curated configuration for
[neovim](https://neovim.io).

This configuration is written using Nix. This allows me to easily use this
customized configuration on any machine with Nix installed.
There is no package manager step, everything is handled behind the scenes by
[Nix](https://nixos.org).

- [nixpkgs](https://search.nixos.org/packages?channel=unstable&type=packages&query=vimPlugins)
- [nixvim](https://github.com/nix-community/nixvim).

## Disclaimer

As of this writting, it is not intented that this configuration will be an
exhaustive one. I am still using _GNU Emacs_ as my primary editor.

## Try It

You may try this Neovim configuration without any installation. This does not
affect your own settings.

```sh
nix run github:anntnzrb/nixvim
```

You can alias this and try it out.

```sh
alias e='nix run github:anntnzrb/nixvim --'

# open any file
e ~/.bashrc
```

## Install via Nix Profiles

```sh
nix profile install github:anntnzrb/nixvim
```

## COPYING

Refer to the [COPYING](./COPYING) file for licensing information.

Unless otherwise noted, all code herein is distributed under the terms of the
[GNU General Public License Version 3 or later](https://www.gnu.org/licenses/gpl-3.0.en.html).
