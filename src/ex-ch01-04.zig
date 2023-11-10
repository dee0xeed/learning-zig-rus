
const std = @import("std");

pub fn main() void {
    // an array of 3 booleans with false as the sentinel value
    const a = [3:false]bool{false, true, false};

    // This line is more advanced, and is not going to get explained!
    std.debug.print("{any}\n", .{std.mem.asBytes(&a).*});
}
