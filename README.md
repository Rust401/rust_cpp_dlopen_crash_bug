# rust_cpp_dlopen_crash_bug

## Usage
1. for **x86-linux platform**
```shell
sh make-dude-lnx.sh
```
then just run
```
./test_dlopen
```


2. for **android platfrom**
```shell
sh make-dude-an.sh
```
then push `libdude.so` and `test_dlopen` to your devices via `adb`

```
adb push libdude.so /data/local
adb push test_dlopen /data/local
adb shell "chmod 777 /data/local/test_dlopen"
```

then run on the device
```
adb shell
/data/local/test_dlopen
```
