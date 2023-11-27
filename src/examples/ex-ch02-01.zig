
const std = @import("std");

pub fn main() void {
    const n = Number{.int = 32};
    std.debug.print("{d}\n", .{n.int});
}

const Number = union {
    int: i64,
    float: f64,
    nan: void,
};
