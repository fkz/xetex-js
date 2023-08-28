{ stdenv, emscripten, pkg-config, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  name = "xetex-0.0.1";

  buildInputs = [ emscripten ];

  src = fetchFromGitHub {
    owner = "lyze";
    repo = "xetex-js";
    rev = "af85113f4d4d07cbb1793a98641fc0ca6be435b7";
    sha256 = "sha256-tWxU/LANbQE32my+9AXyt3nCT7NBVfJ45CX757EMT3Q=";
  };
}
