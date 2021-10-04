--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB



ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('parakontrol')
AddEventHandler('parakontrol', function(vehicle,fiyat)
    print(vehicle)
    print(fiyat)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.getMoney() >=  fiyat then 
        xPlayer.removeMoney(fiyat)
        TriggerClientEvent('arabaspawnla',src, vehicle)
        TriggerClientEvent('esx:showNotification', src, 'The car was delivered')

    else
        TriggerClientEvent('esx:showNotification', src, 'You don t have enough money')
    end
end)