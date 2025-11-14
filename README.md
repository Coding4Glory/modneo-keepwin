# modneo-keepwin

Tiny plugin to add just a single command to keep windows when closing buffers: `Bc[!]`

## Setup 🚀 and Configuration ⚙

Setup with lazy

```lua
return {
    'Coding4Glory/modneo-keepwin.nvim',
    -- following default options
    opts = {
        default_keymaps = true, -- set to false to not add default bindings
        try_keep_open = false, -- **experimental** try to keep open buffer in window when last listed buffer closes
    }
}
```

> The `try_keep_open` setting which tries to always keep an open editor buffer, will cause annoing behaviour in combination with windows opened to the side e. g. *file trees*.

## Usage 🔑

### Commands ⌨

`:Bc[!]` Call in normal mode do close buffer. Add bang to close modified buffer. The plugin internally uses `bw` to wipe the buffer.

### KeyBindings ⌨➕⌨

If default bindings are enabled:

- `<Ctrl-W><Del>`: close current buffer but keep window
