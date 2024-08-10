{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    mkBuild = pkgs : packageNames: 
        builtins.listToAttrs (map (name: { inherit name; value = pkgs.${name}; }) packageNames);  

    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ]
      (system: function nixpkgs.legacyPackages.${system});

  in {
    packages = forAllSystems (pkgs: {

        default = mkBuild pkgs [
        "surrealdb"
        "hello"
        "stalwart-mail"
        "elasticsearch"
      ];
    });

    hydraJobs = {
      inherit (self)
        packages;
    };
  };
}
