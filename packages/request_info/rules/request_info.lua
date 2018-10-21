priority: 1

if request.path_segments[1] == "show_request"
then
  events["show_request"]:trigger(request)
end