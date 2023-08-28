{ stdenv, buildEmscriptenPackage, pkg-config, fetchFromGitHub, curl, ... }:

buildEmscriptenPackage {
  name = "xetex-0.0.1";

  buildInputs = [ curl ];

  src = fetchFromGitHub {
    owner = "lyze";
    repo = "xetex-js";
    rev = "af85113f4d4d07cbb1793a98641fc0ca6be435b7";
    sha256 = "sha256-MdpogzEzTJaY5G71wKSQ9c3Oi+ngM87tFHmIOqqMtwg=";
  };
}
