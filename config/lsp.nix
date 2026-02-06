{
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "c";
in
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;

    keymaps = {
      silent = true;
      lspBuf = prefixed {
        d = "definition";
        D = "references";
        i = "implementation";
        t = "type_definition";
        h = "hover";
        r = "rename";
        a = "code_action";
        f = "format";
      };
      diagnostic = prefixed {
        k = "goto_prev";
        j = "goto_next";
      };
    };
  };
}
