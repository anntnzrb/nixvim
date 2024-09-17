{
  description = "annt's nixified neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default/main";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim/main";

      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";

        # optional inputs
        devshell.follows = "";
        flake-compat.follows = "";
        git-hooks.follows = "";
        home-manager.follows = "";
        nix-darwin.follows = "";
        nuschtosSearch.follows = "";
        treefmt-nix.follows = "";
      };
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem = { self', pkgs, system, ... }:
        let
          nixvim = {
            lib = inputs.nixvim.lib.${system};
            pkgs = inputs.nixvim.legacyPackages.${system};

            module = {
              inherit pkgs;
              module = import ./modules;
            };
          };
        in
        {
          packages = {
            default = self'.packages.neovim;
            neovim = nixvim.pkgs.makeNixvimWithModule nixvim.module;
          };

          checks.default = nixvim.lib.check.mkTestDerivationFromNixvimModule nixvim.module;

          formatter = pkgs.nixpkgs-fmt;
        };
    };
}
