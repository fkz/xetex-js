{ stdenv, buildEmscriptenPackage, pkg-config, fetchurl, ... }:

buildEmscriptenPackage {
  name = "xetex-0.0.1";

  configurePhase = ''
    mkdir -p .emscriptencache
    export EM_CACHE=$(pwd)/.emscriptencache
  '';

  src = fetchurl {
    url = "http://downloads.sourceforge.net/project/xetex/source/xetex-0.9999.3.tar.bz2";
    sha256 = "sha256-B0GkBX+Anh9GYXq93zXiVX9NIF5Lfzw4h/MWzubhVOU";
  };

  #src = fetchFromGitHub {
  #  owner = "lyze";
  #  repo = "xetex-js";
  #  rev = "af85113f4d4d07cbb1793a98641fc0ca6be435b7";
  #  sha256 = "sha256-MdpogzEzTJaY5G71wKSQ9c3Oi+ngM87tFHmIOqqMtwg=";
  #};
}
