# remove all                                                                 
cargo clean                                                                  
                                                                             
# build .a                                                                   
echo "generate .a"                                                           
cargo build --release                                                        
                                                                             
# build .so                                                                  
echo "generate so"                                                           
g++ -shared -o libdude.so dude.cpp -L target/release -lrust_to_cpp -ldl -fPIC
                                                                             
# build binary                                                               
echo "generate bin"                                                          
g++ -o test_dlopen test_dlopen.cpp -ldl                                      
