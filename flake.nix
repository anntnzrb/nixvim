{
  description = "annt's nixified neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default/main";

    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";

      # optional inputs
      inputs.devshell.follows = "";
      inputs.flake-compat.follows = "";
      inputs.git-hooks.follows = "";
      inputs.home-manager.follows = "";
      inputs.nix-darwin.follows = "";
      inputs.nuschtosSearch.follows = "";
      inputs.treefmt-nix.follows = "";
    };

    # misc
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;

      perSystem = { self', pkgs, system, ... }:
        let
          nixvim = inputs.nixvim;
          nixvimLib = nixvim.lib.${system};
          nixvimPkgs = nixvim.legacyPackages.${system};

          nixvimModule = {
            inherit pkgs;
            module = import ./modules;
          };
        in
        {
          packages = {
            default = self'.packages.neovim;
            neovim = nixvimPkgs.makeNixvimWithModule nixvimModule;
          };

          checks.default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

          formatter = pkgs.nixpkgs-fmt;
        };
    };
}
