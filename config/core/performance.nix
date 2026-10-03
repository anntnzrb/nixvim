{
  pkgs,
  ...
}:
{
  luaLoader.enable = true; # faster Lua module loading

  globals = {
    loaded_remote_plugins = 1;
    loaded_spellfile_plugin = 1;
    loaded_tutor_mode_plugin = 1;
  };

  performance = {
    # Combine plugins into a single directory pack to minimize runtime rtp lookups.
    combinePlugins = {
      enable = true;
      # snacks-nvim ships markdown queries that collide with nvim-treesitter in buildEnv;
      # keep it standalone to prevent derivation collisions while packing other plugins.
      standalonePlugins = [ pkgs.vimPlugins.snacks-nvim ];
    };
    # byte-compile config/plugins
    byteCompileLua = {
      enable = true;
      initLua = true;
      configs = true;
      plugins = true;
      nvimRuntime = true;
      luaLib = true;
    };
  };

  withPython3 = false;
  withRuby = false;
  withNodeJs = false;
  withPerl = false;
}
