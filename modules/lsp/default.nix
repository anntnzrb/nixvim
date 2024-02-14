{
  config = {
    plugins = {
      lsp = {
        enable = true;

        keymaps = {
          silent = true;

          diagnostic = {
            "<leader>c]]" = "goto_next";
            "<leader>c[[" = "goto_prev";
          };

          lspBuf = {
            K = "hover";
            "<leader>cgD" = "references";
            "<leader>cgd" = "definition";
            "<leader>cgi" = "implementation";
            "<leader>cgt" = "type_definition";

            "<leader>cr" = "rename";
            "<leader>ca" = "code_action";
            "<leader>cf" = "format";
          };
        };
      };
    };
  };
}
