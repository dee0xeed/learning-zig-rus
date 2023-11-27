
const std = @import("std");

pub fn main() void {
    _ = add(8999, 2);

    // или
    // sum = add(8999, 2);
    // _ = sum;
    // нет, так тоже 'error: use of undeclared identifier 'sum''
}

fn add(a: i64, b: i64) i64 {
    _ = b;
    return a + a;
}

