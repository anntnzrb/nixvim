# annt's nixvim

The following project is a my personally curated configuration for
[neovim](https://neovim.io).

This configuration is written using Nix. This allows me to easily use this
customized configuration on any machine with Nix installed.
There is no package manager step, everything is handled behind the scenes by
[Nix](https://nixos.org) +
[nixpkgs](https://search.nixos.org/packages?channel=unstable&type=packages&query=vimPlugins) +
[nixvim](https://github.com/nix-community/nixvim).

## Disclaimer

As of this writting, there is no intention of making these configurations
exhaustive. I am still using _GNU Emacs_ as my primary editor.

## Features

The following describes _some_ features of this configuration. This list is not
exhaustive.

**Packages/Plugins/Extensions (Package Manager)**:

- There is no package manager; all plugins are handled by
  [nixpkgs](https://search.nixos.org/packages?channel=unstable&type=packages&query=vimPlugins)

**Languages**:

- **[`shell`](./modules/langs/sh/default.nix)**
  - LSP, `shellcheck`, and `shfmt` pre-configured[^1]

**Treesitter**:

- Enabled for most, if not all filetypes; no compilation required

[^1]:
    Most of these tools are disabled by default for other languages in order to
    avoid polluting the configuration. However shell-scripts are special case.

## Goals

- Avoid in-line raw _lua/vimscript_ code as much as possible
  - Favor _nixification_; `nixvim` should handle the configuration

## Get It

You may try this Neovim configuration without any installation. This does not
affect your own settings.

```sh
nix run github:anntnzrb/nixvim
```

You can also alias the above command for convenience.

```sh
alias e='nix run github:anntnzrb/nixvim --'

# open any file
e ~/.bashrc
```

### Installing via Nix Profiles

```sh
nix profile install github:anntnzrb/nixvim
```

## COPYING

Refer to the [COPYING](./COPYING) file for licensing information.

Unless otherwise noted, all code herein is distributed under the terms of the
[GNU General Public License Version 3 or later](https://www.gnu.org/licenses/gpl-3.0.en.html).
