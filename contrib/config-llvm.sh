#!/bin/bash

echo "[+] Cloning Rust LLVM..."
git clone -b rustc/17.0-2023-09-19 https://github.com/rust-lang/llvm-project.git rust-llvm
pushd rust-llvm

TOP=$PWD
mkdir -p $TOP/build
pushd build

# Configure parameters taken from `./x dist`.
# Modified enabled projects and enabled targets.
echo "[+] Configuring LLVM..."
/usr/bin/cmake \
	"$TOP/llvm" \
	"-G" \
	"Ninja" \
	"-DCMAKE_BUILD_TYPE=Debug" \
	-DCMAKE_BUILD_TYPE=Debug \
	"-DLLVM_ENABLE_PROJECTS=clang;lld" \
	"-DLLVM_ENABLE_ASSERTIONS=ON" \
	"-DLLVM_UNREACHABLE_OPTIMIZE=OFF" \
	"-DLLVM_ENABLE_PLUGINS=OFF" \
	"-DLLVM_TARGETS_TO_BUILD=Mips;X86" \
	"-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=" \
	"-DLLVM_INCLUDE_EXAMPLES=OFF" \
	"-DLLVM_INCLUDE_DOCS=OFF" \
	"-DLLVM_INCLUDE_BENCHMARKS=OFF" \
	"-DLLVM_INCLUDE_TESTS=OFF" \
	"-DLLVM_ENABLE_TERMINFO=OFF" \
	"-DLLVM_ENABLE_LIBEDIT=OFF" \
	"-DLLVM_ENABLE_BINDINGS=OFF" \
	"-DLLVM_ENABLE_Z3_SOLVER=OFF" \
	"-DLLVM_TARGET_ARCH=x86_64" \
	"-DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-unknown-linux-gnu" \
	"-DLLVM_ENABLE_WARNINGS=OFF" \
	"-DLLVM_INSTALL_UTILS=ON" \
	"-DLLVM_ENABLE_ZSTD=OFF" \
	"-DLLVM_ENABLE_ZLIB=ON" \
	"-DLLVM_ENABLE_LIBXML2=OFF" \
	"-DLLVM_VERSION_SUFFIX=-rust-dev" \
	"-DCMAKE_INSTALL_MESSAGE=LAZY" \
	"-DCMAKE_C_COMPILER=clang" \
	"-DCMAKE_CXX_COMPILER=clang++" \
	"-DCMAKE_ASM_COMPILER=clang" \
	"-DCMAKE_C_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" \
	"-DCMAKE_CXX_FLAGS=-ffunction-sections -fdata-sections -fPIC -m64" \
	"-DCMAKE_SHARED_LINKER_FLAGS=" \
	"-DCMAKE_MODULE_LINKER_FLAGS=" \
	"-DCMAKE_EXE_LINKER_FLAGS=" \
	"-DCMAKE_INSTALL_PREFIX=$TOP/dist" \
	"-DCMAKE_ASM_FLAGS= -ffunction-sections -fdata-sections -fPIC -m64" \
	"-DLLVM_ENABLE_ASSERTIONS=ON" \
	"-DLLVM_BUILD_LLVM_DYLIB=ON" \
	"-DLLVM_USE_LINKER=lld"

echo "[+] Building LLVM..."
ninja
ninja install
popd

echo "[+] Done building LLVM."
echo "[+] Add the following path to your PATH to use it:"
echo "$TOP/dist/bin"
popd
