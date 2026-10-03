{ pkgs, ... }:
{
  plugins.snacks = {
    enable = true;

    # upstream tests/ is 94% of the plugin size
    package = pkgs.vimPlugins.snacks-nvim.overrideAttrs (old: {
      postInstall = (old.postInstall or "") + ''
        rm -rf "$out/tests"
      '';
    });

    settings = {
      bigfile.enabled = true;
      quickfile.enabled = true;
      bufdelete.enabled = true;
      notifier.enabled = false;
      statuscolumn.enabled = false;
      words.enabled = false;
    };
  };
}
