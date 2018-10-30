priority: 1

if 
  request.path_segments[1] == "scrape"
then
  events["scrape"]:trigger(request)
end
