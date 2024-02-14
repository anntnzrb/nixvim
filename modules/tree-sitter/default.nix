{
  config = {
    plugins.treesitter = {
      enable = true;
      ensureInstalled = "all";
      indent = true;
      nixvimInjections = true;
    };
  };
}
