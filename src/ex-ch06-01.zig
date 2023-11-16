
const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var arr = try allocator.alloc(usize, 4);
    allocator.free(arr);
    allocator.free(arr);

    std.debug.print("Это никогда не напечатается\n", .{});
}
