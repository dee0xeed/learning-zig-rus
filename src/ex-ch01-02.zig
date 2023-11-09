
const std = @import("std");

pub fn main() void {
    const sum = add(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum});
}

fn add(a: i64, b: i64) i64 {
    return a + b;
}
