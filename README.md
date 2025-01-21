# rust_cpp_dlopen_crash_bug

## Usage
### 1. for **linux-arm64 platform**
```shell
sh make-lnx.sh
```
then just run
```
./test
```


### 2. for **android platfrom**

download ndk first
[ndk-r25c](https://dl.google.com/android/repository/android-ndk-r25c-linux.zip)

unzip to some path
```
unzip android-ndk-r25c-linux.zip
```

configure path
```
export NDK=/path/to/your/ndk
```
then build
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
