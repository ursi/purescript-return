let testDependencies = [ "assert", "exceptions" ]

in  { name = "my-project"
    , dependencies = [ "mason-prelude" ] # testDependencies
    , packages = ./packages.dhall
    , sources = [ "src/**/*.purs", "test/**/*.purs" ]
    }
