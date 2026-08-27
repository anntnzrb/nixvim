{
  pkgs,
  ...
}:
{
  # Preemptively map Nixvim runtime dependencies to minimal/lightweight variants.
  # When a plugin requests any of these tools, Nixvim uses these packages instead
  # of pulling full-fat default derivations (saving hundreds of MBs in transitive closure).
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
