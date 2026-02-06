_: {
  perSystem =
    { self', ... }:
    {
      apps.default = {
        type = "app";
        program = "${self'.packages.nixvim}/bin/nvim";
        meta = {
          description = "annt's Nixvim";
        };
      };
    };
}
