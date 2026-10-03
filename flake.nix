{
  description = "annt's Nixvim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ef-themes = {
      url = "github:oonamo/ef-themes.nvim";
      flake = false;
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      eachSystem =
        f: lib.genAttrs lib.systems.flakeExposed (system: f system nixpkgs.legacyPackages.${system});

      nixvimModule = system: {
        inherit system;
        module = {
          imports = lib.fileset.toList (lib.fileset.fileFilter (file: file.hasExt "nix") ./config);
          enableMan = false;
          enablePrintInit = false;
          nixpkgs.source = nixpkgs;
        };
        extraSpecialArgs = { inherit inputs; };
      };

      treefmtEval = eachSystem (_: pkgs: inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {
      packages = eachSystem (
        system: _: {
          default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (nixvimModule system);
        }
      );

      checks = eachSystem (
        system: _: {
          default = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (nixvimModule system);
          treefmt = treefmtEval.${system}.config.build.check self;
        }
      );

      formatter = eachSystem (system: _: treefmtEval.${system}.config.build.wrapper);
    };
}
