priority: 1

if request.path_segments[1] == "test_error"
then
  events["test_error"]:trigger(request)
end