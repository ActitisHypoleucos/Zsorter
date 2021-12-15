data:extend(
  {
    {--SCIENCE
    type = "item-group",
    name = "science",
    order = "b-a",
    icon = "__Zsorter__/graphics/item-group/science.png",
    icon_size = 64,
    },
    {--FUELS
    type = "item-group",
    name = "fuelz",
    order = "c-b",
    icon = "__Zsorter__/graphics/item-group/fuels.png",
    icon_size = 125,
    },
    {--EQUIPMENT
    type = "item-group",
    name = "equipment_group",
    order = "d-0",
    icon = "__Zsorter__/graphics/item-group/equipment.png",
    icon_size = 64,
    },
    {--AMMO
    type = "item-group",
    name = "ammo_group",
    order = "da-0",
    icon = "__Zsorter__/graphics/item-group/ammo.png",
    icon_size = 64,
    },
    {--tools
    type = "item-subgroup",
    name = "tool",
    group = "equipment_group",
    order = "a"
    },
    {--armor
    type = "item-subgroup",
    name = "armor",
    group = "equipment_group",
    order = "c"
    },
    {--armor_modules
    type = "item-subgroup",
    name = "equipment",
    group = "equipment_group",
    order = "e"
    },
    {--remotes
    type = "item-subgroup",
    name = "remote",
    group = "equipment_group",
    order = "b",
    },
    {--armor_only_modules
    type = "item-subgroup",
    name = "character-equipment",
    group = "equipment_group",
    order = "d",
    },
    {--electric-train-modules > schall
    type = "item-subgroup",
    name = "electric-train-modules",
    group = "transport",
    order = "e",
    },
    {--gantry
    type = "item-subgroup",
    name = "equipment-gantry",
    group = "transport",
    order = "b0",
    },
    {--pda-road-sign
    type = "item-subgroup",
    name = "pda-road-sign",
    group = "circuit",
    order = "e0[mod]-a[pavement_assistant]",
    },
    {--ai-structures
    type = "item-subgroup",
    name = "programmable-structures",
    group = "transport",
    order = "za",
    },
    {--ai-vehicles
    type = "item-subgroup",
    name = "ai-vehicles",
    group = "transport",
    order = "zc",
    },
    {--ai-vehicles-reverse
    type = "item-subgroup",
    name = "ai-vehicles-reverse",
    group = "transport",
    order = "zd",
    },
    {--ai-vehicles-miners
    type = "item-subgroup",
    name = "ai:miners",
    group = "transport",
    order = "za",
    },
    {--vehicle modules
      type = "item-subgroup",
      name = "vehicle_grid_modules",
      group = "transport",
      order = "z",
    },
    {--vanilla-turrets
    type = "item-subgroup",
    name = "vanilla-turrets",
    group = "combat",
    order = "g1"
    },
    {--artillery
    type = "item-subgroup",
    name = "vanilla-artillery-turret",
    group = "combat",
    order = "g2"
    },
    {--railgun-at-kr
    type = "item-subgroup",
    name = "railgun-turret",
    group = "combat",
    order = "g3"
    },
    {--rocket-at-kr
    type = "item-subgroup",
    name = "rocket-turret",
    group = "combat",
    order = "g4"
    },
    {--radar
    type = "item-subgroup",
    name = "radars-and-rockets",
    group = "combat",
    order = "g5"
    },
    {--fuels_supergroup (to segment)
    type = "item-subgroup",
    name = "fuelssitem",
    group = "fuelz",
    order = "b"
    },
    {--fuels_supergroup (to segment) same as b basically
    type = "item-subgroup",
    name = "fuelssmachine",
    group = "fuelz",
    order = "a"
    },
    {--labs
    type = "item-subgroup",
    name = "science-lab",
    group = "science",
    order = "a"
    },
    {--science packs
    type = "item-subgroup",
    name = "science-pack",
    group = "science",
    order = "b"
    },
    {--pipes
    type = "item-subgroup",
    name = "pipe-distribution",
    group = "logistics",
    order = "cb"
    },
    {--storage A1
    type = "item-subgroup",
    name = "container-1",
    group = "logistics",
    order = "a1[container-1]"
    },
    { --krastorio tiles
    type = "item-subgroup",
    name = "tiles-second-tier",
    group = "dectorio",
    order = "i-b-a"
    },
    {--green power
    type = "item-subgroup",
    name = "green-power-producer",
    group = "production",
    order = "a2",
    },
    {--assemblers
    type = "item-subgroup",
    name = "assemblers-crafters",
    group = "production",
    order = "e",
    },
    {--inserters
    type = "item-subgroup",
    name = "long-hand-inserters",
    group = "logistics",
    order = "ca",
    },
    {--nixie and speaker
    type = "item-subgroup",
    name = "output-peripherals",
    group = "circuit",
    order = "e1",
    },
    {--radars
    type = "item-subgroup",
    name = "radars-and-rockets",
    group = "combat",
    order = "zz1",
    }
  }
)

-- if zrt_controlBool_krastorio2 ~= true then
  -- data:extend({{
    -- type = 
  -- }})
-- end

--function zrtChangeGroupOfitem(itemname,itemsub,newGroup)
--  for a,b in pairs(data.raw["item-groups"]) do
--    if itemname == b.name then
--      itemsub.group = newGroup
--    end
--  end
--end

function zrtNewSubGroup(newSubGroupName,refGroup,newOrder)
	local tipologia = "item-subgroup" 
	-- log("after logs should call extend")
	 
	-- log("type of table> "..tostring(newSubGroupName))
	if newSubGroupName.type == "ammo-category" then
    log("name of table> "..tostring(newSubGroupName.name))
	 log("name of assigned group> "..tostring(refGroup))
	 log("order is> "..tostring(newOrder))
	  data:extend(
		{{
		  type = tipologia,
		  name  = "zsrtammosubgroup-"..newSubGroupName.name,
		  group = refGroup,
		  order = newOrder
		}}
	  )
	end
end

----------------------------------
---           OLD
------------------------------------
-- function zrtNewSubGroup(newSubGroupName,refGroup,newOrder)
--   local tipologia = "item-subgroup" 
--   log("after logs should call extend")
--   log("name of table> "..tostring(newSubGroupName.name))
--   log("name of assigned group> "..tostring(refGroup))
--   log("order is> "..tostring(newOrder))
--   log("type of table> "..tostring(newSubGroupName))
--   if newSubGroupName.type == "ammo-category" then
--     data:extend(
--       {
--         type = tipologia,
--         name  = newSubGroupName.name,
--         group = refGroup,
--         order = newOrder
--       }
--     )
--   end
--end