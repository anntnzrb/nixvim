{
  config,
  ...
}:
{
  config = {
    plugins = {
      snacks = {
        enable = true;

        settings = {
          bigfile = {
            enabled = true;
            size = 1024 * 1024; # 1MB
          };
          indent.enabled = true;
          notifier.enabled = true;
          scope.enabled = true;
          scroll.enabled = true;
          toggle.enabled = true;
          statuscolumn = {
            enabled = true;

            folds = {
              open = true;
              git_hl = config.plugins.gitsigns.enable;
            };
          };
          words.enabled = true;
        };
      };
    };
  };
}
