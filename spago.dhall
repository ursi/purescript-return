let testDependencies = [ "assert", "exceptions" ]

in  { name = "return"
    , dependencies = [ "mason-prelude" ] # testDependencies
    , packages = ./packages.dhall
    , sources = [ "src/**/*.purs", "test/**/*.purs" ]
    , repository = "https://github.com/ursi/purescript-return.git"
    , license = "BSD-3-Clause"
    }
