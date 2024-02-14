{
  config = {
    plugins.nix.enable = true;

    plugins.lsp.servers.nil_ls = {
      enable = true;
      installLanguageServer = false;

      settings.formatting.command = [ "nixpkgs-fmt" ];
    };
  };
}
