
const std = @import("std");

pub fn main() !void {
    var buf: [150]u8 = undefined;
    @memset(&buf, 0);

    var fxwr: std.Io.Writer = .fixed(&buf);
    var json: std.json.Stringify = .{
        .writer = &fxwr,
        .options = .{.whitespace = .indent_2}
    };

    try json.write (
        .{
            .this_is = "an anonymous struct",
            .above = true,
            .last_param = "are options",
        },
    );
    std.debug.print("{s}\n", .{buf});
}
