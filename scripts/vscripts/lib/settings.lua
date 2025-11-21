SETTINGS = {}
function ReadKv()
	local file = LoadKeyValues('scripts/kv/settings.kv')
	if file == nil or not next(file) then
		print("empty settings :/")
		return {}
	end
	return file
end
SETTINGS = ReadKv()

if IsInToolsMode() then
	SETTINGS["GAME_SETUP_OPTIONS"]["GAME_MODE"]["VALUE"] = "TM"
	SETTINGS["BOTS_SETUP_OPTIONS"]["USE_BOTS"]["VALUE"] = 0
end

Settings = class({})
_G.Settings = Settings
Settings.QuickKeys = {}
function Settings:GetQuick(key)
	if Settings.QuickKeys[key] == nil then
		for k,category in pairs(SETTINGS) do
			if type(category) == "table" then
				if key == k and category.ENABLED ~= nil then
					Settings.QuickKeys[key] = category.ENABLED --correct way.
					return Settings.QuickKeys[key]
				end
				if key == k and category.VALUE ~= nil then
					Settings.QuickKeys[key] = category.VALUE --incorrect way but supported.
					return Settings.QuickKeys[key]
				end
				for catkey,val in pairs(category) do
					if type(category) == "table" then
						if catkey == key and val.VALUE ~= nil then
							Settings.QuickKeys[key] = val.VALUE --correct way.
							return Settings.QuickKeys[key]
						end
						if catkey == key and val.ENABLED ~= nil then
							Settings.QuickKeys[key] = val.ENABLED --incorrect way but supported.
							return Settings.QuickKeys[key]
						end
					end
				end
			end
		end
		print("not found ",key)
		return 0
	end
	return Settings.QuickKeys[key]
end

function Settings:GetValue(category,key)
	if key == nil then
		return Settings:GetQuick(category)
	end
	if key == "ENABLED" then
		if (SETTINGS[category] ~= nil and SETTINGS[category].ENABLED ~= nil) then
			return SETTINGS[category].ENABLED
		else
			print("not found ",category,key)
		end
		return 0
	end
	if (SETTINGS[category] ~= nil and SETTINGS[category][key] ~= nil and SETTINGS[category][key].VALUE ~= nil) then
		return SETTINGS[category][key].VALUE
	else
		print("not found ",category,key)
	end
	return 0
end

function Settings:SetValue(category,key,value)
	local path = category .. "&" .. key .. "&"
	if SETTINGS[category][key].VALUE ~= nil then
		SETTINGS[category][key].VALUE = value
		path = path .. "VALUE"
	else
		SETTINGS[category][key].ENABLED = value
		path = path .. "ENABLED"
	end
	CustomGameEventManager:Send_ServerToAllClients("setting_changed", {setting = path,value = value})
end