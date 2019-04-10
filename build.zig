const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    // Define the shared build variables
    const zig_source_file = "src/main.zig";
    const output_dir = "build";

    // Define the targets
    const default_lib = b.addStaticLibrary("hello-zig-x86_64", zig_source_file);
    default_lib.setBuildMode(mode);
    default_lib.setOutputDir(output_dir);
    
    var main_tests = b.addTest(zig_source_file);
    main_tests.setBuildMode(mode);

    // TODO: ADD IOS MIN VERSION FLAGS??
    const ios_simulator_lib = b.addStaticLibrary("hello-zig-ios-x86_64", zig_source_file);
    ios_simulator_lib.setBuildMode(mode);
    ios_simulator_lib.setOutputDir(output_dir);
    ios_simulator_lib.setTarget(builtin.Arch.x86_64, builtin.Os.ios, builtin.Abi.gnu);

    // TODO: FIND CORRECT ARCH COMBO FOR ARM64??
    // const ios_aarch64_lib = b.addStaticLibrary("hello-zig-ios-aarch64", zig_source_file);
    // ios_aarch64_lib.setBuildMode(mode);
    // ios_aarch64_lib.setTarget(builtin.Arch.aarch64{.v8}, builtin.Os.ios, builtin.Abi.gnu);

    // Set the steps that can be run
    b.default_step.dependOn(&default_lib.step);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    const ios_step = b.step("ios", "Build iOS libraries");
    ios_step.dependOn(&ios_simulator_lib.step);
}
