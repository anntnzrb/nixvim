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

    "langs/nix"
    "langs/c"
    "langs/rust"
    "langs/sh"
    "langs/typst"
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

    keymaps =
      let
        mkRemap = mode: key: action: desc: {
          inherit mode key action;
          options = {
            silent = true;
            inherit desc;
          };
        };
      in
      [
        (mkRemap "n" "<ESC><ESC>" ":nohlsearch<CR>" "Clear highlights")
        (mkRemap "n" "<C-x>h" "ggVG" "Select whole buffer")
        (mkRemap "n" "Q" "gqq" "Format paragraph")
        (mkRemap "n" "<C-u>" "<C-u>zz" "Scroll half page up & center")
        (mkRemap "n" "<C-d>" "<C-d>zz" "Scroll half page down & center")

        (mkRemap "i" "<C-z><C-z>" "<C-o>zz" "Center cursor while in insert mode")

        # buffers
        (mkRemap "n" "<leader>bk" ":bdelete<CR>" "Kill current buffer")
        (mkRemap "n" "<leader>b[" ":bnext<CR>" "Switch to next buffer")
        (mkRemap "n" "<leader>b]" ":bprev<CR>" "Switch to previous buffer")
      ];
  };
}
