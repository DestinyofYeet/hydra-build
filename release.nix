{ ... }:
let 
  pkgs = (import <nixpkgs> { config.allowUnfree = true; });
in {
  hello = pkgs.hello;
  stalwart-cli = pkgs.stalwart-mail;
  surrealdb = pkgs.surrealdb
  elasticsearch = pkgs.elasticsearch;
}
