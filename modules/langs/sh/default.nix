{ config
, pkgs
, ...
}: {
  config = {
    plugins = {
      lsp.servers.bashls.enable = config.plugins.lsp.enable;

      efmls-configs = {
        enable = true;
        externallyManagedPackages = "all"; # `all` to install no packages

        setup =
          let
            shCfg = {
              formatter = "shfmt";
              linter = "shellcheck";
            };
          in
          {
            bash = shCfg;
            sh = shCfg;
          };
      };

      none-ls.sources.formatting.shfmt = {
        enable = true;
        package = pkgs.shfmt;
        settings = {
          extra_args = [
            "--simplify"
            "--binary-next-line"
            "--indent"
            "4"
          ];
        };
      };
    };

    extraPackages = with pkgs; [
      shellcheck
    ];
  };
}
