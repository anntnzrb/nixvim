{
  config,
  ...
}:
{
  config = {
    plugins = {
      lsp.servers.gleam = {
        inherit (config.plugins.lsp) enable;
        package = null;
      };

      none-ls.sources.formatting.gleam_format = {
        enable = true;
        package = null;
      };
    };
  };
}
