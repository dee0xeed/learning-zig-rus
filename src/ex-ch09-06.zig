
const std = @import("std");

pub const Logger = struct {
    level: Level,

    // "error" is reserved, names inside an @"..." are always
    // treated as identifiers
    const Level = enum {
        debug,
        info,
        @"error",
        fatal,
    };

    fn info(logger: Logger, msg: []const u8, out: anytype) !void {
        if (@intFromEnum(logger.level) <= @intFromEnum(Level.info)) {
            try out.writeAll(msg);
        }
    }
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var l = Logger{.level = .info};

    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

    try l.info("sever started", arr.writer());
    std.debug.print("{s}\n", .{arr.items});
}
