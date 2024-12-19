{
  config,
  pkgs,
  ...
}:
let
  lspEnabled = config.plugins.lsp.enable;
in
{
  config = {
    plugins = {
      clangd-extensions.enable = lspEnabled;
      lsp.servers.clangd.enable = lspEnabled;
    };
  };
}
