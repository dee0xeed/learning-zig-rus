
const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const calc_module = b.addModule("calc", .{
        .root_source_file = .{ .path = "calc/calc.zig" },
    });

    // setup executable
    const exe = b.addExecutable(.{
        .name = "program",
        .target = target,
        .optimize = optimize,
        .root_source_file = .{ .path = "program.zig" },
    });
    //exe.addModule("calc", calc_module);
    exe.root_module.addImport("calc", calc_module);
    b.installArtifact(exe);

    // run step
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "test run");
    run_step.dependOn(&run_cmd.step);

    // test step
    const tests = b.addTest(.{
        .target = target,
        .optimize = optimize,
        .root_source_file = .{ .path = "program.zig" },
    });
    //tests.addModule("calc", calc_module);
    tests.root_module.addImport("calc", calc_module);

    const test_cmd = b.addRunArtifact(tests);
    test_cmd.step.dependOn(b.getInstallStep());
    const test_step = b.step("test", "Run the tests");
    test_step.dependOn(&test_cmd.step);
}
