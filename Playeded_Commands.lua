function sortAscendant(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

local function secondsToTime(seconds)
    local d, h, m, s;
    d =  seconds / 86400;
    h = (seconds % 86400) / 3600;
    m = (seconds % 86400  % 3600) / 60;
    s =  seconds % 86400  % 3600  % 60;

    local parts = {}

    if d == 1 then
        table.insert(parts, ("%d "):format(d)..Playeded.GetLocalizedText("DAY"))
    end
    if d >= 1 then
        table.insert(parts, ("%d "):format(d)..Playeded.GetLocalizedText("DAYS"))
    end
    if h == 1 then
        table.insert(parts, ("%d "):format(h)..Playeded.GetLocalizedText("HOUR"))
    end
    if h >= 1 then
        table.insert(parts, ("%d "):format(h)..Playeded.GetLocalizedText("HOURS"))
    end
    if m == 1 then
        table.insert(parts, ("%d "):format(m)..Playeded.GetLocalizedText("MINUTE"))
    end
    if m >= 1 then
        table.insert(parts, ("%d "):format(m)..Playeded.GetLocalizedText("MINUTES"))
    end
    if s == 1 then
        table.insert(parts, ("%d "):format(s)..Playeded.GetLocalizedText("SECOND"))
    end
    if s >= 1 then
        table.insert(parts, ("%d "):format(s)..Playeded.GetLocalizedText("SECONDS"))
    end

    return table.concat(parts, ", ")
end

local function helpCommand()
    print(Playeded.GetLocalizedText("ACCEPTED_COMMANDS_MSG"))
        print("/playeded all - "..Playeded.GetLocalizedText("INFO_ALL_COMMAND_MSG"))
        print("/playeded server - "..Playeded.GetLocalizedText("INFO_SERVER_COMMAND_MSG"))
        print("/playeded resetAll - "..Playeded.GetLocalizedText("INFO_RESETALL_COMMAND_MSG"))
--      print("/playeded resetCurrent - Supprime le temps de jeu enregistré pour ce personnage.")
--      print("/playeded resetServer - Réinitialise le temps de jeu enregistré pour ce serveur.")
end

local function getPlayedTime(param)
    local totalTime = 0
    for server, characters in pairs(PlayedTotal) do
        if param == "all" or GetRealmName() == server then
            print(WrapTextInColorCode(Playeded.GetLocalizedText("SERVER").." : " .. server, "FFB5FFEB"))
            for characterID,datas in sortAscendant(characters, function(t,a,b) return t[b].time < t[a].time end) do
            local color = C_ClassColor.GetClassColor(datas.class)
            print("-> " .. WrapTextInColorCode(datas.name, color:GenerateHexColor()) .. " - " .. secondsToTime(datas.time) .. ".")
            totalTime=totalTime + datas.time
            end
        end
    end
    print(WrapTextInColorCode(
        (param == "all" and 
            Playeded.GetLocalizedText("OVERALL_PLAYEDTIME_DISPLAY_MSG"):format(secondsToTime(totalTime)) 
        or 
            Playeded.GetLocalizedText("SERVER_PLAYEDTIME_DISPLAY_MSG"):format(secondsToTime(totalTime), GetRealmName())
        ), 
        "ffffff00"
    ))end

local function deletePlayedTime(param)
    if param == "all" then
        PlayedTotal = {}
        print("Playeded - "..Playeded.GetLocalizedText("RESETALL_CONFIRMATION_MSG"))
    end
end

local function commands(msg, editbox)
    if msg == "all" then
        getPlayedTime("all")
    elseif msg == "server" then
        getPlayedTime("server")
    elseif msg == "resetCurrent" then
        deletePlayedTime("player")
    elseif msg == "resetServer" then
        deletePlayedTime("server")
    elseif msg == "resetAll" then
        deletePlayedTime("all")
    else
        helpCommand()
    end
end

SLASH_PLAYEDED1 = "/playeded"
SlashCmdList["PLAYEDED"] = commands
