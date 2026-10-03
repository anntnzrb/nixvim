{ pkgs, ... }:
let
  spellFile =
    ext: hash:
    pkgs.fetchurl {
      url = "https://ftp.nluug.nl/pub/vim/runtime/spell/es.utf-8.${ext}";
      inherit hash;
    };
in
{
  opts = {
    spell = true;
    spelllang = "en_us,es";
  };

  extraFiles = {
    "spell/es.utf-8.spl".source = spellFile "spl" "sha256-ljY3rJJc+KUb8gf6w5LWtMaXlXEdzC1ICbeIRq42e+M=";
    "spell/es.utf-8.sug".source = spellFile "sug" "sha256-5w80eKplPCrpBQhjKPv/TkO9ZG12U0ZF9QplNEgBvWw=";
  };
}
