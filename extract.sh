#!/usr/bin/env bash
# Forked from: https://github.com/floooh/tint-extract

set -e
shopt -s globstar

script_dir="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [ "$script_dir" != "$(pwd -P)" ]; then
	echo "Current directory is not the script directory; please execute script in 'ext/tint'"
	exit 1
fi

git clone --depth 1 https://dawn.googlesource.com/dawn
cd dawn
git rev-parse HEAD >../dawn.ref
cd ..

rm -rf src
rm -rf include
mkdir -p src/tint
mkdir -p src/utils
mkdir -p include

cp dawn/src/utils/*.h src/utils/
cp -r dawn/src/tint/api src/tint
cp -r dawn/src/tint/lang src/tint
cp -r dawn/src/tint/utils src/tint
cp -r dawn/include/tint include

rm -rf dawn

rm -rf src/**/BUILD.*
rm -rf src/**/*_test.cc
rm -rf src/**/*_bench.cc
rm -rf src/**/*_fuzz.cc

# Remove some files to reduce dependencies (we only need SPIRV writing and WGSL reading)
rm -rf src/tint/lang/core/ir/binary

# Remove unused features
rm -rf src/tint/lang/glsl
rm -rf src/tint/lang/hlsl
rm -rf src/tint/lang/wgsl/writer
rm -rf src/tint/lang/spirv/reader
rm -rf src/tint/lang/msl

# Language server depends on an external dependencies
rm -rf src/tint/lang/wgsl/ls

# Rhis contains platform specific code, only needed for cmdline tool
rm -rf src/tint/utils/command

# Platform specific code
rm src/tint/utils/system/executable*
rm src/tint/utils/system/env_windows.cc
rm src/tint/utils/system/terminal_posix.cc
rm src/tint/utils/system/terminal_windows.cc
rm src/tint/utils/text/*_ansi.cc
rm src/tint/utils/text/*_posix.cc
rm src/tint/utils/text/*_windows.cc

rm -rf src/tint/utils/file
rm -rf src/tint/utils/protos
