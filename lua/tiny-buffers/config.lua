---@class TinyBufferConfiguration
local M = {}

---@class TinyBufferSettings
---@field try_keep_open boolean **Experimental** set to true to try to keep an open buffer, default to false
M.defaults = {
    try_keep_open = false,
}

M.setup = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts)
    return config
end

return M
