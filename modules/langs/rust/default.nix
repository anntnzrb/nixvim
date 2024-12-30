{
  config,
  ...
}:
{
  config = {
    plugins = {
      lsp.servers.rust_analyzer = {
        inherit (config.plugins.lsp) enable;
        package = null;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
