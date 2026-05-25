{
  inputs,
  ...
}:
{
  perSystem =
    { system, ... }:
    let
      nixvimModule = {
        inherit system;
        module = {
          imports = [ (inputs.import-tree (inputs.self + "/config")) ];
          enableMan = false;
          enablePrintInit = false;
          nixpkgs.source = inputs.nixpkgs;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
      };
      nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
    in
    {
      _module.args.nixvim = {
        inherit nixvimModule nvim;
      };
      packages = {
        default = nvim;
        nixvim = nvim;
        neovim = nvim;
      };
    };
}
