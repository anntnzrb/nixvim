{
  imports = [ ./nil.nix ];
  #imports = [ ./nixd.nix ];

  config = {
    plugins.nix.enable = true;

  };
}
