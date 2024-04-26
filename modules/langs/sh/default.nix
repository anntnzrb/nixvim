{ config
, pkgs
, ...
}: {
  config = {
    plugins = {
      lsp.servers.bashls.enable = config.plugins.lsp.enable;

      efmls-configs = {
        enable = true;

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

      none-ls.sources = {
        formatting.shfmt = {
          enable = true;
          withArgs = ''
            { extra_args = { "--simplify", "--binary-next-line", "--indent", "4" } }
          '';
        };
      };
    };

    extraPackages = with pkgs; [
      shfmt
      shellcheck
    ];
  };
}
