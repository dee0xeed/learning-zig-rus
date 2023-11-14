
const std = @import("std");

pub fn main() void {
    const sum = add(8999, 2);
}

fn add(a: i64, b: i64) i64 {
    // обратите внимание, что тут a + a, а не a + b
    return a + a;
}
