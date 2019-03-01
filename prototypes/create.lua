function GeneratorCreate(base)
	
	local Pri = base.energy_source.usage_priority
	
	if Pri == "primary" then
		GeneratorCreateSecondary(base)
		GeneratorCreateTerciary(base)
	elseif Pri == "secondary" then
		GeneratorCreatePrimary(base)
		GeneratorCreateTerciary(base)
	elseif Pri == "tertiary" then
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
	obj.localised_name =  {"", {"entity-name." .. NAME}, " [Primary]"}
	obj.placeable_by = {item = base.name, count = 1}
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateSecondary(base)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	
	GeneratorCreateItem(data.raw["item"][NAME],"Secondary")
	
	obj.name = "GP-".. NAME.. "-Secondary"
	obj.energy_source.usage_priority = "secondary-output"
	obj.localised_name =  {"", {"entity-name." .. NAME}, " [Secondary]"}
	obj.placeable_by = {item = base.name, count = 1}
	data.raw["generator"][obj.name] = obj
end

function GeneratorCreateTerciary(base)
	local obj = util.table.deepcopy(base)
	local NAME = base.name
	
	GeneratorCreateItem(data.raw["item"][NAME],"Tertiary")
	
	obj.name = "GP-".. NAME.. "-Tertiary"
	obj.energy_source.usage_priority = "tertiary"
	obj.localised_name = {"", {"entity-name." .. NAME}, " [Tertiary]"}
	obj.placeable_by = {item = base.name, count = 1}
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