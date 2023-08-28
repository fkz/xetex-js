{ buildEmscriptenPackage, pkg-config, autoconf, automake, libtool, gnumake, libxml2, nodejs, openjdk, json_c, fetchurl, ... }:

buildEmscriptenPackage rec {
  name = "xetex";

  buildInputs = [ pkg-config autoconf automake libtool gnumake libxml2 nodejs openjdk json_c ];

  nativeBuildInputs = [ pkg-config ];

  configurePhase = ''
  '';

  buildPhase = ''
    ./build.sh
  '';

  src = fetchurl {
    url = "http://downloads.sourceforge.net/project/xetex/source/xetex-0.9999.3.tar.bz2";
    sha256 = "sha256-B0GkBX+Anh9GYXq93zXiVX9NIF5Lfzw4h/MWzubhVOU";
  };
}