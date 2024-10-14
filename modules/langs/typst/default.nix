# NOTE: check for a future lua-based solution
{
  config,
  ...
}:
{
  config = {
    plugins = {
      typst-vim = {
        enable = true;

        settings = {
          conceal_math = 1;
        };
      };

      lsp.servers.typst_lsp.enable = config.plugins.lsp.enable;
    };
  };
}
