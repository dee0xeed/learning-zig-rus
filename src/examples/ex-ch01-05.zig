
const std = @import("std");

pub fn main() void {
    std.debug.print("{any}\n", .{@TypeOf(.{.year = 2023, .month = 8})});
}
