_: {
  luaLoader.enable = true; # faster Lua module loading

  performance = {
    # fewer RTP entries
    combinePlugins.enable = true;

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
