event: ["scrape"]
priority: 1

local doc = hquery.document(fs.read_file("assets/stackoverflow.html"))

local msg = ""

local function push (...)
  msg = msg .. table.concat({...}, " ") .. "\n"
end

push("# Menu")
for key,e in ipairs(doc:find(hquery.descendant(hquery.attr("id", "hmenus"), hquery.name("a")))) do
    push(e:text(), e:attr("href"))
end
push("")

push("# Top 5 questions")
local items = doc:find(hquery.class("question-summary"))
for i = 1, 5 do
    if items[i] ~= nil then
        local question = items[i]:find(hquery.class("question-hyperlink"))[1]
        local votes = items[i]:find(hquery.class("vote-count-post"))[1]:text()
        local answers = items[i]:find(hquery.descendant(hquery.class("status"), hquery.name("strong")))[1]:text()
        local asked_on = items[i]:find(hquery.class("relativetime"))[1]:text()
        local asker = items[i]:find(hquery.descendant(hquery.class("user-details"), hquery.name("a")))[1]:text()
        local tags = items[i]:find(hquery.class("post-tag"))
        for key,value in ipairs(tags) do
            tags[key] = value:text()
        end

        push("Question: ", question:text())
        push("Votes: ", votes)
        push("Answers: ", answers)
        push("Asked on: ", asked_on)
        push("Asked by: ", asker)
        push("Tags: ", table.concat(tags, ", "))
        push("Permalink: http://stackoverflow.com" .. question:attr("href"))
        push("")
    end
end

log.info("# Top 10 Related Tags")
local x = doc:find(hquery.attr("id", "h-related-tags"))[1]:parent():find(hquery.name("div"))
for i = 1, 10 do
    if x[i] ~= nil then
        local tag = x[i]:find(hquery.name("a"))[1]:text()
        local count = x[i]:find(hquery.class("item-multiplier-count"))[1]:text()
        log.info(tag, count)
    end
end

return {
  headers = {},
  body = msg
}