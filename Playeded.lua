local EventFrame = CreateFrame("frame", "PlayededFrame")
EventFrame:RegisterEvent("ADDON_LOADED")
EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
EventFrame:RegisterEvent("PLAYER_LEAVING_WORLD")
EventFrame:RegisterEvent("TIME_PLAYED_MSG")
locale = GetLocale()


local function saveInLocalVariable(realm,playerGUID,class,name,time)
    if PlayedTotal == nil then
        PlayedTotal = {}
    end
    if not PlayedTotal[realm] then
        PlayedTotal[realm] = {}
    end
    if not PlayedTotal[realm][playerGUID] then
        PlayedTotal[realm][playerGUID] = {}
    end
    PlayedTotal[realm][playerGUID].name = name
    PlayedTotal[realm][playerGUID].time = time
    PlayedTotal[realm][playerGUID].lastregistered = C_DateAndTime.GetCurrentCalendarTime()
    PlayedTotal[realm][playerGUID].class = class
    print(GetLocalizedText("NEW_TIME_PLAYED_MSG"))
end

EventFrame:SetScript("OnEvent", function(self, event, ...)
    if(event == "ADDON_LOADED" and ... == "WowUkrainizer") then
        locale = "ukUA"
    elseif(event == "PLAYER_ENTERING_WORLD" or event =="PLAYER_LEAVING_WORLD") then
        RequestTimePlayed()
    elseif(event == "TIME_PLAYED_MSG")then
        local totalTimePlayed = ...
        local playerGUID = UnitGUID("player")
        local name = UnitName("player")
        local realm = GetRealmName()
        local localizedClass, englishClass, classIndex = UnitClass("player")
        saveInLocalVariable(realm,playerGUID,englishClass,name,totalTimePlayed)
    end
end)

--TODO:
-- -Macro /playeded resetCurrent [Reset current character /played]
-- -Macro /playeded resetServer [Reset current server /played]
