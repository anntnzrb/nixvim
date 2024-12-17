{
  config = {
    plugins.conform-nvim = {
      enable = true;

      settings = {
        default_format_opts.lsp_format = "fallback";
        format_after_save.lsp_format = "fallback";
        format_on_save.lsp_format = "fallback";

        # ft's with no cfg'd fmt
        formatters_by_ft."_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
    };

    keymaps = [
      {
        action = ":lua require('conform').format({ async = true })<CR>";
        key = "<leader>cf";
        options = {
          silent = true;
          desc = "Format buffer";
        };
      }
    ];
  };
}
