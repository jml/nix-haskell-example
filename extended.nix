{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) haskell pstree;
  example = pkgs.haskellPackages.callPackage ./. {};

in haskell.lib.overrideCabal example (drv: {
  propagatedBuildInputs = [ pstree ];
})
