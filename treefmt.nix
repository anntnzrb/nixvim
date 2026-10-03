_: {
  projectRootFile = "flake.nix";

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
}
