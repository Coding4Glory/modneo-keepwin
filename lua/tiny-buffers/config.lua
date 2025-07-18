---@class TinyBuffersConfig
local M = {}

---@class TinyBuffersSettings
---@field default_keymaps boolean add default keymaps, default is `true`
---@field try_keep_open boolean **Experimental** set to true to try to keep an open buffer, default is `false`
M.defaults = {
    default_keymaps = true,
    try_keep_open = false,
}

---@type function
---initializes the configuration
---@param opts any
---@return TinyBuffersSettings
M.init = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts or {})
    return config
end

return M
