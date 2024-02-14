{
  imports = [
    ../modules/ai/copilot
    ../modules/bufferline
    ../modules/clipboard
    ../modules/colorscheme
    ../modules/completion
    ../modules/lsp
    ../modules/surround
    ../modules/tree-sitter
    ../modules/which-key

    ../modules/langs/nix
  ];

  config = {
    wrapRc = true;
    type = "lua";

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    options = {
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
