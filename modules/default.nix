{
  imports = map (mod: ../modules/${mod}) [
    "ai/copilot"
    "autopairs"
    "clipboard"
    "colorscheme"
    "completion"
    "git"
    "lsp"
    "surround"
    "telescope"
    "tree-sitter"
    "which-key"

    "langs/c"
    "langs/gleam"
    "langs/nix"
    "langs/rust"
    "langs/sh"
    "langs/typst"
  ] ++ [
    ./keymappings.nix
  ];

  config = {
    withNodeJs = false;

    wrapRc = true;
    type = "lua";

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
