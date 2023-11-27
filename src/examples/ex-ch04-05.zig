
const std = @import("std");

pub const User = struct {
    id: u64,
    power: i32,
};

pub fn main() void {
    const user = User{
        .id = 1,
        .power = 100,
    };

    std.debug.print("main: {*}\n", .{&user});

    levelUp(user);
    std.debug.print("Пользователь {d} обладает силой {d}\n", .{user.id, user.power});
}

fn levelUp(user: User) void {
    std.debug.print("levelUp: {*}\n", .{&user});
    var u = user;
    u.power += 1;
}
