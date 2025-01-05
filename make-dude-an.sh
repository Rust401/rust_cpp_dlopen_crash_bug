# remove all
cargo clean

# build .a
# cargo build --release

# Hack NDK to make rust happy
NDK_BIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64/bin
ln -s $NDK_BIN/aarch64-linux-android31-clang $NDK_BIN/aarch64-linux-android-clang || true
ln -s $NDK_BIN/aarch64-linux-android31-clang++ $NDK_BIN/aarch64-linux-android-clang++ || true

PATH=$NDK_BIN:$PATH cargo build --release --target aarch64-linux-android

# build .so
echo "build an so"
$NDK_BIN/aarch64-linux-android-clang++ -shared -o libdude.so dude.cpp -L target/aarch64-linux-android/release -lrust_to_cpp -ldl -fPIC

# build binary
echo "build an bin"
$NDK_BIN/aarch64-linux-android-clang++ -o test_dlopen test_dlopen.cpp -ldl

# Hack NDK to make rust happy
rm $NDK_BIN/aarch64-linux-android-clang $NDK_BIN/aarch64-linux-android-clang++ || true
