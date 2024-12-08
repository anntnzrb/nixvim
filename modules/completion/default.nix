{
  plugins = {
    lspkind = {
      enable = true;

      cmp = {
        enable = true;
        # order here DOES NOT matter
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[NVIM]";
          path = "[Path]";
          buffer = "[Buf]";
        };
      };
    };

    cmp = {
      enable = true;

      settings = {
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
          { name = "path"; }
          { name = "nvim_lsp"; }
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
