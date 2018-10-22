priority: 1

if request.path_segments[1] == "show_debug"
then
  events["show_debug"]:trigger()
end