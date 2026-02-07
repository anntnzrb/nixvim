{
  lib,
  mkLuaFile,
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "f";
in
{
  plugins.fzf-lua = {
    enable = true;

    settings.actions.files = lib.nixvim.listToUnkeyedAttrs [ true ] // {
      "ctrl-o" = {
        fn = mkLuaFile "pickers/fzf-lua/copy-path";
        exec_silent = true;
      };
    };

    keymaps = {
      "<leader><space>" = {
        action = "files";
        options.desc = "Find files";
      };
    }
    // prefixed {
      c = {
        action = "colorschemes";
        settings.colors = mkLuaFile "pickers/fzf-lua/colorschemes";
        options.desc = "Colorschemes";
      };
      g = {
        action = "live_grep";
        options.desc = "Live grep";
      };
      b = {
        action = "buffers";
        options.desc = "Buffers";
      };
      h = {
        action = "help_tags";
        options.desc = "Help tags";
      };
      r = {
        action = "resume";
        options.desc = "Resume picker";
      };
    };
  };
}
