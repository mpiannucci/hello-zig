# Hello Zig

Attempt at getting a zig library compiled for use on ios and other platforms

## Building

Using the zig build script (DOESNT WORK FOR IOS YET):

```bash
IPHONEOS_DEPLOYMENT_TARGET=9.0 zig build
```

Manually build for ios:

```bash
bash build_ios_fat_lib.sh
```

Then open `Hello Zig/HelloZig.xcproject` and build for ios from there

## NOTES

* The build script wont work cross compiling for ios, but `build-lib` directly does.. no idea why yet, looks like a linker issue. 
* Use https://github.com/mpiannucci/zig until the changes I made to enable ios support are pushed upstream