{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true; # wayland
        xclip.enable = true; # xorg
      };
    };
  };
}
