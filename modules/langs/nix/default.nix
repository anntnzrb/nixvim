{
  imports = [ ./nil.nix ];
  #imports = [ ./nixd.nix ];

  config.plugins = {
    nix.enable = true;
    conform-nvim.settings.formatters_by_ft.nix = [ "nixfmt" ];
    none-ls.sources.diagnostics = {
      deadnix.enable = true;
      statix.enable = true;
    };
  };
}
