event: ["tests_requested"]
priority: 1

local response = client_request.send{
    uri = "http://jsonplaceholder.typicode.com/posts",
    method = "post",
    body = [[{
        "title": "foo",
        "body": "bar",
        "userId": "1"
    }]]
}

function test_equal (a, b)
  if a == b then
    log.info("Test succedded, got: " .. tostring(a))
  else
    log.warn("Test failed, got: " .. tostring(a) .. "expected:" .. tostring(b))
  end
end

test_equal(response.status, 201)
test_equal(response.body.id, 101)