
const std = @import("std");

pub fn main() !void {
    var arr: IntArray(3) = undefined;
    arr.items[0] = 1;
    arr.items[1] = 10;
    arr.items[2] = 100;
    std.debug.print("{any}\n", .{arr.items});
}

fn IntArray(comptime length: usize) type {
    return struct {
        items: [length]i64,
    };
}
