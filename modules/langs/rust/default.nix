{
  config,
  ...
}:
{
  config = {
    plugins = {
      lsp.servers.rust_analyzer = {
        enable = config.plugins.lsp.enable;
        package = null;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
