
const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // setup executable
    const exe = b.addExecutable (
        .{
            .name = "program",
            .root_module = b.createModule (
                .{
                    .root_source_file = b.path("program.zig"),
                    .target = target,
                    .optimize = optimize,
                    .single_threaded = true,
                    .strip = true,
                },
            ),
        }
    );
    b.installArtifact(exe);

    // run step
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    const run_step = b.step("run", "test run");
    run_step.dependOn(&run_cmd.step);

    // test step
    const tests = b.addTest (
        .{
            .root_module = b.createModule (
                .{
                    .root_source_file = b.path("program.zig"),
                    .target = target,
                    .optimize = optimize,
                },
            ),
        }
    );

    const test_cmd = b.addRunArtifact(tests);
    test_cmd.step.dependOn(b.getInstallStep());
    const test_step = b.step("test", "Run the tests");
    test_step.dependOn(&test_cmd.step);
}
