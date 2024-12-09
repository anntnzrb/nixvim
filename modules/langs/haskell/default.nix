{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.hls = {
      enable = config.plugins.lsp.enable;
      package = null;
      installGhc = false;
    };

    haskell-scope-highlighting.enable = true;
  };
}
