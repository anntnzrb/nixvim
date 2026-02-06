{
  pkgs,
  ...
}:
{
  extraPackages = [ pkgs.nixfmt ];

  plugins.lsp.servers.nixd = {
    enable = true;

    settings = {
      formatting.command = [ "nixfmt" ];

      nixpkgs.expr = ''
        let
          flake = builtins.getFlake (builtins.toString ./.);
        in
        import flake.inputs.nixpkgs { }
      '';

      options.nixvim.expr = ''
        let
          flake = builtins.getFlake (builtins.toString ./.);
        in
        (flake.inputs.nixvim.lib.evalNixvim {
          modules = [
            { nixpkgs.hostPlatform = builtins.currentSystem; }
          ];
        }).options
      '';
    };
  };
}
