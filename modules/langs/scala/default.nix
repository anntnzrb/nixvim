{
  config,
  ...
}:
{
  config = {
    plugins = {
      lsp.servers.metals = {
        enable = config.plugins.lsp.enable;
        package = null;
      };

      none-ls.sources.formatting.scalafmt = {
        enable = true;
        package = null;
      };
    };
  };
}
