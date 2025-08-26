--[[
tiny-windows.nvim
Copyright (C) 2025  Markus Hergenröder <markus@coding4lgory.net>

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

---@class TinyWindowsCore
---@field settings TinyWindowsSettings
local M = {}

---@type function
---gets the number of editor buffers determined by their listed state
---@return integer
local function get_editor_count()
	local all_bufs = vim.api.nvim_list_bufs()
	local loaded_count = 0
	for _, b in ipairs(all_bufs) do
		if vim.fn.buflisted(b) == 1 then
			loaded_count = loaded_count + 1
		end
	end
	return loaded_count
end

---@type function
---@param opts vim.api.keyset.create_autocmd.callback_args
M.buffer_close = function(opts)
	if vim.bo.modified and not opts.bang then
		vim.api.nvim_err_writeln("Modified buffer save changes (:w) or override with :Bc!")
		return
	end
	if get_editor_count() > 1 then
		vim.cmd("bn|bd!#")
		return
	end
	vim.api.nvim_err_writeln("No buffer left for window. Use :q")
end

---@type function
---experimetal function to keep at least one editor window open
---if an editor buffer is available
---@param opts table options passed via aucmd
local function keep_open_buffer(opts)
	local all_windows = vim.api.nvim_list_wins()
	local editor_windows = 0
	for _, w in ipairs(all_windows) do
		local buf = vim.api.nvim_win_get_buf(w)
		editor_windows = editor_windows + vim.fn.buflisted(buf)
	end
	local editor_buffers = get_editor_count()
	if editor_windows == 0 and editor_buffers > 0 then
		print("restore window")
		vim.cmd("new")
		M.buffer_close({})
	end
end

---performs the module initialization
---@param opts TinyWindowsSettings
M.setup = function(opts)
    M.settings = opts
    if opts.default_keymaps then
	    vim.keymap.set("n", "<C-w><del>", M.buffer_close, { desc = "close buffer" })
    end

	if opts.try_keep_open then
		vim.api.nvim_create_autocmd("WinClosed", {
			group = vim.api.nvim_create_augroup("tiny_keep_window", { clear = true }),
			callback = keep_open_buffer,
			desc = "opens new window if last window is closed but editor buffers awailable",
		})
	end
    return M
end

return M
