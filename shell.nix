let
  my_overlay = import ./overlay.nix;
  pkgs = import  <nixpkgs> { overlays = [ my_overlay ]; };
  in
with pkgs;

mkShell {
  buildInputs = [
    haskellPackages.sv2v
    # This now refers to your custom CIRCT package!
    circt
  ];
}
