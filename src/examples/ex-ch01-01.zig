
const std = @import("std");

// Если тут убрать слово 'pub', то этот код не откомпилируется
pub fn main() void {
    const user = User{
        .power = 9001,
        .name = "Пётр",
    };

    std.debug.print("{s} обладает силой {d}\n", .{user.name, user.power});
}

pub const User = struct {
    power: u64,
    name: []const u8,
};
