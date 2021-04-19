{ ps-pkgs, ... }:
  with ps-pkgs;
  { version = "0.1.2";
    dependencies =
      [ foldable-traversable
        point-free
        prelude
      ];
  }
