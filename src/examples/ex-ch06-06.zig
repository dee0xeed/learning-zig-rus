
const std = @import("std");

pub fn main() !void {
    const name = "Пётр";

    var buf: [100]u8 = undefined;
    const greeting = try std.fmt.bufPrint(&buf, "Привет, {s}!", .{name});

    std.debug.print("{s}\n", .{greeting});
}
