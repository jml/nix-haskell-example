{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) haskell pstree;
  example = pkgs.haskellPackages.callPackage ./. {};

in haskell.lib.overrideCabal example (drv: {
  buildDepends = [ pkgs.makeWrapper ];
  postInstall = ''
    wrapProgram "$out/bin/nix-haskell-example" \
      --prefix PATH ":" "${pstree}/bin"
  '';
})
