function writeDebug(message)
      for key, player in pairs(game.players) do
         player.print(tostring(message))
      end
end


-- script.on_event("decrease-generator-priority", function(event)
	-- writeDebug( "Decrease")
	-- local selection = game.players[event.player_index].selected
	-- if selection and selection.type == "generator" then
		-- DecreasePriority(selection, event)
	-- print("The generator is already primary")
	-- end
-- end)

script.on_event("increase-generator-priority", function(event)
	writeDebug( "Increase")
	local selection = game.players[event.player_index].selected
	if selection and selection.type == "generator" then
		writeDebug(selection.type)
		writeDebug(selection.name)
		writeDebug(selection.collision_box)
		-- IncreasePriority(selection, event)
		
	end
end)

-- function IncreasePriority(entity, event)
	-- writeDebug("before")
	-- local Priority = entity.energy_source
	-- writeDebug("after")
	-- local UsageList = { "primary", "secondary", "terciary" }
	-- local New = "primary"
		-- if Priority == "primary" then 
			-- print("The generator is now secondary")
			-- New =  "secondary"
		-- elseif Priority == "secondary" then
			-- print("The generator is now terciary")
			-- New =  "terciary"
		-- elseif Priority == "terciary" then
			-- print("The generator is already terciary")
			-- New =  "terciary"
		-- else
			-- print("You Done fuck'd")
		-- end
	-- entity.entity.energy_source.usage_priority = New
-- end

-- function DecreasePriority(entity, event)
	-- local Priority = entity.energy_source.usage_priority
	-- local UsageList = { "primary", "secondary", "terciary" }
	-- local New = "primary"
		-- if Priority == "primary" then 
			-- print("The generator is already primary")
			-- New =  "primary"
		-- elseif Priority == "secondary" then
			-- print("The generator is now primary")
			-- New =  "primary"
		-- elseif Priority == "terciary" then
			-- print("The generator is now secondary")
			-- New =  "secondary"
		-- else
			-- print("You Done fuck'd")
		-- end
	-- entity.entity.energy_source.usage_priority = New

-- end