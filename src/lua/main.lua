function main()
    local action = getargv(1)
    if action == 'help' then
        Help()
    elseif action == 'list_examples' then
        List_examples()
    elseif action == "create_project" then
        Start()
    elseif action == 'build' then
        Build()
    elseif action == 'run' then
        Run()
    else
        print(ANSI_RED .. "invalid action, type './ginga_start help' to get help")
    end
end

main()
