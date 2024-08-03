local RSGCore = exports['rsg-core']:GetCoreObject()



-----------------------------------------------------------------------

--Money Check
RegisterNetEvent('rsg-witchdoctor:server:checkmoney')
AddEventHandler(
    'rsg-witchdoctor:server:checkmoney',
    function()
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
        local cashBalance = Player.PlayerData.money['cash']
        local ReviveAmount = Config.ReviveAmount

        if cashBalance >= ReviveAmount then
            Player.Functions.RemoveMoney('cash', ReviveAmount)
            TriggerClientEvent('rsg-medic:client:adminRevive', Player.PlayerData.source)
        else
            TriggerClientEvent('rsg-witchdoctor:client:notenoughmoney', Player.PlayerData.source)
        end
    end
)


