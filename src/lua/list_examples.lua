function List_examples()
    local examples, size = bin.list_dirs("examples")
    for i = 1, size do
        local current = examples[i]
        local description_path = dtw.concat_path(current, "description.txt")
        local description = bin.getbin(description_path)

        name = string.gsub(current, "examples/", "");
        name = string.gsub(name, "/", "");
        if description then
            description = string.gsub(description, "\n", "")
            print(ANSI_CYAN .. name .. ": " .. ANSI_MAGENTA .. description)
        end
        if not description then
            print(ANSI_CYAN .. name)
        end
    end
end
