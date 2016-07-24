{ pkgs ? import <nixpkgs> {} }:

let
  inherit (pkgs) haskell pstree;
  example = pkgs.haskellPackages.callPackage ./. {};

  addRuntimeDependency = drv: x: addRuntimeDependencies drv [x];
  addRuntimeDependencies = drv: xs: haskell.lib.overrideCabal drv (drv: {
    buildDepends = (drv.buildDepends or []) ++ [ pkgs.makeWrapper ];
    postInstall = ''
      ${drv.postInstall or ""}

      for exe in "$out/bin/"* ; do
        wrapProgram "$exe" --prefix PATH ":" \
          ${pkgs.lib.makeBinPath xs}
      done
    '';
  });

in addRuntimeDependency example pstree
