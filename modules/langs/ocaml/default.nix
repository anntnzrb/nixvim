{
  config,
  ...
}:
{
  config.plugins = {
    lsp.servers.ocamllsp = {
      inherit (config.plugins.lsp) enable;
      package = null;
    };

    none-ls.sources.formatting.ocamlformat = {
      enable = true;
      package = null;
    };
  };
}
