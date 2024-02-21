{
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil_ls = {
      enable = true;
      package = null; # do not install server

      settings.formatting.command = [ "nixpkgs-fmt" ];
    };
  };
}
