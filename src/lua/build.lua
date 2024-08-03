function Build()
    if not dtw.isfile("src/main.lua") then
        print(ANSI_RED .. "src/main.lua not found ")
    end

    if get_os() == 'linux' then
        os.execute("cd .ginga && chmod +x lua ")
        os.execute("cd .ginga && ./lua src/cli/main.lua build ../src/main.lua --core love")
        os.execute("cd .ginga  && zip -9 game.zip dist/* && cat ./run dist game.zip > game.out")
    end
end
