{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.clojure_lsp = {
      enable = config.plugins.lsp.enable;
      package = null;
    };
  };
}
