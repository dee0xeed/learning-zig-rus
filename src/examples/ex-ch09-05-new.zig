
const std = @import("std");

pub fn main(init: std.process.Init) !void {
    var gpa = std.heap.DebugAllocator(.{}){};
    const allocator = gpa.allocator();

    var out: std.ArrayList(u8) = .empty;
    defer out.deinit(allocator);

    var buf: [1024]u8 = undefined;
    var writer: std.Io.File.Writer = .init(.stdout(), init.io, &buf);
    const stdout_writer = &writer.interface;

    var json: std.json.Stringify = .{
        .writer = stdout_writer,
        .options = .{.whitespace = .indent_2},
    };

    try json.write(
        .{
           .this_is = "an anonymous struct",
           .above = true,
           .last_param = "are options",
        },
    );
    try stdout_writer.flush();
    std.debug.print("{s}\n", .{out.items});
}
