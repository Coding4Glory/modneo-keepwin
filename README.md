# tiny buffers

Currently this module adds only one commands `Bc` to close a buffer but keep the window.

## Setup🚀

Setup with lazy

```lua
return {
    'coding4glory/tiny-buffers.nvim',
    opts = {}
}
```

## Configuration⚙

There is only one optional setting `try_keep_open` which tries to always keep an open editor buffer. This setting is **experimental** and might cause annoing behaviour in combination with windows opened to the side e. g. *file trees*.

## Usage🔑

Simply `:Bc` in normal mode.
