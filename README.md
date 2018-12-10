# Hello Zig

Attempt at getting a zig library compiled for use on iOS and other mobile platforms

## Building

Using the zig build script (DOESNT WORK FOR IOS YET):

```bash
IPHONEOS_DEPLOYMENT_TARGET=9.0 ~/Development/zig-master/build/bin/zig build --verbose
```

Manually:

```bash
bash build_ios_fat_lib.sh
```

Then open `Hello Zig/HelloZig.xcproject` and build from there

## NOTES

* The build script wont work cross compiling for ios, but `build-lib` directly does.. no idea why yet, looks like a linker issue. 
* The header is only generated from the `build.zig` script, so create a plain library running that and use that header after building using the fat binary script. 
* Use https://github.com/mpiannucci/zig until the changes I made were pushed upstream