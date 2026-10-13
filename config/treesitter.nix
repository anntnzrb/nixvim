{
  config,
  ...
}:
{
  plugins.treesitter = {
    enable = true;

    nixGrammars = true;
    nixvimInjections = true;

    grammarPackages = with config.plugins.treesitter.package.builtGrammars; [
      bash
      c
      cpp
      css
      diff
      dockerfile
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      gleam
      go
      gomod
      gosum
      haskell
      html
      ini
      java
      javascript
      json
      just
      kdl
      lua
      make
      markdown
      markdown_inline
      nix
      python
      query
      regex
      rust
      scss
      terraform
      toml
      tsx
      typescript
      typst
      vim
      vimdoc
      xml
      yaml
    ];

    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;
  };

  opts = {
    foldlevel = 99;
    foldlevelstart = 99;
  };
}
