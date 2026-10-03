{
  lib,
  ...
}:
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
    virtualedit = "block";
    wrap = true;
  };

  # file safety behavior
  fileSafety = {
    backup = false;
    # Bound ShaDa history size to prevent cold startup latency from huge registers/marks
    shada = "'10,<50,s10,:20";
    swapfile = false;
    writebackup = true;
  };

  # search behavior
  search = {
    ignorecase = true;
    inccommand = "split";
    infercase = true;
    smartcase = true;
  };

  # split and signcolumn behavior
  window = {
    scrolloff = 8;
    sidescrolloff = 8;
    signcolumn = "yes";
    smoothscroll = true;
    splitbelow = true;
    splitkeep = "screen";
    splitright = true;
    winborder = "rounded";
  };

  # core ui behavior
  ui = {
    clipboard = "unnamedplus";
    jumpoptions = "stack";
    list = true;
    listchars = "tab:» ,trail:·,nbsp:␣";
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
    autocomplete = true;
    complete = ".,w,b,u,kspell,f";
    completeopt = "menuone,noselect,popup";
    pumblend = 0;
    pumborder = "rounded";
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
