const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const zig_source_file = "src/main.zig";

    const default_lib = b.addStaticLibrary("hello-zig-x86_64", zig_source_file);
    default_lib.setBuildMode(mode);

    // const ios_simulator_lib = b.addStaticLibrary("hello-zig-ios-x86_64", zig_source_file);
    // ios_simulator_lib.setBuildMode(mode);
    // ios_simulator_lib.setTarget(builtin.Arch.x86_64, builtin.Os.ios, builtin.Abi.gnu);

    // const ios_aarch64_lib = b.addStaticLibrary("hello-zig-ios-aarch64", zig_source_file);
    // ios_aarch64_lib.setBuildMode(mode);
    // ios_aarch64_lib.setTarget(builtin.Arch.aarch64, builtin.Os.ios, builtin.Abi.gnu);

    var main_tests = b.addTest(zig_source_file);
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    b.default_step.dependOn(&default_lib.step);
    b.installArtifact(default_lib);
    //b.installArtifact(ios_simulator_lib);
    //b.installArtifact(ios_aarch64_lib);
}
