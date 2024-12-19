{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = false; # wayland (causes trouble with WSL)
        xclip.enable = true; # xorg
      };
    };
  };
}
