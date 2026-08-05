
const std = @import("std");
const builtin = @import("builtin");
const Allocator = std.mem.Allocator;

pub fn main(init: std.process.Init) !void {
    var gpa = std.heap.DebugAllocator(.{}){}; // since 0.16
    const allocator = gpa.allocator();

    var arr: std.ArrayList(User) = .empty;
    defer {
        for (arr.items) |user| {
            user.deinit(allocator);
        }
        arr.deinit(allocator);
    }

    var obuf: [1024]u8 = undefined;
    var ibuf: [1024]u8 = undefined;
    var writer: std.Io.File.Writer = .init(.stdout(), init.io, &obuf);
    var reader: std.Io.File.Reader = .init(.stdin(), init.io, &ibuf);
    const stdout = &writer.interface;
    const stdin = &reader.interface;

    var i: i32 = 0;
    while (true) : (i += 1) {
        try stdout.print("Please enter a name: ", .{});
        try stdout.flush();
        if (try stdin.takeDelimiter('\n')) |line| {
            var name = line;
            if (builtin.os.tag == .windows) {
                // In Windows lines are terminated by \r\n.
                // We need to strip out the \r
                name = std.mem.trimRight(u8, name, "\r");
            }
            if (name.len == 0) {
                break;
            }
            const owned_name = try allocator.dupe(u8, name);
            try arr.append(allocator, .{.name = owned_name, .power = i});
        }
    }

    var has_leto = false;
    for (arr.items) |user| {
        if (std.mem.eql(u8, "Leto", user.name)) {
            has_leto = true;
            break;
        }
    }

    std.debug.print("{any}\n", .{has_leto});
}

const User = struct {
    name: []const u8,
    power: i32,

    fn deinit(self: User, allocator: Allocator) void {
        allocator.free(self.name);
    }
};
