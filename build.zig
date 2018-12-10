const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addStaticLibrary("hello-zig-ios-x86_64", "src/main.zig");
    lib.setBuildMode(mode);
    //lib.setTarget(builtin.Arch.x86_64, builtin.Os.ios, builtin.Environ.unknown);

    var main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    b.default_step.dependOn(&lib.step);
    b.installArtifact(lib);
}
