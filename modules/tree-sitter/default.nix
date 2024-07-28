{
  config = {
    plugins = {
      treesitter = {
        enable = true;
        nixvimInjections = true;

        folding = false;

        settings = {
          auto_install = true;
          highlight.enable = true;
          indent.enable = true;
        };
      };

      treesitter-context.enable = true;
    };
  };
}
