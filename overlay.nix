# This overlay injects our custom CIRCT package into the package set.
final: prev: {
  # We are overriding the 'circt' attribute in the final package set.
  circt = final.callPackage ./circt-fsm.nix {
    # Nix automatically passes in most dependencies, but we need to
    # explicitly pass the original `circt-llvm` derivation from nixpkgs
    # because our custom derivation depends on it for metadata.
    circt-llvm = prev.circt-llvm;
  };
}
