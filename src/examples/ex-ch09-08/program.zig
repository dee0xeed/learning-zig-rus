
const std = @import("std");
const calc = @import("calc");

pub fn main() void {
    const a: u32 = 3;
    const b: u32 = 4;
    const c: u32 = calc.add(a, b);
    std.debug.print("{} + {} = {}\n", .{a, b, c});
}

test "calc.add() test" {
    const a: u32 = 3;
    const b: u32 = 4;
    try std.testing.expectEqual(calc.add(a, b), 8); // will fail
}
