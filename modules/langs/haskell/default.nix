{
  config,
  ...
}:
{
  config = {
    plugins.lsp.servers.hls = {
      inherit (config.plugins.lsp) enable;
      package = null;
      installGhc = false;

      onAttach.function = ''
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      '';
    };

    plugins.conform-nvim.settings.formatters_by_ft.haskell = [ "fourmolu" ];
  };
}
