function getbools()
    for name,version in pairs(game.active_mods) do
        if name == "Long Inserters" then
            zsorter_controlBool_long_inserters = true
        elseif name == "krastorio2" then
            zsorter_controlBool_krastorio2 = true
        elseif name == "Advanced_Modules" then
            zsorter_controlBool_AdvandcedModules = true
        end
    end
end

--script.on_init(getbools)
--find a way to not get the game = nil error