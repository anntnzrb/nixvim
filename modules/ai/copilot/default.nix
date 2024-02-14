{
  config = {
    plugins.copilot-lua = {
      enable = true;

      # disabled in favor of nvim-cmp
      suggestion.enabled = false;
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
  };
}
