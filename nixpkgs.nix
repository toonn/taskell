let
  haskellNix = import (builtins.fetchTarball
    ( "https://github.com/input-output-hk/haskell.nix/archive/"
    + "1010a92e6705a9117ee309125088266faad4953d.tar.gz"
    )) { overlays = [ (import ./armv6l-linux.nix) ]; };
in
  haskellNix.pkgs
