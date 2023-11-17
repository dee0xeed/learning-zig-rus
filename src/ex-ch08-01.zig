
const std = @import("std");
const os = std.os;

const Writer = union(enum) {
  file: File,

  fn writeAll(self: Writer, data: []const u8) !void {
    switch (self) {
      .file => |file| return file.writeAll(data),
    }
  }
};

const File = struct {
  fd: os.fd_t,

  fn writeAll(self: File, data: []const u8) !void {
    _ = try std.os.write(self.fd, data);
  }
};


pub fn main() !void {
  const file = File{.fd = std.io.getStdOut().handle};
  const writer = Writer{.file = file};
  try writer.writeAll("hi\n");
}
