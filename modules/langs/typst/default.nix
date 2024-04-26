# NOTE: check for a future lua-based solution
{ config
, ...
}: {
  config = {
    plugins = {
      typst-vim = {
        enable = true;

        settings = {
          conceal_math = true; # REVIEW: perf
        };
      };

      lsp.servers.typst-lsp.enable = config.plugins.lsp.enable;
    };
  };
}
