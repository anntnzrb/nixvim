{
  imports = [
    ../modules/ai/copilot
    ../modules/bufferline
    ../modules/clipboard
    ../modules/colorscheme
    ../modules/completion
    ../modules/git
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

    keymaps = [
      {
        mode = "n";
        key = "Q";
        action = "gqq{";
        options = {
          silent = true;
          desc = "Format paragraph";
        };
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options = {
          silent = true;
          desc = "Scroll half page up. Center";
        };
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options = {
          silent = true;
          desc = "Scroll half page down. Center";
        };
      }
    ];
  };
}
