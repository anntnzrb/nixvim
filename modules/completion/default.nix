{
  config = {
    plugins = {
      nvim-cmp = {
        enable = true;

        snippet.expand = "luasnip";
        mappingPresets = [ "insert" ];
        preselect = "None";

        sources = [
          { name = "copilot"; groupIndex = 1; priority = 4; }
          { name = "nvim_lsp"; groupIndex = 1; priority = 3; }
          { name = "path"; groupIndex = 1; }
          { name = "buffer"; groupIndex = 2; priority = 2; }
          {
            name = "luasnip";
            option.show_autosnippets = true;
            groupIndex = 1;
            priority = 5;
          }
        ];

        mapping =
          let
            prevNextCandidate = candidate: {
              modes = [ "i" "s" ];
              action = ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_${candidate}_item()
                  elseif require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                  else
                    fallback()
                  end
                end
              '';
            };
          in
          {
            "<C-l>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";

            # docs
            "<C-n>" = "cmp.mapping.scroll_docs(4)";
            "<C-p>" = "cmp.mapping.scroll_docs(-4)";

            "<C-j>" = prevNextCandidate "next";
            "<C-k>" = prevNextCandidate "prev";
          };
      };

      luasnip.enable = true;
    };
  };
}

