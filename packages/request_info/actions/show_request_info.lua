event: ["show_request"]
priority: 1

local info = (require "inspect")(request)
log.debug(info)

return {
  body = info
}