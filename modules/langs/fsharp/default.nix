{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.fsautocomplete = {
      inherit (config.plugins.lsp) enable;
      package = null;
    };

    none-ls.sources.formatting.fantomas = {
      inherit (config.plugins.none-ls) enable;
      package = null;
    };
  };
}
