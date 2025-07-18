# tiny.nvim window enhancements

Currently this module adds only one commands `Bc` to close a buffer but keep the window.

## Setup🚀 and Configuration⚙

Setup with lazy

```lua
return {
    'coding4glory/tiny-buffers.nvim',
    -- following default options
    opts = {
        default_keymaps = true, -- set to false to not add default bindings
        try_keep_open = false, -- **experimental** try to keep open buffer in window when last listed buffer closes
    }
}
```

> The `try_keep_open` setting which tries to always keep an open editor buffer, will cause annoing behaviour in combination with windows opened to the side e. g. *file trees*.

## Usage🔑

### Commands⌨

Simply `:Bc[!]` in normal mode

### KeyBindings⌨+⌨

If default bindings are enabled:

- `<Ctrl-W><Del>`: close current buffer but keep window
