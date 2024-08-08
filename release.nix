{ ... }:
let 
  pkgs = (import <nixpkgs> { config.allowUnfree = true; });

  mkPkg = name: {
    name = pkgs.name;
  }

in {
  mkPkg hello;
  mkPkg stalwart-cli;
  mkPkg surrealdb;
  mkPkg elasticsearch;
}
