# This file defines the LLVM build that corresponds to our custom CIRCT.
{
  lib,
  stdenv,
  cmake,
  ninja,
  python3,
  # We get `circt` passed in implicitly by `callPackage`
  circt,
  clang,
  ccache,
  lld,
  libgcc,
  gcc,
  gnumake,
  extra-cmake-modules,
  llvm,
}:
stdenv.mkDerivation {
  pname = circt.pname + "-llvm";
  # We inherit the src and version from the main circt-fsm derivation
  inherit (circt) version src;

  requiredSystemFeatures = [ "big-parallel" ];

  nativeBuildInputs = [
    cmake
    ninja
    python3
    clang
    ccache
    lld
    libgcc
    gcc
    gnumake
    cmake
    extra-cmake-modules
    stdenv.cc.cc.lib
  ];

  buildInputs = [
    clang
    ccache
    lld
    libgcc
    gcc
    gnumake
    cmake
    extra-cmake-modules
    stdenv.cc.cc.lib
  ];

  preConfigure = ''
    cd llvm/llvm
    export LD_LIBRARY_PATH="${stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
  '';

  cmakeFlags = [
    "-DBUILD_SHARED_LIBS=ON"
    "-DLLVM_ENABLE_BINDINGS=OFF"
    "-DLLVM_ENABLE_OCAMLDOC=OFF"
    "-DLLVM_BUILD_EXAMPLES=OFF"
    "-DLLVM_OPTIMIZED_TABLEGEN=ON"
    "-DLLVM_ENABLE_PROJECTS=mlir"
    "-DLLVM_TARGETS_TO_BUILD=Native"
    "-DLLVM_INSTALL_UTILS=ON"
    "-DCMAKE_C_COMPILER=clang"
    "-DCMAKE_CXX_COMPILER=clang++"
    "-DLLVM_ENABLE_LLD=ON"
    "-DLLVM_CCACHE_BUILD=OFF"
  ];

  outputs = [ "out" "lib" "dev" ];

  postPatch = lib.optionalString stdenv.hostPlatform.isDarwin ''
    substituteInPlace llvm/llvm/cmake/modules/AddLLVM.cmake \
      --replace-fail 'set(_install_rpath "@loader_path/../lib''${LLVM_LIBDIR_SUFFIX}" ''${extra_libdir})' \
        'set(_install_rpath "@loader_path/../lib''${LLVM_LIBDIR_SUFFIX}")'
  '';

  postInstall = ''
    moveToOutput "bin/llvm-config*" "$dev"
    moveToOutput "lib" "$lib"
    moveToOutput "lib/cmake" "$dev"
    substituteInPlace "$dev/lib/cmake/llvm/LLVMConfig.cmake" \
      --replace 'set(LLVM_BINARY_DIR "''${LLVM_INSTALL_PREFIX}")' 'set(LLVM_BINARY_DIR "'"$lib"'")'
    substituteInPlace \
      "$dev/lib/cmake/llvm/LLVMExports-release.cmake" \
      "$dev/lib/cmake/mlir/MLIRTargets-release.cmake" \
      --replace "\''${_IMPORT_PREFIX}/lib/lib" "$lib/lib/lib" \
      --replace "\''${_IMPORT_PREFIX}/lib/objects-Release" "$lib/lib/objects-Release" \
      --replace "$out/bin/llvm-config" "$dev/bin/llvm-config"
  '';

  postFixup = lib.optionalString stdenv.hostPlatform.isDarwin ''
    local flags
    for file in "$lib"/lib/*.dylib; do
      flags+=(-change @rpath/"$(basename "$file")" "$file")
    done

    for file in "$out"/bin/* "$lib"/lib/*.dylib; do
      if [ -L "$file" ]; then continue; fi
      echo "$file: fixing dylib references"
      install_name_tool -id "$file" "''${flags[@]}" "$file"
    done
  '';

  doCheck = false;
  checkTarget = "check-mlir";

  meta = llvm.meta // {
    inherit (circt.meta) maintainers;
  };
}
