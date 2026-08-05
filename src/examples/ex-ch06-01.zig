
const std = @import("std");

pub fn main() !void {
    //var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var gpa = std.heap.DebugAllocator(.{}){}; // since 0.16
    const allocator = gpa.allocator();

    const arr = try allocator.alloc(usize, 4);
    allocator.free(arr);
    allocator.free(arr);

    std.debug.print("Это никогда не напечатается\n", .{});
}
