{
  config,
  pkgs,
  ...
}:
{
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil-ls = {
      enable = config.plugins.lsp.enable;
      package = null;

      settings.formatting.command = [ "nixfmt" ];
    };

    extraPackages = with pkgs; [
      nil
      nixfmt-rfc-style
    ];
  };
}
