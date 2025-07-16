# This file defines a custom build for CIRCT based on the `fsm-to-core` branch.
# It is a modified version of the derivation found in nixpkgs.
{
  stdenv,
  lib,
  cmake,
  coreutils,
  python3,
  git,
  fetchFromGitHub,
  ninja,
  lit,
  z3,
  gitUpdater,
  circt-llvm,
  callPackage,
}:

let
  pythonEnv = python3.withPackages (ps: [ ps.psutil ]);

  # The circt-llvm derivation now lives inside this file,
  # ensuring it's built from the same custom source.
  circt-llvm = callPackage ./circt-llvm-fsm.nix { };


in
stdenv.mkDerivation rec {
  pname = "circt-fsm"; # Renamed to avoid confusion
  version = "1.116.0-fsm-fork"; # A descriptive version

  # --- MODIFICATION START ---
  # Here we point Nix to the specific fork and commit you need.
  src = fetchFromGitHub {
    owner = "TaoBi22";
    repo = "circt";
    rev = "fbd78552d967b9d7b422f21ef988c2bfd2c8cf19";
    # The hash must be updated. Nix will tell you the correct hash
    # if you run a build with a placeholder like this one.
    hash = "sha256-r0U5IoAJ2SDfn303pyoUtCbZf6bgYDzoP+BY9jstkkI=";
    fetchSubmodules = true;
  };
  # --- MODIFICATION END ---

  requiredSystemFeatures = [ "big-parallel" ];

  nativeBuildInputs = [
    cmake
    ninja
    git
    pythonEnv
    z3
  ];
  buildInputs = [ circt-llvm ];

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
    "-DMLIR_DIR=${circt-llvm.dev}/lib/cmake/mlir"

    # LLVM_EXTERNAL_LIT is executed by python3, the wrapped bash script will not work
    "-DLLVM_EXTERNAL_LIT=${lit}/bin/.lit-wrapped"
    "-DCIRCT_LLHD_SIM_ENABLED=OFF"
  ];

  # The rest of the derivation remains largely the same as the upstream version.
  # No changes needed here unless the new branch introduces build system changes.

  LIT_FILTER_OUT =
    let
      lit-filters =
        lib.optionals stdenv.cc.isClang [ "CIRCT :: Target/ExportSystemC/.*\\.mlir" ]
        ++ lib.optionals (stdenv.hostPlatform.system == "x86_64-darwin") [
          "CIRCT :: Target/ExportSMTLIB/.*\\.mlir"
          "CIRCT :: circt-bmc/.*\\.mlir"
          "CIRCT :: Dialect/.*/Reduction/.*\\.mlir"
          "CIRCT :: Dialect/SMT/.*\\.mlir"
          "CIRCT :: circt-as-dis/.*\\.mlir"
          "CIRCT :: circt-reduce/.*\\.mlir"
          "CIRCT :: circt-test/basic.mlir"
        ]
        ++ [
          "CIRCT :: Dialect/FIRRTL/SFCTests/ExtractSeqMems/Compose.fir"
          "CIRCT :: Dialect/FIRRTL/SFCTests/ExtractSeqMems/Simple2.fir"
          "CIRCT :: Dialect/FIRRTL/extract-instances.mlir"
        ];
    in
    if lit-filters != [ ] then lib.strings.concatStringsSep "|" lit-filters else null;

  postPatch = ''
    patchShebangs tools/circt-test
  '';

  preConfigure = ''
    find ./test -name '*.mlir' -exec sed -i 's|/usr/bin/env|${coreutils}/bin/env|g' {} \;
    substituteInPlace cmake/modules/GenVersionFile.cmake \
      --replace-fail "unknown git version" "${src.rev}"
    substituteInPlace integration_test/CMakeLists.txt \
      --replace-warn 'set(CIRCT_INTEGRATION_TIMEOUT 60)' 'set(CIRCT_INTEGRATION_TIMEOUT 300)'
  '';

  doCheck = true;
  checkTarget = "check-circt check-circt-integration";

  preCheck = lib.optionalString stdenv.hostPlatform.isDarwin ''
    echo moving libarc-jit-env.dylib to '$lib' before check because archilator links to the output path
    mkdir -pv $lib/lib
    cp -v ./lib/libarc-jit-env.dylib $lib/lib
  '';

  outputs = [
    "out"
    "lib"
    "dev"
  ];

  postFixup = circt-llvm.postFixup;

  postInstall = ''
    moveToOutput lib "$lib"
    moveToOutput lib/cmake "$dev"

    substituteInPlace $dev/lib/cmake/circt/CIRCTConfig.cmake \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}/lib/cmake/mlir" "${circt-llvm.dev}/lib/cmake/mlir" \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}/lib/cmake/circt" "$dev/lib/cmake/circt" \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}/include" "$dev/include" \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}/lib" "$lib/lib" \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}/bin" "$out/bin" \
      --replace-fail "\''${CIRCT_INSTALL_PREFIX}" "$out"
    substituteInPlace $dev/lib/cmake/circt/CIRCTTargets-release.cmake \
      --replace-fail "\''${_IMPORT_PREFIX}/lib" "$lib/lib"
  '';

  passthru = {
    updateScript = gitUpdater {
      rev-prefix = "firtool-";
    };
    llvm = circt-llvm;
  };

  meta = {
    description = "Circuit IR compilers and tools (with fsm-to-core pass)";
    homepage = "https://circt.org/";
    license = lib.licenses.asl20;
    maintainers =  [

    ];
    platforms = lib.platforms.all;
  };
}
