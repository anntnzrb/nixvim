{
  config = {
    plugins.rustaceanvim = {
      enable = true;

      # do not install lsp
      rustAnalyzerPackage = null;
    };
  };
}
