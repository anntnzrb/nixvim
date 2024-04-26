{ config
, pkgs
, ...
}: {
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil_ls = {
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
