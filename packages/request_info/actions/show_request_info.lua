event: ["show_request"]
priority: 1

local inspect = require "inspect"
local info = inspect(request)
log.debug("request = " .. info)

return { body = info }