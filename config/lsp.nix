{
  lib,
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "c";

  mkLspBufKeymaps =
    keymaps:
    lib.mapAttrsToList (key: lspBufAction: {
      inherit key lspBufAction;
      mode = "n";
      options = {
        silent = true;
        desc = "Lsp buf ${lspBufAction}";
      };
    }) keymaps;

  mkDiagnosticKeymaps =
    keymaps:
    lib.mapAttrsToList (key: action: {
      inherit key;
      mode = "n";
      action = lib.nixvim.mkRaw "vim.diagnostic.${action}";
      options = {
        silent = true;
        desc = "Lsp diagnostic ${action}";
      };
    }) keymaps;
in
{
  plugins.lspconfig.enable = true;

  lsp = {
    inlayHints.enable = true;
    keymaps =
      mkLspBufKeymaps (prefixed {
        d = "definition";
        D = "references";
        i = "implementation";
        t = "type_definition";
        h = "hover";
        r = "rename";
        a = "code_action";
        f = "format";
      })
      ++ mkDiagnosticKeymaps (prefixed {
        k = "goto_prev";
        j = "goto_next";
      });
  };
}
