event: ["show_debug"]
priority: 1

local inspect = require "inspect"
local info = inspect(debug)
log.debug("debug = " .. info)

return { body = info }