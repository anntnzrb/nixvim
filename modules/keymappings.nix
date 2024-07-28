{
  config = {
    keymaps =
      let
        mkKeymaps = with builtins; mode: mappings:
          concatMap
            (desc:
              let
                keyActions = mappings.${desc};
              in
              map
                (key: {
                  inherit mode key;
                  action = keyActions.${key};
                  options = {
                    silent = true;
                    inherit desc;
                  };
                })
                (attrNames keyActions)
            )
            (attrNames mappings);

        normal = {
          "Clear highlights" = { "<ESC>" = ":nohlsearch<CR>"; };
          "Format paragraph" = { "Q" = "gqq"; };

          # navigation
          "Scroll half page up & center" = { "<C-u>" = "<C-u>zz"; };
          "Scroll half page down & center" = { "<C-d>" = "<C-d>zz"; };

          # buffers
          "Select whole buffer" = { "<C-x>h" = "ggVG"; };
          "Kill current buffer" = { "<leader>bk" = ":bdelete<CR>"; };
          "Switch to next buffer" = { "<leader>b[" = ":bnext<CR>"; };
          "Switch to previous buffer" = { "<leader>b]" = ":bprev<CR>"; };
        };

        insert = {
          "Center cursor while in insert mode" = { "<C-z><C-z>" = "<C-o>zz"; };
        };
      in
      mkKeymaps "n" normal ++ mkKeymaps "i" insert;
  };
}
