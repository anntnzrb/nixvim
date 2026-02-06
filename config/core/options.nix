{ lib, ... }:
let
  # editing and buffer behavior
  editing = {
    expandtab = true;
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    smartindent = true;
    tabstop = 2;
    undofile = true;
    wrap = true;
  };

  # file safety behavior
  fileSafety = {
    backup = false;
    writebackup = true;
    swapfile = false;
  };

  # search behavior
  search = {
    ignorecase = true;
    infercase = true;
    smartcase = true;
  };

  # split and signcolumn behavior
  window = {
    signcolumn = "yes";
    splitbelow = true;
    splitright = true;
  };

  # core ui behavior
  ui = {
    clipboard = "unnamedplus";
    mouse = "a";
    termguicolors = true;
  };

  # responsiveness
  timing = {
    timeoutlen = 800;
    updatetime = 250;
  };

  # insert-mode completion behavior
  completion = {
    complete = ".,w,b,u,U,k,kspell,s,i,d,],f";
    completeopt = "menuone,noselect,popup";
    pumblend = 0;
    pumheight = 12;
  };

  # command-line completion behavior
  cmdlineCompletion = {
    wildmenu = true;
    wildmode = "longest:full,full";
    wildoptions = "pum";
  };

  # reduce noisy short messages
  message = {
    shortmess = "filnxtToOFc";
  };
in
{
  opts = lib.attrsets.mergeAttrsList [
    editing
    fileSafety
    search
    window
    ui
    timing
    completion
    cmdlineCompletion
    message
  ];
}
