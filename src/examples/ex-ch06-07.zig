
const std = @import("std");

pub fn main() !void {
    const out = std.io.getStdOut();

    try std.json.stringify(.{
        .this_is = "an anonymous struct",
        .above = true,
        .last_param = "are options",
    }, .{.whitespace = .indent_2}, out.writer());
}
