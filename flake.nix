{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    mkBuild = packageNames: 
        builtins.listToAttrs (map (name: { inherit name; value = pkgs.${name}; }) packageNames);  
  in {
    packages.${system} = mkBuild [
      "surrealdb"
      "hello"
      "stalwart-mail"
      "elasticsearch"
    ];
  };
}
