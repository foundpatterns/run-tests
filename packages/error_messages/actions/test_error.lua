event: ["test_error"]
priority: 1

local error_id = request.path_segments[2]

if not error_id or error_id == "1" then
  error("Custom Error")
elseif error_id == "2" then
  local _ = 3 + nil
elseif error_id == "3" then
  local _ = foo.bar
elseif error_id == "4" then
  foo()
end