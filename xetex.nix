{ stdenv, emscripten, pkg-config, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  name = "xetex-0.0.1";

  buildInputs = [ emscripten ];

  src = fetchFromGitHub {
    owner = "lyze";
    repo = "xetex-js";
    rev = "af85113f4d4d07cbb1793a98641fc0ca6be435b7";
    sha256 = "0x2g1jqygyr5wiwg4ma1nd7w4ydpy82z9gkcv8vh2v8dn3y58v5m";
  };
}
