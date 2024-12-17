{
  config = {
    plugins.lualine = {
      enable = true;
      gitPackage = null;

      settings = {
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            "branch"
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];

          lualine_x = [ "filetype" ];
          lualine_y = [ ];
          lualine_z = [ "location" ];
        };
      };
    };
  };
}
