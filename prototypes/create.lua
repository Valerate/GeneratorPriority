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
		GeneratorCreatePrimary(base)
		GeneratorCreateSecondary(base)
		GeneratorCreateTerciary(base)
	end
end

function GeneratorCreatePrimary(base)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	
	GeneratorCreateItem(data.raw["item"][NAME],"Primary")
	
	obj.name = "GP-".. NAME.. "-Primary"
	obj.energy_source.usage_priority = "primary-output"
	obj.localized_name = {"entity-name." .. obj.name, NAME .. " Primary Output"}
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateSecondary(base)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	
	GeneratorCreateItem(data.raw["item"][NAME],"Secondary")
	
	obj.name = "GP-".. NAME.. "-Secondary"
	obj.energy_source.usage_priority = "secondary-output"
	obj.localized_name = {"entity-name." .. obj.name, NAME .. " Secondary Output"}
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateTerciary(base)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	
	GeneratorCreateItem(data.raw["item"][NAME],"Terciary")
	
	obj.name = "GP-".. NAME.. "-Terciary"
	obj.energy_source.usage_priority = "terciary"
	obj.localized_name = { "entity-name." .. obj.name, NAME .. " Terciary Output"}
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateItem(base , priority)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	obj.name = "GP-" .. NAME .. "-" .. priority
	obj.subgroup = "GP-Hidden"
	obj.place_result = obj.name
	data.raw[obj.type][obj.name] = obj
end