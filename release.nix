{ ... }:
let 
  pkgs = (import <nixpkgs> {});
in {
  hello = pkgs.hello;
  stalwart-cli = pkgs.stalwart-mail;
  surreal-db = pkgs.surreal-db;
}
