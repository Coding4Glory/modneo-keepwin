return {
    ---@param core TinyBuffersCore
    ---@param opts TinyBufferSettings
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
