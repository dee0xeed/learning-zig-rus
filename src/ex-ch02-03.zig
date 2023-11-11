
pub fn main() void {
    return OpenError.AccessDenied;
}

const OpenError = error {
    AccessDenied,
    NotFound,
};
