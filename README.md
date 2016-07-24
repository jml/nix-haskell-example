I've been struggling for a while to figure out how to make a Nix package of a
Haskell executable that depends on a binary being on the PATH at runtime.

This is an attempt to make a minimal Haskell package that demonstrates the
problem, that others can fix.

## What I want to happen

To have a Nix package for this Haskell binary that includes `pstree` as
propagated build input so that it's available to the Haskell binary at
runtime.

I don't particularly care about `pstree` - I want to able to do this for any
binary.

Ideally, I would be able to do this as separate file which acts on the
generated expression in `default.nix`. That way, I can leave `default.nix`
being auto-generated, which is a nice property.

## Build notes

* `package.yaml` is canonical
* `nix-haskell-example.cabal` generated with `hpack`
* `default.nix` generated with cabal2nix

