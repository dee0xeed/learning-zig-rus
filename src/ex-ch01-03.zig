
const std = @import("std");

pub fn main() void {
    const a = [_]i32{1, 2, 3, 4, 5};
    var end: usize = 4;
    const b = a[1..end];
    std.debug.print("{any}\n", .{@TypeOf(b)});
}
