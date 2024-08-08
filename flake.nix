{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfiguration.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
    };
  };

  hydraJobs = {
    pkgs = with outputs.packages; [
      hello
      stalwart-mail
    ];
  };
}
