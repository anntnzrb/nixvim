{
  config = {
    plugins = {
      fugitive.enable = true;

      gitsigns = {
        enable = true;

        settings = {
          update_debounce = 500;
          current_line_blame = false;
        };
      };
    };

    keymaps = [
      {
        key = "<leader>gg";
        action = ":Git<CR>";
        options = {
          silent = true;
          desc = "Git: Status";
        };
      }
      {
        key = "<leader>gp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {
          silent = true;
          desc = "Git: Preview hunk";
        };
      }
      {
        key = "<leader>gb";
        action = ":Gitsigns toggle_current_line_blame<CR>";
        options = {
          silent = true;
          desc = "Git: Toggle current line blame";
        };
      }
    ];
  };
}
