
const std = @import("std");

pub fn main() !void {
    // again, we'll talk about allocators soon!
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // create a User on the heap
    var user = try allocator.create(User);

    // free the memory allocated for the user at the end of this scope
    defer allocator.destroy(user);

    user.id = 1;
    user.power = 100;

    // this line has been added
    levelUp(user);
    std.debug.print("User {d} has power of {d}\n", .{user.id, user.power});
}

fn levelUp(user: *User) void {
    user.power += 1;
}

pub const User = struct {
    id: u64,
    power: i32,
};
