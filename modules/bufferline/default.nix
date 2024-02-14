{
  config = {
    plugins.bufferline = {
      enable = true;
      maxNameLength = 16;
      maxPrefixLength = 16;
      alwaysShowBufferline = true;

      themable = true;
      colorIcons = true;
      showBufferIcons = true;

      showCloseIcon = false;
      showBufferCloseIcons = false;
      bufferCloseIcon = null;

      diagnostics = "nvim_lsp";
      diagnosticsUpdateInInsert = true;
    };
  };
}
