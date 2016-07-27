require "prototypes.create"
function writeDebug(message)
      for key, player in pairs(game.players) do
         player.print(tostring(message))
      end
end



script.on_event("decrease-generator-priority", function(event)
	local selection = game.players[event.player_index].selected
	local force = "player"
	local force = game.players[event.player_index].force
	if selection and selection.type == "generator" then
		DecreasePriority(selection, event, force)
	end
end)

script.on_event("increase-generator-priority", function(event)
	local selection = game.players[event.player_index].selected
	local force = "player"
	local force = game.players[event.player_index].force
	if selection and selection.type == "generator" then
		IncreasePriority(selection, event, force)
	end
end)

function DecreasePriority(entity, event, force)
	local Pos = entity.position
	local Name = entity.name
	local Rot = entity.direction
	
	if string.find(Name, "-Primary") then 
		local Name = string.gsub(Name, "GP%-", "")
		local Name = string.gsub(Name, "-Primary", "")
		writeDebug("The generator is now secondary")
		entity.destroy()
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Secondary", position = Pos, direction = Rot, force = force})
			
		
	elseif string.find(Name, "-Secondary") then
		local Name = string.gsub(Name, "GP%-", "")
		local Name = string.gsub(Name, "-Secondary", "")
		writeDebug("The generator is now terciary")
		entity.destroy()
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Terciary", position = Pos, direction = Rot,force = force})
			
	elseif string.find(Name, "Terciary") then
		writeDebug("The generator is already terciary")
		
	else
		writeDebug("The generator is now terciary")
		entity.destroy()
		
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Terciary", position = Pos, direction = Rot, force = force})
			
	end
end

function IncreasePriority(entity, event, force)
	local Pos = entity.position
	local Name = entity.name
	local Rot = entity.direction
	if string.find(Name, "-Primary") then 
		writeDebug("The generator is already primary")
	elseif string.find(Name, "-Secondary") then
		local Name = string.gsub(Name, "GP%-", "")
		local Name = string.gsub(Name, "-Secondary", "")
		writeDebug("The generator is now primary")
		entity.destroy()
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Primary", position = Pos, direction = Rot, force = force})
		
	elseif string.find(Name, "-Terciary") then
		local Name = string.gsub(Name, "GP%-", "")
		local Name = string.gsub(Name, "-Terciary", "")
		writeDebug("The generator is now secondary")
		entity.destroy()
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Secondary", position = Pos, direction = Rot, force = force})

	else
		writeDebug("The generator is now primary")
		entity.destroy()
		game.surfaces.nauvis.create_entity({name = "GP-".. Name .. "-Primary", position = Pos, direction = Rot, force = force})

	end

end
