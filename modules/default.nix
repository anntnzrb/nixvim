{
  pkgs,
  ...
}:
{
  imports =
    map (mod: ../modules/${mod}) [
      "autopairs"
      "clipboard"
      "colorscheme"
      "completion"
      "git"
      "lsp"
      "mini"
      "surround"
      "telescope"
      "tree-sitter"
      "which-key"

      "langs/c"
      "langs/gleam"
      "langs/nix"
      "langs/python"
      "langs/rust"
      "langs/scala"
      "langs/sh"
      "langs/typst"
    ]
    ++ [
      ./keymappings.nix
    ];

  config = {
    enableMan = false;
    package = pkgs.neovim-unwrapped;
    withNodeJs = false;
    withRuby = false;

    wrapRc = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      autoindent = true;
      shiftwidth = 4;
      tabstop = 4;

      cursorline = true;
      linebreak = true;
      mouse = "a";
      wrap = true;

      number = true;
      relativenumber = true;
    };
  };
}
