~/Development/zig-master/build/bin/zig build-lib -target x86_64-ios-gnu -mios-version-min 9.0 --name hello-zig-ios-x86_64 src/main.zig
~/Development/zig-master/build/bin/zig build-lib -target aarch64v8-ios-gnu -mios-version-min 9.0 --name hello-zig-ios-aarch64 src/main.zig

lipo -create libhello-zig-ios-x86_64.a libhello-zig-ios-aarch64.a -output hello-zig-ios-universal.a