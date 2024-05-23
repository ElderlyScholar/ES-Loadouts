local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.PDCrateItem, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	
    if Player.PlayerData.job.name ~= Config.PoliceJobName then
        TriggerClientEvent("QBCore:Notify", source, "You Cant Seem To Open It, Shes locked Up Tight", "error")
        return
    end

    for k, v in pairs(Config.Loadouts.PD) do
        Player.Functions.AddItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v.item], "add", v.amount)
    end
end)

QBCore.Functions.CreateUseableItem(Config.EMSCrateItem, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	
    if Player.PlayerData.job.name ~= Config.EMSJobName then
        TriggerClientEvent("QBCore:Notify", source, "You Cant Seem To Open It, Shes locked Up Tight", "error")
        return
    end

    for k, v in pairs(Config.Loadouts.EMS) do
        Player.Functions.AddItem(v.item, v.amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v.item], "add", v.amount)
    end
end)
