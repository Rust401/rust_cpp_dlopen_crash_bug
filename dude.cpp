// main.cpp
#include <iostream>
#include "rust_to_cpp.h"

extern "C" void rust_hello_world_extern();

#define LLM_API_NAME(name) asm (#name)

void cpp_hello_world() LLM_API_NAME(cpp_hello_world);

void cpp_hello_world()
{
    std::cout << "Hello from C++!" << std::endl;
    rust_hello_world_extern();
}

int main() {
    cpp_hello_world();
    return 0;
}
