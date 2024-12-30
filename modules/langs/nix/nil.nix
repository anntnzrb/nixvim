{
  config,
  pkgs,
  ...
}:
{
  config = {
    plugins.lsp.servers.nil_ls = {
      inherit (config.plugins.lsp) enable;
      settings.formatting.command = [ "nixfmt" ];
    };

    extraPackages = [ pkgs.nixfmt-rfc-style ];
  };
}
