_: {
  plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;

    settings = {
      keymap = {
        preset = "default";
        "<CR>" = [
          "accept"
          "fallback"
        ];
        "<Tab>" = [
          "select_next"
          "snippet_forward"
          "fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
          "snippet_backward"
          "fallback"
        ];
      };

      completion = {
        documentation.auto_show = true;
        list.selection = {
          preselect = false;
          auto_insert = false;
        };
        list.cycle = {
          from_bottom = true;
          from_top = true;
        };
      };

      signature.enabled = true;
    };
  };
}
