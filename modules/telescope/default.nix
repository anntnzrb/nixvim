{
  config = {
    plugins.telescope = {
      enable = true;

      keymapsSilent = true;
      keymaps = {
        # files
        "<leader>ff" = { action = "find_files"; desc = "Search files"; };
        "<leader><space>" = { action = "git_files"; desc = "[Git] Search files"; };
        "<leader>," = { action = "oldfiles"; desc = "Search recent files"; };

        # searching
        "<leader>sg" = { action = "live_grep"; desc = "[Project] Grep Recursively"; };
        "<leader>ss" = { action = "current_buffer_fuzzy_find"; desc = "[Buffer] Search"; };
        "<leader>sr" = { action = "registers"; desc = "List registers"; };
        "<leader>s:" = { action = "command_history"; desc = "List recently executed commands"; };
        "<M-x>" = { action = "commands"; desc = "List command"; };

        # buffers
        "<leader>bb" = { action = "buffers"; desc = "List buffers"; };
        "<leader>b." = { action = "filetypes"; desc = "Set buffer filetype"; };

        # code
        "<leader>cx" = { action = "diagnostics"; desc = "List diagnostics"; };

        # help
        "<leader>hk" = { action = "keymaps"; desc = "List keymaps"; };
        "<leader>ha" = { action = "autocommands"; desc = "List autocommands"; };
        "<leader>hv" = { action = "vim_options"; desc = "List Vim options"; };
      };
    };
  };
}
