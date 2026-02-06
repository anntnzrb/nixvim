{
  pkgs,
  ...
}:
{
  extraPackages = [ pkgs.nixfmt ];

  plugins.lsp.servers.nil_ls.enable = true;
}
