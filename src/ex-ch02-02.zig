
const std = @import("std");

pub fn main() void {
    const ts = Timestamp{.unix = 1699689923};
    std.debug.print("{d}\n", .{ts.seconds()});
}

const TimestampType = enum {
    unix,
    datetime,
};

const Timestamp = union(TimestampType) {
    unix: i64,
    datetime: DateTime,

    const DateTime = struct {
        year: u16,
        month: u8,
        day: u8,
        hour: u8,
        minute: u8,
        second: u8,
    };

    fn seconds(self: Timestamp) u16 {
        switch (self) {
            .datetime => |dt| return dt.second,
            .unix => |ts| {
                const seconds_since_midnight: i64 = @rem(ts, 86400);
                return @intCast(@rem(seconds_since_midnight, 60));
            },
        }
    }
};
