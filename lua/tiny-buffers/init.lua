return {
    setup = function(opts)
        local settings = require('tiny-buffers.config').setup(opts)
        local core = require('tiny-buffers.core').setup(settings)
        require('tiny-buffers.commands').setup(core, settings)
    end
}
