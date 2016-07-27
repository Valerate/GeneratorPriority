require "prototypes.create"
data:extend({
{
    type = "item-group",
    name = "GP-Hidden",
    order = "o",
	icon = "__base__/graphics/item-group/logistics.png"
  },
  {
    type = "item-subgroup",
    name = "GP-Hidden",
    group = "GP-Hidden",
    order = "99",
  },
})

local ToCreate={}

for i, entity in pairs(data.raw["generator"]) do
	ToCreate[i]= entity
end
	
for i, entity in pairs(ToCreate) do
	GeneratorCreate(entity)
end




-- local file = io.open(__GeneratorPriority__/locale/en/entity.cfg, "w")

-- for i , entity in pairs(data.raw["generator"]) do
	-- local Name = entity.name
	-- if string.find(Name, "GP-") then
		-- if string.find(Name, "-Primary") then
			-- local BaseName = Name
			-- local BaseName = string.gsub(BaseName, "GP%-", "")
			-- local BaseBame = string.gsub(BaseName, "-Primary", "")
			-- entity.localized_name = {BaseName.. " Primary Output", "entity-name." .. Name}
		-- elseif string.find(Name, "-Secondary") then
			-- local BaseName = Name
			-- local BaseName = string.gsub(BaseName, "GP%-", "")
			-- local BaseBame = string.gsub(BaseName, "-Secondary", "")
			-- entity.localized_name = {BaseName.. " Secondary Output", "entity-name." .. Name}
		-- elseif string.find(Name, "-Terciary") then
			-- local BaseName = Name
			-- local BaseName = string.gsub(BaseName, "GP%-", "")
			-- local BaseBame = string.gsub(BaseName, "-Terciary", "")
			-- entity.localized_name = {BaseName.. " Terciary Output", "entity-name." .. Name}
		-- end
	-- end
-- end