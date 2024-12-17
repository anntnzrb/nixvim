{
  config = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;

        keymaps = {
          silent = true;

          diagnostic = {
            "<leader>c[[" = {
              action = "goto_prev";
              desc = "Go to previous diagnostic";
            };
            "<leader>c]]" = {
              action = "goto_next";
              desc = "Go to next diagnostic";
            };
          };

          lspBuf = {
            "K" = {
              action = "hover";
              desc = "Hover at symbol";
            };
            "<leader>cgD" = {
              action = "references";
              desc = "Go to references";
            };
            "<leader>cgd" = {
              action = "definition";
              desc = "Go to definition";
            };
            "<leader>cgi" = {
              action = "implementation";
              desc = "Go to implementation";
            };
            "<leader>cgt" = {
              action = "type_definition";
              desc = "Go to type definition";
            };

            "<leader>cr" = {
              action = "rename";
              desc = "Refactor symbol at point";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "List code actions";
            };
          };
        };
      };

      lsp-format.enable = true;

      lspkind.cmp.menu.nvim_lsp = "[LSP]";

      cmp.settings.sources = [
        {
          name = "nvim_lsp";
          priority = 2;
        }
      ];

      none-ls = {
        enable = true;
        enableLspFormat = true;
      };
    };
  };
}
