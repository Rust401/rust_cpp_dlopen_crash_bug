# remove all
cargo clean

# build .a
echo "generate .a"
cargo build --target aarch64-unknown-linux-gnu --release

# build .so
echo "generate so"
aarch64-linux-gnu-g++ -shared -o libdude.so dude.cpp -L target/aarch64-unknown-linux-gnu/release -lrust_to_cpp -ldl -fPIC

# build binary
echo "generate bin"
aarch64-linux-gnu-g++ -o test_dlopen test_dlopen.cpp -ldl
