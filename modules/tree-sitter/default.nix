{
  config = {
    plugins.treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = false;

      settings = {
        auto_install = true;
        indent.enable = true;
        highlight.enable = true;
        highlight.additional_vim_regex_highlighting = true;

        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            node_decremental = "<BS>";
            scope_incremental = false;
          };
        };
      };
    };

    plugins.treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
      };
    };
  };
}
