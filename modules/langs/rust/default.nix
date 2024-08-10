{ config
, ...
}: {
  config = {
    plugins = {
      lsp.servers.rust-analyzer = {
        enable = config.plugins.lsp.enable;
        package = null;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}

