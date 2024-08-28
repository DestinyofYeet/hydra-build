{ ... }:
let 
  nixpkgs = (import <nixpkgs> {});
  mkBuild = pkgs : packageNames: 
        builtins.listToAttrs (map (name: { inherit name; value = pkgs.${name}; }) packageNames);  

  forAllSystems = function:
    nixpkgs.lib.genAttrs [
      "x86_64-linux"
      "aarch64-linux"
    ]
    (system: function (import <nixpkgs> { inherit system; config.allowUnfree = true; }));

in {
  packages = forAllSystems (pkgs: {

      default = mkBuild pkgs [
      "surrealdb"
      "hello"
      "stalwart-mail"
      "elasticsearch"
      "helix"
      "neovim"
    ];
  });
}
