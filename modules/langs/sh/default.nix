# The following module is a bit of an edge case.
# As shell scripting is present everywhere, it does not hurt to aid
# with some tools, such as LSP and a formatter.

{
  config = {
    plugins = {
      lsp.servers.bashls = {
        enable = true;
      };
      none-ls.sources = {
        formatting.shfmt = {
          enable = true;
          withArgs = ''
            { extra_args = { "--simplify", "--binary-next-line", "--indent", "8" } }
          '';
        };
        code_actions.shellcheck.enable = true;
        diagnostics.shellcheck.enable = true;
      };
    };
  };
}
