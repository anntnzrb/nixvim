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
          statuscolumn.enabled = true;
          words.enabled = true;
        };
      };
    };
  };
}
