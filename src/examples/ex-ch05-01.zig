
const std = @import("std");

pub fn main() void {
    const user1 = User.init(1, 10);
    const user2 = User.init(2, 20);

    std.debug.print("User {d} has power of {d}\n", .{user1.id, user1.power});
    std.debug.print("User {d} has power of {d}\n", .{user2.id, user2.power});
}

pub const User = struct {
    id: u64,
    power: i32,

    fn init(id: u64, power: i32) *User{
        var user = User{
            .id = id,
            .power = power,
        };
        return &user;
    }
};
