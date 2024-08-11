{
  config = {
    plugins.copilot-lua = {
      enable = true;

      suggestion = {
        enabled = true;
        autoTrigger = true;
        keymap = {
          acceptLine = "<S-Tab>";
        };
      };

      panel.enabled = false;

      filetypes = {
        "." = true;

        markdown = true;

        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
      };
    };

    keymaps = [
      {
        action = ":Copilot toggle<CR>";
        key = "<leader>\\\\";
        options = {
          silent = true;
          desc = "Toggle Copilot";
        };
      }
    ];
  };
}
