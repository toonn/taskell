{ pkgs ? import ./nixpkgs.nix
, compiler-nix-name ? "ghc8102"
, cross ? "gnu32"
}:
let crossPkgs = pkgs.pkgsCross.${cross};
in (crossPkgs.haskell-nix.project {
  inherit compiler-nix-name;

  src = pkgs.haskell-nix.cleanSourceHaskell {
    name = "taskell-source";
    src = ./.;
  };
}).taskell.components.exes.taskell
