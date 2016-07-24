{ mkDerivation, base, process, protolude, stdenv }:
mkDerivation {
  pname = "nix-haskell-example";
  version = "0.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base process protolude ];
  homepage = "https://github.com/jml/nix-haskell-example#readme";
  description = "Minimal example of runtime executable dependencies with Nix";
  license = stdenv.lib.licenses.asl20;
}
