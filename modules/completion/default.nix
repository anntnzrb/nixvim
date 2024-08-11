{
  plugins = {
    luasnip.enable = true;

    lspkind = {
      enable = true;

      cmp = {
        enable = true;
        # order here DOES NOT matter
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[NVIM]";
          path = "[Path]";
          luasnip = "[Snip]";
          buffer = "[Buf]";
          copilot = "[GH]";
        };
      };
    };

    cmp = {
      enable = true;

      settings = {
        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          completion.keyword_length = 3;
        };

        mapping = {
          "<C-l>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";

          # docs
          "<C-n>" = "cmp.mapping.scroll_docs(4)";
          "<C-p>" = "cmp.mapping.scroll_docs(-4)";

          # cycling
          "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };

        # order matters
        sources = [
          #{ name = "copilot"; }
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            # suggest from other buffers as well
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
      };
    };
  };
}
