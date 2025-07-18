---@class TinyBuffersStartup
---@field setup function
return {
    ---runs the plugin startup logic
    ---@params opts TinyBuffersSettings?
    setup = function(opts)
        local settings = require('tiny-buffers.config').init(opts)
        local core = require('tiny-buffers.core').setup(settings)
        require('tiny-buffers.commands').setup(core, settings)
    end
}
