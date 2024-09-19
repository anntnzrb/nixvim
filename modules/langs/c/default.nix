{
  config,
  pkgs,
  ...
}:
{
  config = {
    plugins = {
      clangd-extensions.enable = true;
      lsp.servers.clangd.enable = true;
    };
  };
}
