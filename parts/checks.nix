{
  inputs,
  ...
}:
{
  perSystem =
    {
      system,
      nixvim,
      ...
    }:
    {
      checks = {
        default = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvim.nixvimModule;
      };
    };
}
