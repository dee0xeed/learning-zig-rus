
const std = @import("std");

pub fn main() void {
    var user = User{
        .id = 1,
        .power = 100,
    };

    // this line has been added
    levelUp(user);
    std.debug.print("Пользователь {d} обладает силой {d}\n", .{user.id, user.power});
}

fn levelUp(user: User) void {
    user.power += 1;
}

pub const User = struct {
    id: u64,
    power: i32,
};
