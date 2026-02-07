{
  inputs,
  lib,
  mkLuaTextFile,
  pkgs,
  ...
}:
let
  efThemes = pkgs.vimUtils.buildVimPlugin {
    pname = "ef-themes-nvim";
    version = if inputs.ef-themes ? rev then lib.substring 0 7 inputs.ef-themes.rev else "unknown";
    src = inputs.ef-themes;
  };
in
{
  # Prevent module defaults from setting a static colorscheme.
  colorscheme = lib.mkForce null;

  colorschemes = {
    catppuccin.enable = true;
    gruvbox-material.enable = true;
    kanagawa.enable = true;
    modus.enable = true;
    tokyonight.enable = true;
  };

  # Time-based theme selection runs after module-generated lua.
  extraConfigLua = lib.mkAfter (mkLuaTextFile "daynight");

  extraPlugins = [ efThemes ];
}
