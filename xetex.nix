{ pkgs, pkg-config, ... }:

(pkgs.xetex.override {
  stdenv = pkgs.emscriptenStdenv;
}).overrideAttrs
(old: rec {
  buildInputs = old.buildInputs ++ [ pkg-config ];
  # we need to reset this setting!
  env = (old.env or { }) // { NIX_CFLAGS_COMPILE = ""; };
  configurePhase = ''
    # FIXME: Some tests require writing at $HOME
    HOME=$TMPDIR
    runHook preConfigure

    #export EMCC_DEBUG=2
    emconfigure ./configure --prefix=$out --shared

    runHook postConfigure
  '';
  dontStrip = true;
  outputs = [ "out" ];
  buildPhase = ''
    emmake make
  '';
  installPhase = ''
    emmake make install
  '';
  # checkPhase = ''
  #   echo "================= testing zlib using node ================="

  #   echo "Compiling a custom test"
  #   set -x
  #   emcc -O2 -s EMULATE_FUNCTION_POINTER_CASTS=1 test/example.c -DZ_SOLO \
  #   libz.so.${old.version} -I . -o example.js

  #   echo "Using node to execute the test"
  #   ${pkgs.nodejs}/bin/node ./example.js

  #   set +x
  #   if [ $? -ne 0 ]; then
  #     echo "test failed for some reason"
  #     exit 1;
  #   else
  #     echo "it seems to work! very good."
  #   fi
  #   echo "================= /testing zlib using node ================="
  # '';

  postPatch = pkgs.lib.optionalString pkgs.stdenv.isDarwin ''
    substituteInPlace configure \
      --replace '/usr/bin/libtool' 'ar' \
      --replace 'AR="libtool"' 'AR="ar"' \
      --replace 'ARFLAGS="-o"' 'ARFLAGS="-r"'
  '';
})