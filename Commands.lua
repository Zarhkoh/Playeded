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
    if d >= 1 then return ("%d jours, %d heures, %d minutes, %d secondes"):format(d,h,m,s); end;
    if h >= 1 then return (     "%d heures, %d minutes, %d secondes"):format(  h,m,s); end;
    if m >= 1 then return (          "%d minutes %d secondes"):format(    m,s); end;
    if s >= 1 then return (                     "%d secondes"):format(      s); end;
    return s;
end

local function helpCommand()
    print("Commandes acceptées par Playeded :")
        print("/playeded all - Affiche le temps de jeu total.")
        print("/playeded server - Affiche le temps de jeu sur ce serveur.")
        print("/playeded resetAll - Réinitialise le temps de jeu total.")
--      print("/playeded resetCurrent - Supprime le temps de jeu enregistré pour ce personnage.")
--      print("/playeded resetServer - Réinitialise le temps de jeu enregistré pour ce serveur.")
end

local function getPlayedTime(param)
    local totalTime = 0
    for server, characters in pairs(PlayedTotal) do
        if param == "all" or GetRealmName() == server then
            print(WrapTextInColorCode("Serveur : " .. server, "FFB5FFEB"))
            for characterID,datas in sortAscendant(characters, function(t,a,b) return t[b].time < t[a].time end) do
            local color = C_ClassColor.GetClassColor(datas.class)
            print("-> " .. WrapTextInColorCode(datas.name, color:GenerateHexColor()) .. " - " .. secondsToTime(datas.time) .. ".")
            totalTime=totalTime + datas.time
            end
        end
    end
    print(WrapTextInColorCode("Vous avez joué " .. secondsToTime(totalTime) .. " sur " .. (param=="all" and "ce compte" or "le serveur "..GetRealmName()) ..".", "ffffff00"))
end

local function deletePlayedTime(param)
    if param == "all" then
        PlayedTotal = {}
        print("Payeded - Tous les temps de jeux ont été réinitialisés.")
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