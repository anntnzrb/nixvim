{
  inputs,
  ...
}:
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        settings.formatter.luacheck = {
          command = "${pkgs.luaPackages.luacheck}/bin/luacheck";
          options = [
            "--std"
            "lua51+luajit"
            "--globals"
            "vim"
            "--read-globals"
            "client"
            "bufnr"
            "--"
          ];
          includes = [ "config/**/*.lua" ];
        };

        programs = {
          deadnix = {
            enable = true;
            no-lambda-arg = false;
            no-lambda-pattern-names = false;
            no-underscore = false;
          };
          nixfmt.enable = true;
          statix = {
            enable = true;
            disabled-lints = [ ];
          };
          stylua.enable = true;
        };
      };
    };
}
