{ ps-pkgs, licenses, ... }:
  with ps-pkgs;
  { version = "0.1.4";

    dependencies =
      [ foldable-traversable
        point-free
        prelude
      ];

    pursuit =
      { name = "return";
        repo = "https://github.com/ursi/purescript-return.git";
        license = licenses.bsd3;
      };
  }
