{ ... }:
let 
  pkgs = (import <nixpkgs> {});
in {
  hello = pkgs.hello;
  stalwart-cli = pkgs.stalwart-mail;
}
