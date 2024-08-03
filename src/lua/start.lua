local function create_ginga()
    dtw.remove_any(".ginga")
    local src, size = bin.list_files_recursively(".ginga")
    for i = 1, size do
        local path = src[i]
        dtw.write_file(path, bin.getbin(path))
    end
end

---@param content string
---@param element string
local function add_in_gitignore(content, element)
    if not string.find(content, element, 1, true) then
        content = content .. "\n" .. element .. "\n"
    end
    return content
end

local function create_gitignore()
    local content = dtw.load_file(".gitignore")
    if not content then
        content = ''
    end
    content = add_in_gitignore(content, ".ginga")
    if get_os() == 'linux' then
        content = add_in_gitignore(content, "ginga_bundler.out")
    end

    if get_os() == 'windows' then
        content = add_in_gitignore(content, "ginga_bundler.exe")
    end
    dtw.write_file(".gitignore", content)
end

---@param example string
local function create_examples(example)
    local possible_path = "examples/" .. example .. "/"

    if not bin.exist(possible_path) then
        print(ANSI_RED .. "example:'" .. example .. "' not exist")
        exit(1)
    end

    if dtw.isdir("src") then
        local force_flag = getargv(3)
        if force_flag == '--force' then
            dtw.remove_any('src')
        else
            print(ANSI_RED .. "folder src already exist (rerun with --force at end)")
            exit(1)
        end
    end

    local examples, size = bin.list_files_recursively(possible_path)
    for i = 1, size do
        local current = examples[i]
        if dtw.newPath(current).get_name() == "description.txt" then
            goto continue
        end
        local formated_path = string.gsub(current, 'examples/', '');
        formated_path = string.gsub(formated_path, example, 'src')
        dtw.write_file(formated_path, bin.getbin(current))
        ::continue::
    end
end

function Start()
    local example = getargv(2)
    if not example then
        print(ANSI_RED .. " example not provided")
        exit(1)
    end



    create_examples(example)

    create_ginga()
    create_gitignore()
    print(ANSI_GREEN .. "run: '" .. Get_comand() .. " run' to start the app")
end
