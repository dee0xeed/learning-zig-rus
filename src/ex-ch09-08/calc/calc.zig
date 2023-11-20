pub const add = @import("add.zig").add;

test {
    // By default, only tests in the specified file
    // are included. This magic line of code will
    // cause a reference to all nested containers
    // to be tested.
    @import("std").testing.refAllDecls(@This());
}
