{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.ocamllsp = {
      enable = config.plugins.lsp.enable;
      package = null;
    };

    none-ls.sources.formatting.ocamlformat = {
      enable = true;
      package = null;
    };
  };
}
