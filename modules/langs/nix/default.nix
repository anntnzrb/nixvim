{
  config,
  pkgs,
  ...
}:
{
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil_ls = {
      enable = config.plugins.lsp.enable;
      settings.formatting.command = [ "nixfmt" ];
    };

    extraPackages = [ pkgs.nixfmt-rfc-style ];
  };
}
