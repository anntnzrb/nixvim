_: {
  plugins.lsp.servers = {
    biome.enable = true;
    vtsls = {
      enable = true;
      settings = {
        # use project-local TS if present
        vtsls.autoUseWorkspaceTsdk = true;

        # do not fmt; biome does
        javascript.format.enable = false;
        typescript.format.enable = false;
      };
    };
  };
}
