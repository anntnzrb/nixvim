_: {
  config = {
    plugins.lsp.servers = {
      pyright = {
        enable = true;
        package = null;
        settings = {
          pyright = {
            # Using Ruff's import organizer
            disableOrganizeImports = true;
          };
          python = {
            analysis = {
              # Ignore all files for analysis to exclusively use Ruff for linting
              ignore = "*";
            };
          };
        };
      };

      ruff = {
        enable = true;
        package = null;
        settings = {
          trace = "messages";
          init_options = {
            settings = {
              logLevel = "debug";
            };
          };
        };
      };
    };
  };
}
