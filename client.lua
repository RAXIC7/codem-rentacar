
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB

--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB
--- CODEM STORE --- https://discord.gg/DEzwFvtTBB


ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local display = false




RegisterNetEvent('arabaspawnla')
AddEventHandler('arabaspawnla', function(vehicle)

    local hash = GetHashKey(vehicle)
    RequestModel(hash)

    while not HasModelLoaded(hash) do

      Citizen.Wait(0)
    end

    local veh = CreateVehicle(hash, -244.66, -1015.073, 28.93, 1.0, true, true)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh,-1)
end)


arabaspawn = function(vehicle,fiyat)
    SetNuiFocus(false, false)
    display = false
    TriggerServerEvent('parakontrol', vehicle,fiyat)
end



RegisterNUICallback('escape', function(data)
    SetNuiFocus(false, false)
    display = false
end)
RegisterNUICallback('button1', function(data)
    arabaspawn("panto", 100)
end)
RegisterNUICallback('button2', function(data)
    arabaspawn("mesa", 200) 
end)
RegisterNUICallback('button3', function(data)
    arabaspawn("Scorcher", 10) 
end)

RegisterNUICallback("button4", function(data)
    arabaspawn("Faggio", 50) 
end)



local peds = {
    {coords = vector3(-250.91, -1006.908, 29.02), heading = 250.79, ped_handler = nil, label = 'E - Rent A Car'},
 
}

function createPed(v)
    local hash =  `ig_malc`
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Citizen.Wait(1) 
    end

    ped = CreatePed(4, hash, v.coords.x, v.coords.y, v.coords.z - 1.0, false, true)

    SetEntityHeading(ped, v.heading)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    v.ped_handler = ped
   
    SetModelAsNoLongerNeeded(hash)
end


function deletePed(ped)
    if DoesEntityExist(ped.ped_handler) then
        DeleteEntity(ped.ped_handler)
        ped.ped_handler = nil
         
    end
end
local wait = 3000
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        local ply = PlayerPedId()
        local coords = GetEntityCoords(ply, true)
        for k,ped in pairs(peds) do

            local npc_coords = ped.coords
            local dist = #(coords - npc_coords);

            if dist < 100.0 then
                if ped.ped_handler == nil then
                    print('creating ped')
                    createPed(ped)
                end
            else
                if ped.ped_handler ~= nil then
                    deletePed(ped)
                end
            end
        end
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(wait)
        for k,v in pairs(peds) do
            local ply = PlayerPedId();
            local coords = GetEntityCoords(ply, true)
            local dist = #(v.coords - coords);
            if dist < 3.0 then
                wait = 1
                DrawText3D(v.coords.x,v.coords.y,v.coords.z + 1.0,v.label)
                if IsControlJustPressed(0, 38) then
                    if not display then
                        SetNuiFocus(true, true)
                        SendNUIMessage({
                            type = "ui",
                            bansayi = sorgu,
                            totalResources = resourceData
                        })
                        display = true
                    else
                        SendNUIMessage({
                        type = "close",
                    })
                    display = false
                
                    end
                end
            end
        end
    end
end)




DrawText3D = function(x, y, z, text)
	SetTextScale(0.27, 0.26)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    --DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end