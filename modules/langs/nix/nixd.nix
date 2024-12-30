{
  config,
  pkgs,
  ...
}:
{
  config = {
    plugins.lsp.servers.nixd = {
      inherit (config.plugins.lsp) enable;
      settings.formatting.command = [ "nixfmt" ];

      settings = {
        nixpkgs = {
          expr = "import <nixpkgs> {}";
        };
        options = {
          nixos = {
            expr = ''
              let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).nixosConfigurations; in (builtins.head (builtins.attrValues configs)).options
            '';
          };
          home_manager = {
            expr = ''
              let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).homeConfigurations; in (builtins.head (builtins.attrValues configs)).options
            '';
          };
          darwin = {
            expr = ''
              let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).darwinConfigurations; in (builtins.head (builtins.attrValues configs)).options
            '';
          };
        };
      };
    };

    extraPackages = [ pkgs.nixfmt-rfc-style ];
  };
}
