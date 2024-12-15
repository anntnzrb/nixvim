{
  pkgs,
  ...
}:
{
  config.extraPlugins = [ pkgs.vimPlugins.haskell-tools-nvim ];
}
