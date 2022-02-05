local coffined = false
local ad = "anim@heists@box_carry@"
local anim = "idle"

RegisterCommand("coffin", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vehicle = GetVehiclePedIsIn(ped, true)
    local nearvehicle = #(coords - GetEntityCoords(vehicle))
    if nearvehicle < 5 then
        print("near")
        coffined = true
        if coffined then
            while not HasAnimDictLoaded(ad) do
                RequestAnimDict(ad)
                Wait(1)
            end
            bong = CreateObject(`prop_coffin_02b`, coords.x, coords.y, coords.z+0.2,  true,  true, true)
            AttachEntityToEntity(bong, ped, GetPedBoneIndex(ped, 60309), 0.025, 0.08, 0.255, 95.0, 190.0, 180.0, true, true, false, true, 1, true)
            TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
        -- elseif not coffined then
            -- DeleteObject(bong)
            -- StopAnimTask(ped, ad, anim, 1.0)
        end
    end
end)
local place = false
RegisterCommand("placecoffin", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local yes = vector3(-1763.11, -262.9, 47.19)
    local dist = #(coords - yes)
    if dist < 2 then
        place = true
        if place then
            DeleteObject(bong)
            StopAnimTask(ped, ad, anim, 1.0)
            prop = CreateObject(`prop_coffin_02b`, yes,  true,  true, true)
            SetEntityHeading(prop, 330.41)
        -- elseif not place then
            -- DeleteEntity(prop)
        end
    else
        TriggerEvent("QBCore:Notify", "You are too far away from the hole.")
    end
end)

-- vector3(-1762.77, -262.45, 48.24)
RegisterCommand("ripangusbeef", function()
    grass1 = CreateObject(`prop_pile_dirt_01`, -1762.77, -262.45, 47.24, true, true, true)
    FreezeEntityPosition(grass1, true)
    SetEntityHeading(grass1, 59.56)
    --#region
    -- vector3(-1764.14, -264.83, 48.76) vector3(-1763.45, -264.04, 48.94)vector3(-1764.0, -263.7, 48.92)vector3(-1763.87, -264.0, 48.8)
    grass2 = CreateObject(`prop_pile_dirt_01`, -1763.87, -264.0, 46.76, true, true, true)
    FreezeEntityPosition(grass2, true)
    SetEntityHeading(grass2, 59.56)
    --#regionvector3(-1761.81, -260.62, 49.28)vector3(-1762.25, -261.41, 49.24)
    grass3 = CreateObject(`prop_pile_dirt_01`,-1762.25, -261.41, 46.98, true, true, true)
    FreezeEntityPosition(grass3, true)
    SetEntityHeading(grass3, 59.56)
    -- gravevector4(-1761.7, -260.65, 49.28, 161.51)vector4(-1761.9, -260.64, 49.28, 141.28)vector4(-1760.63, -261.28, 49.23, 144.51)
    grave = CreateObject(`prop_prlg_gravestone_06a`, -1761.9, -260.64, 48.20, true, true, true)
    FreezeEntityPosition(grave, true)
    SetEntityHeading(grave, 144.51)
end)
--[[

["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
   {
       Prop = "hei_prop_heist_box",
       PropBone = 60309,
       PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
       EmoteLoop = true,
       EmoteMoving = true,
   }},
]]