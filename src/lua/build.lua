function Build()
    if not dtw.isfile("src/main.lua") then
        print(ANSI_RED .. "src/main.lua not found ")
    end

    if get_os() == 'linux' then
        os.execute("cd .ginga && chmod +x lua ")
        os.execute("cd .ginga && ./lua src/cli/main.lua build ../src/main.lua --core love")

        dtw.copy_any_overwriting(".ginga/run", "game/run")
        dtw.copy_any_overwriting(".ginga/dist", "game/dist")
        dtw.copy_any_overwriting(".ginga/run.sh", "game/run.sh")
        os.execute("zip -j game.zip game/*")
        dtw.remove_any("game")
    end
end
