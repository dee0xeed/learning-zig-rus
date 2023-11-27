
const std = @import("std");

pub fn main() !void {
    var buf: [150]u8 = undefined;
    var fa = std.heap.FixedBufferAllocator.init(&buf);
    defer fa.reset();

    const allocator = fa.allocator();

    const json = try std.json.stringifyAlloc(allocator, .{
        .this_is = "an anonymous struct",
        .above = true,
        .last_param = "are options",
    }, .{.whitespace = .indent_2});

    std.debug.print("{s}\n", .{json});
}
