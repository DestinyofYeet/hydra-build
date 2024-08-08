{ ... }:
let 
  pkgs = (import <nixpkgs> {});
in {
  nixpkgs.config.allowUnfree = true;

  hello = pkgs.hello;
  stalwart-cli = pkgs.stalwart-mail;
  surrealdb = pkgs.surrealdb;
}
