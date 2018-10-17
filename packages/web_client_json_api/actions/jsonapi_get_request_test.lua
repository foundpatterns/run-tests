event: ["tests_requested"]
priority: 1

local response = client_request.send("http://jsonplaceholder.typicode.com/todos/1")


function test_equal (a, b)
  if a == b then
    log.info("Test succedded, got: " .. tostring(a))
  else
    log.warn("Test failed, got: " .. tostring(a) .. "expected:" .. tostring(b))
  end
end

test_equal(response.status, 200)
test_equal(response.body.title, "delectus aut autem")