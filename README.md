# learning-zig-rus
translation...


```zig
    pub fn init(bp: *BitPredictor, f: *fs.File, r: *Reader) !Decoder {

        var d = Decoder {
            .bp = bp,
            .file = f,
            .reader = r,
        };

        var byte: u8 = undefined;
        for (0 .. 4) |_| {
            byte = try r.give() orelse 0;
            d.x = (d.x << 8) | byte;
        }
        return d;
    }
```


```
    pub fn init(bp: *BitPredictor, f: *fs.File, r: *Reader) !Decoder {

        var d = Decoder {
            .bp = bp,
            .file = f,
            .reader = r,
        };

        var byte: u8 = undefined;
        for (0 .. 4) |_| {
            byte = try r.give() orelse 0;
            d.x = (d.x << 8) | byte;
        }
        return d;
    }
```
