{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.clojure_lsp = {
      inherit (config.plugins.lsp) enable;
      package = null;
    };
  };
}
