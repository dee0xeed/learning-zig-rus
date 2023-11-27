
const std = @import("std");

pub const User = struct {
    id: u64,
    power: i32,
};

pub fn main() void {
    var user = User{
        .id = 1,
        .power = 100,
    };
    std.debug.print("{*}\n{*}\n{*}\n", .{&user, &user.id, &user.power});
}
