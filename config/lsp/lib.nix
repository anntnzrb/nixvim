{ lib, ... }:
let
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

  mkLspDiagnosticKeymaps =
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

  mkLspCommandKeymaps =
    keymaps:
    lib.mapAttrsToList (key: command: {
      inherit key;
      mode = "n";
      action = "<CMD>${command}<CR>";
      options = {
        silent = true;
        desc = "Lsp ${command}";
      };
    }) keymaps;
in
{
  _module.args = {
    inherit
      mkLspBufKeymaps
      mkLspDiagnosticKeymaps
      mkLspCommandKeymaps
      ;
  };
}
