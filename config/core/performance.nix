{
  pkgs,
  ...
}:
{
  dependencies = {
    curl.package = pkgs.curlMinimal;
    fish.package = pkgs.fishMinimal;
    git.package = pkgs.gitMinimal;

    nodejs.package = pkgs.nodejs-slim; # REVIEW: might break
    imagemagick.package = pkgs.imagemagick_light; # REVIEW: might break

    "util-linux".package = pkgs.util-linuxMinimal;
  };

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
