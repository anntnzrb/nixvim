{ inputs, ... }:
{
  opts = {
    spell = true;
    spelllang = "en_us,es";
  };

  extraFiles = {
    "spell/es.utf-8.spl".source = inputs."vim-spell-es-spl";
    "spell/es.utf-8.sug".source = inputs."vim-spell-es-sug";
  };
}
