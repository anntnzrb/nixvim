{
  config = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # ---------------------------------------------------------------------
        # files
        # ---------------------------------------------------------------------
        "<leader>ff" = {
          action = "find_files";
          options = {
            desc = "Search files";
          };
        };
        "<leader><space>" = {
          action = "git_files";
          options = {
            desc = "[Git] Search files";
          };
        };

        # ---------------------------------------------------------------------
        # searching
        # ---------------------------------------------------------------------
        "<leader>sg" = {
          action = "live_grep";
          options = {
            desc = "[Project] Grep Recursively";
          };
        };
        "<leader>ss" = {
          action = "current_buffer_fuzzy_find";
          options = {
            desc = "[Buffer] Search";
          };
        };
        "<leader>s:" = {
          action = "command_history";
          options = {
            desc = "List recently executed commands";
          };
        };
        "<M-x>" = {
          action = "commands";
          options = {
            desc = "List command";
          };
        };

        # ---------------------------------------------------------------------
        # buffers
        # ---------------------------------------------------------------------
        "<leader>bb" = {
          action = "buffers";
          options = {
            desc = "List buffers";
          };
        };

        # ---------------------------------------------------------------------
        # code
        # ---------------------------------------------------------------------
        "<leader>cx" = {
          action = "diagnostics";
          options = {
            desc = "List diagnostics";
          };
        };

        # ---------------------------------------------------------------------
        # help
        # ---------------------------------------------------------------------
        "<leader>hk" = {
          action = "keymaps";
          options = {
            desc = "List keymaps";
          };
        };
        "<leader>ha" = {
          action = "autocommands";
          options = {
            desc = "List autocommands";
          };
        };
        "<leader>hv" = {
          action = "vim_options";
          options = {
            desc = "List Vim options";
          };
        };
      };
    };
  };
}
