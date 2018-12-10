# Hello Zig

Attempt at getting a zig library compiled for use on iOS and other mobile platforms

## Building

Using the zig build script:

```bash
IPHONEOS_DEPLOYMENT_TARGET=9.0 ~/Development/zig-master/build/bin/zig build --verbose
```

Manually:

```bash
~/Development/zig-master/build/bin/zig build-lib --target-os ios --target-arch x86_64 -mios-version-min 9.0 --static src/main.zig
```
