{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) haskell pstree;
  example = pkgs.haskellPackages.callPackage ./. {};

  addRuntimeDependencies = drv: xs: haskell.lib.overrideCabal drv (drv: {
    buildDepends = (drv.buildDepends or []) ++ [ pkgs.makeWrapper ];
    postInstall = ''
      for exe in "$out/bin/"* ; do
        wrapProgram "$exe" --prefix PATH ":" \
          ${pkgs.lib.makeBinPath xs}
      done
    '';
  });

in addRuntimeDependencies example [ pstree ]
