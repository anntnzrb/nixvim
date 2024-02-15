# NOTE: check for a future lua-based solution
{
  config = {
    plugins = {
      typst-vim = {
        enable = true;

        concealMath = true; # REVIEW: perf
      };

      lsp.servers.typst-lsp = {
        enable = true;
      };
    };
  };
}
