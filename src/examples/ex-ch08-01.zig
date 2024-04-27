
const std = @import("std");
//const os = std.os; // 0.11
const posix = std.posix; // 0.12

const Writer = union(enum) {
  file: File,

  fn writeAll(self: Writer, data: []const u8) !void {
    switch (self) {
      .file => |file| return file.writeAll(data),
    }
  }
};

const File = struct {
  fd: posix.fd_t,

  fn writeAll(self: File, data: []const u8) !void {
    _ = try std.posix.write(self.fd, data);
  }
};


pub fn main() !void {
  const file = File{.fd = std.io.getStdOut().handle};
  const writer = Writer{.file = file};
  try writer.writeAll("hi\n");
}
