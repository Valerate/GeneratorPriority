require "prototypes.create"
function writeDebug(message)
      for key, player in pairs(game.players) do
         player.print(tostring(message))
      end
end



script.on_event("decrease-generator-priority", function(event)
	writeDebug( "Decrease")
	local selection = game.players[event.player_index].selected
	local force = "player"
	-- local force = game.players[event.player_inder].force
	if selection and selection.type == "generator" then
		DecreasePriority(selection, event, force)
	end
end)

script.on_event("increase-generator-priority", function(event)
	writeDebug( "Increase")
	local selection = game.players[event.player_index].selected
	local force = "player"
	-- local force = game.players[event.player_inder].force
	if selection and selection.type == "generator" then
		IncreasePriority(selection, event, force)
	end
end)

function IncreasePriority(entity, event, force)
	writeDebug("before")
	local Pri = {"nothing"}
	local Pos = entity.position
	local Name = entity.name
	local Pri = data.raw["generator"][Name].energy_source.usage_priority
	local Rot = entity.direction
	writeDebug("after")
	
	if Pri == "primary" then 
		print("The generator is now secondary")
		entity.destoy()
		surface.create_entity({name = "GP-".. Name .. "-Secondary", postition = Pos, direction = Rot, force = force})

	elseif Pri == "secondary" then
	
		print("The generator is now terciary")
		entity.destoy()
		surface.create_entity({name = "GP-".. Name .. "-Terciaty", postition = Pos, direction = Rot, force = force})
		
	elseif Pri == "terciary" then
		print("The generator is already terciary")
		
	-- else
		-- print("You Done fuck'd")
	end
end

function DecreasePriority(entity, event)
	writeDebug("before")
	local Pri = {}
	local Pos = entity.position
	local Name = entity.name
	local Pri = data.raw["generator"][Name].energy_source.usage_priority
	local Rot = entity.direction
	writeDebug("after")
	
	if Pri == "primary" then 
		print("The generator is already primary")
	elseif Pri == "secondary" then
		print("The generator is now primary")
		entity.destoy()
		surface.create_entity({name = "GP-".. Name .. "-Primary", postition = Pos, direction = Rot, force = force})
		
	elseif Pri == "terciary" then
		print("The generator is now secondary")
		entity.destoy()
		surface.create_entity({name = "GP-".. Name .. "-Secondary", postition = Pos, direction = Rot, force = force})
		
	-- else
		-- print("You Done fuck'd")
	end

end
