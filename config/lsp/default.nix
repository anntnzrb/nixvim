{
  mkLspBufKeymaps,
  mkLspCommandKeymaps,
  mkLspDiagnosticKeymaps,
  mkLuaTextFile,
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "c";
in
{
  plugins.lspconfig.enable = true;

  lsp = {
    inlayHints.enable = true;

    servers."*".config.root_markers = [ ".git" ];

    onAttach = mkLuaTextFile "lsp/on-attach";

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
      ++ mkLspDiagnosticKeymaps (prefixed {
        k = "goto_prev";
        j = "goto_next";
      })
      ++ mkLspCommandKeymaps (prefixed {
        s = "LspStart";
        x = "LspStop";
        R = "LspRestart";
      });
  };
}
