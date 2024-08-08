{ ... }:
let 
  pkgs = (import <nixpkgs> { config.allowUnfree = true; });
in {
  packages = with pkgs; [
    hello
    stalwart-mail
    surrealdb
    elasticsearch
  ];
}
