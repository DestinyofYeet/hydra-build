{ ... }:
let 
  pkgs = (import <nixpkgs> {});
in {
  pkgs.config.allowUnfree = true;

  hello = pkgs.hello;
  stalwart-cli = pkgs.stalwart-mail;
  surrealdb = pkgs.surrealdb;
}
