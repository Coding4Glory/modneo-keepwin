--[[
modneo-keepwin
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

---@class Modneo.KeepWin.Commands
return {
    ---defines commands provided by this plugin
    ---@param core Modneo.KeepWin the initialized core
    ---@param opts Modneo.KeepWin.Options defaults merged with user settings
    setup = function(core, opts)
        vim.api.nvim_create_user_command(
            "Bc",
            core.buffer_close,
            { desc = "close buffer but try to keep window", bang = true }
        )
    end,
    ---removes commands provided by this plugin
    unload = function()
        for cmd, _ in pairs(vim.api.nvim_get_commands({builtin = false})) do
            if cmd == 'Bc' then vim.api.nvim_del_user_command('Bc') end
        end
    end
}
