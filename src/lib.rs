// src/lib.rs

#[cxx::bridge]
mod ffi {
    extern "Rust" {
        fn rust_hello_world();
    }
}

fn rust_hello_world() {
    println!("Hello from Rust!");
}

#[no_mangle]
pub extern "C" fn rust_hello_world_extern() {
    rust_hello_world();
}
