priority: 1

if 
  request.path_segments[1] == "run_test"
then
  events["tests_requested"]:trigger(request)
end
