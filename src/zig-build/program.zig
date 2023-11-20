
const std = @import("std");

pub fn main() void {
    std.debug.print("test\n", .{});
}

test "dummy build test" {
    //try std.testing.expectEqual(false, true); // failed
    try std.testing.expectEqual(false, false);  // passed
}
