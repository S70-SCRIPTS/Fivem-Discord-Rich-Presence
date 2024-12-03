Citizen.CreateThread(function()
    while true do
        local PlayerName = GetPlayerName(PlayerId())
        local id = GetPlayerServerId(PlayerId())
        local coords = GetEntityCoords(PlayerPedId())
        local streetHash, _ = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        local activity = IsPedInAnyVehicle(ped, false) and "Driving" or "Walking"
        local locationText = activity .. " at " .. streetName
        local playerCount = #GetActivePlayers()
        SetDiscordAppId(APP_ID)  -- Add Your Discord Application ID
        SetDiscordRichPresenceAsset('big')
        SetDiscordRichPresenceAssetSmall('big')
        SetDiscordRichPresenceAssetText('SERVER_NAME')  -- Fiven Server Name
        SetDiscordRichPresenceAssetSmallText("PLAYERS: " .. playerCount .. "/48")
        SetRichPresence(locationText.. "\n" .. PlayerName.." ["..id.."] ") 
        SetDiscordRichPresenceAction(0, "Join Discord", "DISCORD_SERVER_LINK") -- Discord Server Link
        Citizen.Wait(60000)
    end
end)
