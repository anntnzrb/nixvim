{
  description = "annt's Nixvim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    import-tree.url = "github:vic/import-tree/main";
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts/main";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ef-themes = {
      url = "github:oonamo/ef-themes.nvim";
      flake = false;
    };
    vim-spell-es-spl = {
      url = "file+https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.spl";
      flake = false;
    };
    vim-spell-es-sug = {
      url = "file+https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.sug";
      flake = false;
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports = [ (inputs.import-tree ./parts) ];
    };
}
