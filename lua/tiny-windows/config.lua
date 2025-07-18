--[[
tiny-windows.nvim
Copyright (C) 2025  Markus Hergenröder <markus@coding4glory.net>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

---@class TinyWindowsConfig
local M = {}

---@class TinyWindowsSettings
---@field default_keymaps boolean add default keymaps, default is `true`
---@field try_keep_open boolean **Experimental** set to true to try to keep an open buffer, default is `false`
M.defaults = {
    default_keymaps = true,
    try_keep_open = false,
}

---@type function
---initializes the configuration
---@param opts any
---@return TinyWindowsSettings
M.init = function(opts)
    local config = vim.tbl_deep_extend('force', M.defaults, opts or {})
    return config
end

return M
