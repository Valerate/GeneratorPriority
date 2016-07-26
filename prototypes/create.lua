
function GeneratorCreate(base)

	local Pri = base.energy_source.usage_priority
	
	if Pri == "primary" then
		GeneratorCreateSecondary(base)
		GeneratorCreateTerciary(base)
	elseif Pri == "secondary" then
		GeneratorCreatePrimary(base)
		GeneratorCreateTerciary(base)
	elseif Pri == "terciary" then
		GeneratorCreatePrimary(base)
		GeneratorCreateSecondary(base)
	else       
		for key, player in pairs(game.players) do player.print("You've Done seomthign wrong Kass...") end
	end
end

function GeneratorCreatePrimary(base)
	local obj = unil.table.deepcopy(data.raw["generator"][base])
	local name = data.raw["generator"][base].name
	obj.name = "GP-".. name.. "-Primary"
	obj.entity.energy_source.usage_priority = "primary"
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateSecondary(base)
	local obj = unil.table.deepcopy(data.raw["generator"][base])
	local name = data.raw["generator"][base].name
	obj.name = "GP-".. name.. "-Secondary"
	obj.entity.energy_source.usage_priority = "secondary"
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateTerciary(base)
	local obj = unil.table.deepcopy(data.raw["generator"][base])
	local name = data.raw["generator"][base].name
	obj.name = "GP-".. name.. "-Terciary"
	obj.entity.energy_source.usage_priority = "terciary"
	data.raw["generator"][obj.name] = obj
end