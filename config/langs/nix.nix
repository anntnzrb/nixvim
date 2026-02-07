{
  pkgs,
  ...
}:
{
  extraPackages = [ pkgs.nixfmt ];

  lsp.servers.nil_ls.enable = true;
}
