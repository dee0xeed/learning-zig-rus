# About

This is a translation of
["Learning Zig" book](https://www.openmymind.net/learning_zig/)
by [Karl Seguin](https://github.com/karlseguin) into Russian.

# License

Distributed under the terms of
[Attribution-NonCommercial-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-nc-sa/4.0/)

# Converting

## epub

```
pandoc --metadata title="..." --syntax-definition="zig.xml" --highlight-style="zig.theme" ch01.md -o ch01.epub
```
