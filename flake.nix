{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    nix-gleam.url = "github:arnarg/nix-gleam";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    nix-gleam,
    ...
  }: (
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nix-gleam.overlays.default
        ];
      };
    in {
      packages.default = pkgs.callPackage ./package.nix {};
    })
  );
}