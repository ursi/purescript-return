{ ps-pkgs, ... }:
  with ps-pkgs;
  { version = "0.1.1";
    dependencies =
      [ foldable-traversable
        point-free
        prelude
      ];
  }
