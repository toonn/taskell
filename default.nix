{ pkgs ? import ./nixpkgs.nix
, cross ? "gnu32"
}:
let crossPkgs = pkgs.pkgsCross.${cross};
in (crossPkgs.haskell-nix.project {
  src = pkgs.haskell-nix.cleanSourceHaskell {
    name = "taskell-source";
    src = ./.;
  };
}).taskell.components.exes.taskell
