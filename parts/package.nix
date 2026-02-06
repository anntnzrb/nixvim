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
        module = inputs.import-tree (inputs.self + "/config");
        extraSpecialArgs = {
          inherit inputs;
          mkLuaFile = name: (inputs.self + "/config/lua/${name}.lua");
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
