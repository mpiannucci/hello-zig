~/Development/zig-master/build/bin/zig build-lib --target-os ios --target-arch x86_64 -mios-version-min 9.0 --static --name hello-zig-ios-x86_64 src/main.zig
~/Development/zig-master/build/bin/zig build-lib --target-os ios --target-arch aarch64v8 -mios-version-min 9.0 --static --name hello-zig-ios-aarch64 src/main.zig

lipo -create hello-zig-ios-x86_64.a hello-zig-ios-aarch64.a -output hello-zig-ios-universal.a