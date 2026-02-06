{
  lib,
  mkPrefixLeader,
  ...
}:
let
  prefixed = mkPrefixLeader "b";
  toKeymaps = lib.mapAttrsToList (key: value: { inherit key; } // value);
in
{
  keymaps =
    lib.nixvim.keymaps.mkKeymaps
      {
        mode = "n";
        options.silent = true;
      }
      (
        toKeymaps (prefixed {
          b = {
            action = "<cmd>FzfLua buffers<CR>";
            options.desc = "Switch buffer";
          };
          k = {
            action = "<cmd>bdelete<CR>";
            options.desc = "Kill buffer";
          };
          n = {
            action = "<cmd>bnext<CR>";
            options.desc = "Next buffer";
          };
          p = {
            action = "<cmd>bprevious<CR>";
            options.desc = "Previous buffer";
          };
          s = {
            action = "<cmd>write<CR>";
            options.desc = "Save buffer";
          };
          r = {
            action = "<cmd>edit<CR>";
            options.desc = "Revert buffer";
          };
        })
      );
}
