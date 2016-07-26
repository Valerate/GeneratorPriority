require "prototypes.create"

for i, entity in pairs(data.raw["generator"]) do
	GeneratorCreate(entity)
end
	