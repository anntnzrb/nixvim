{
  pkgs,
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "s";
in
{
  plugins = {
    treesitter = {
      enable = true;

      nixGrammars = true;
      nixvimInjections = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        cpp
        css
        diff
        dockerfile
        git_config
        gitcommit
        gitignore
        gleam
        go
        html
        javascript
        json
        lua
        markdown
        markdown_inline
        nix
        python
        query
        regex
        rust
        toml
        tsx
        typescript
        typst
        vim
        vimdoc
        yaml
      ];

      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      settings = {
        auto_install = false;
        ensure_installed = [ ];

        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "gnn";
            node_incremental = "grn";
            scope_incremental = "grc";
            node_decremental = "grm";
          };
        };
      };
    };

    ts-autotag = {
      enable = true;
      settings = {
        opts = {
          enable_close = true;
          enable_rename = true;
          enable_close_on_slash = false;
        };
      };
    };

    ts-context-commentstring = {
      enable = true;
      settings.enable_autocmd = true;
    };

    treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
          };
        };
        move = {
          enable = true;
          set_jumps = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]c" = "@class.outer";
          };
          goto_next_end = {
            "]M" = "@function.outer";
            "]C" = "@class.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[c" = "@class.outer";
          };
          goto_previous_end = {
            "[M" = "@function.outer";
            "[C" = "@class.outer";
          };
        };
        swap = {
          enable = true;
          swap_next = prefixed {
            p = "@parameter.inner";
          };
          swap_previous = prefixed {
            P = "@parameter.inner";
          };
        };
      };
    };
  };

  opts = {
    foldlevel = 99;
    foldlevelstart = 99;
  };
}
