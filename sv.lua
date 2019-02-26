	ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
function CountJob()
	local xPlayers = ESX.GetPlayers()
	for _,v in pairs(JobList) do
		v.count = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == v.job then
				v.count = v.count + 1

			end
		end
	end
	TriggerClientEvent("JobsConnected", -1, JobList)
	SetTimeout(5000, CountJob)
end
CountJob()
