# note: when using nix-shell, run "configurePhase" otherwise you'll have missing headers

with import <nixpkgs> { };

let
  buildPecl = import <nixpkgs/pkgs/build-support/build-pecl.nix> {
    inherit php;
    inherit stdenv autoreconfHook fetchurl;
  };
in

buildPecl rec {
  name = "psr-${version}";
  version = "0.3.0RC4";
  sha256 = "076r724gvai2fbzd7gg2hzpf298ibcpiamdnsm9wpk3cgn7vsa1n";
  doCheck = true;
  checkTarget = "test";
  checkFlagsArray = ["REPORT_EXIT_STATUS=1" "NO_INTERACTION=1" "TEST_PHP_DETAILED=1"];
}

