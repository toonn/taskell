{ pkgs ? import ./nixpkgs.nix
, cross ? "gnu32"
}:
let crossPkgs = pkgs.pkgsCross.${cross};
in (crossPkgs.haskell-nix.project {
  src = pkgs.haskell-nix.cleanSourceHaskell {
    name = "taskell-source";
    src = ./.;
  };

  modules = [
    # haddock can't find haddock m(
    { doHaddock = false; }
    # Remove Cabal from nonReinstallablePkgs to be able to pick Cabal-3.2.
    { nonReinstallablePkgs = [
      "rts" "ghc-heap" "ghc-prim" "integer-gmp" "integer-simple" "base"
      "deepseq" "array" "ghc-boot-th" "pretty" "template-haskell"
      # ghcjs custom packages
      "ghcjs-prim" "ghcjs-th"
      "ghc-boot"
      "ghc" "Win32" "array" "binary" "bytestring" "containers"
      "directory" "filepath" "ghc-boot" "ghc-compact" "ghc-prim"
      # "ghci" "haskeline"
      "hpc"
      "mtl" "parsec" "process" "text" "time" "transformers"
      "unix" "xhtml"
      # "stm" "terminfo"
    ]; }
  ];
}).taskell.components.exes.taskell
