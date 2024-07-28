{ config
, pkgs
, ...
}: {
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil-ls = {
      enable = config.plugins.lsp.enable;
      package = null;

      settings.formatting.command = [ "nixpkgs-fmt" ];
    };

    extraPackages = with pkgs; [
      nil
      nixpkgs-fmt
    ];
  };
}
