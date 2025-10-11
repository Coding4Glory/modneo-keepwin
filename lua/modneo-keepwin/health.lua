--[[
modneo-keepwin
Copyright (C) 2025  Markus Hergenröder

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

return {
    check = function ()
        for n, _ in pairs(vim.api.nvim_get_commands({builtin = false})) do
            if n == 'Bc' then 
                vim.health.ok('command available')
                return
            end
        end
        vim.health.warn('command not found: plugin not properly loaded')
    end
}

