#include <iostream>                                                                             
#include <dlfcn.h>                                                                              
                                                                                                
int loop() {                                                                                    
    void* handle = dlopen("./libdude.so", RTLD_LAZY);  // 路径需要根据实际情况调整              
    if (!handle) {                                                                              
        std::cerr << "Error opening library: " << dlerror() << std::endl;                       
        return 1;                                                                               
    }                                                                                           
                                                                                                
    dlerror();                                                                                  
                                                                                                
    typedef void (*rust_hello_world_t)();                                                       
    rust_hello_world_t rust_hello_world = (rust_hello_world_t) dlsym(handle, "cpp_hello_world");
                                                                                                
    // 检查是否找到了符号                                                                       
    const char* error = dlerror();                                                              
    if (error) {                                                                                
        std::cerr << "Error finding symbol: " << error << std::endl;                            
        dlclose(handle);                                                                        
        return 1;                                                                               
    }                                                                                           
                                                                                                
    // 调用 Rust 函数                                                                           
    rust_hello_world();                                                                         
                                                                                                
    // 关闭动态库                                                                               
    dlclose(handle);                                                                            
    return 0;                                                                                   
}

int main(int argc, char* argv[]) {
  int count = 0;
  int loop_count_max = 0;
  while(1) {
    ++count;
    printf("dude loop %d\n", count);
    if (!(argc < 2))
      loop_count_max = std::stoi(argv[1]);

    if (count == loop_count_max)
      break;

    loop();
  }
  return 0;
}
