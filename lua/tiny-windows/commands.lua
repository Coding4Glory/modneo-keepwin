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

---@class TinyWindowsCommands
---@field setup function
return {
    ---@param core TinyWindowsCore the initialized core
    ---@param opts TinyWindowsSettings defaults merged with user settings
    setup = function(core, opts)
        vim.api.nvim_create_user_command(
            "Bc",
            core.buffer_close,
            { desc = "close buffer but try to keep window", bang = true }
        )

        if opts.try_keep_open then
            vim.api.create_autocmd(
                'WinClosed',
                {
                    group = vim.api.nvim_create_augroup('tiny_keep_window', { clear = true }),
                    callback = core.keep_open_buffer,
                    desc = "opens new window if last window is closed but editor buffers available",
                })
        end
    end,
}
