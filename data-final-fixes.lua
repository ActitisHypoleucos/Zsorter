--PLANS
--apply the autosorting to fuels
--apply the autosorting to intermediate products
--create setting to decide where to put space stuff (rocket)
----is it science? is it production? is it combat? is it its own stuff(Along asteroid mining)
--create the function to decide based on tech-tier the subgroup vertical order
--create the function to decide based on tech-tier and then complexity the recipe horizontal order
--fix the more_ammo issue with different names for recipes.name (magazine?) and ammo.name (ammo?)
--
--have a beer
--\todo
require("prototypes.item-groups")
--\require
--/set bools for modcheck
for _,item in pairs(data.raw.item) do
	name = item.name
	type = item.type
	if name == "long-filter-inserter" then
		zrt_controlBool_long_inserters = true
	elseif name == "kr-logo" then
		zrt_controlBool_krastorio2 = true
	elseif name == "god-module" then
		zrt_controlBool_AdvandcedModules = true
	elseif name == "nameofrifleammo" then
		zrt_controlBool_AnyModForRifleAmmo = true
	end
end
--\set bools for modcheck
--/sort recipes
function sortdataset(dataset)
	for _,recipe in pairs(dataset) do
		str = recipe.name
		if dataset == data.raw.recipe then
			category_Item = dataset[str].category
		elseif dataset == data.raw.item then
			category_Item = dataset[str].type
		end
	    
		--vehicles
		if str == "kr-advanced-tank" then
			dataset[str].subgroup = "vehicles-military"
		elseif str == "vehicle-warden" then
			dataset[str].subgroup = "vehicles-civilian"
		elseif str == "vehicle-hauler" then
			dataset[str].subgroup = "vehicles-civilian"
		--logistic
		--fluids
	    elseif string.find(str, "pipe") then
	        if str ~= "heat-pipe" then
				if str ~= "infinity-pipe" then
					dataset[str].subgroup = "pipe-distribution"
				end
			end
		
	    elseif str == "storage-tank" then
			dataset[str].subgroup = "pipe-distribution"
			dataset[str].order = "v-bb2"
		elseif str == "kr-fluid-storage-1" then
			dataset[str].subgroup = "pipe-distribution"
			dataset[str].order = "v-bb3"
		elseif str == "kr-fluid-storage-2" then
			dataset[str].subgroup = "pipe-distribution"
			dataset[str].order = "v-bb4"
		elseif str == "pump" then
			dataset[str].subgroup = "pipe-distribution"
			dataset[str].order = "v-bb0"
	    elseif str == "kr-steel-pump" then
			dataset[str].subgroup = "pipe-distribution"
			dataset[str].order = "v-bb1"
		
		--chests
		elseif str ==  "iron-chest" then
			dataset[str].subgroup = "storage"
			dataset[str].order = "aaab"
		elseif str ==  "wooden-chest" then
			dataset[str].subgroup = "storage"
			dataset[str].order = "aaac"
		elseif str == "logistic-chest-active-provider" then
			dataset[str].subgroup = "container-1"
			dataset[str].order = "b[storage]-1-c[logistic-chest-active-provider"
		elseif str == "logistic-chest-buffer" then
			dataset[str].subgroup = "container-1"
			dataset[str].order = "b[storage]-1-e[logistic-chest-buffer]"
		elseif str == "logistic-chest-passive-provider" then
			dataset[str].subgroup = "container-1"
			dataset[str].order = "b[storage]-1-b[logistic-chest-passive-provider"
		elseif str == "logistic-chest-requester" then
			dataset[str].subgroup = "container-1"
			dataset[str].order = "b[storage]-1-f[logistic-chest-requester]"
		elseif str == "logistic-chest-storage" then
			dataset[str].subgroup = "container-1"
			dataset[str].order = "b[storage]-1-d[logistic-chest-storage]"
		
		--dectorio
		elseif str == "waterfill-recipe" then
			dataset[str].subgroup = "landscaping-earthworks"
			dataset[str].order = "b[1base-shore]"
		elseif string.find(str, "tree") then
			dataset[str].subgroup = "decoratives"
			dataset[str].order = "c1"
		elseif str == "rock-big" then
			dataset[str].subgroup = "decoratives"
			dataset[str].order = "c2"
		elseif str == "rock-huge" then
			dataset[str].subgroup = "decoratives"
			dataset[str].order = "c2"
		--elseif str == "stone-brick" then
		--	dataset[str].subgroup = "flooring-basic"
		--	dataset[str].order = "00[c-brick]"
		elseif str == "stone-wall"  then
			dataset[str].subgroup = "defensive-structure"
			dataset[str].order = "a[b-stone-wall]"
		elseif str == "gate"  then
			dataset[str].subgroup = "defensive-structure"
			dataset[str].order = "a[b-stone-gate]"
		--dectorio--concretes
		elseif str == "hazard-concrete" then
			dataset[str].subgroup = "tiles-second-tier"
			dataset[str].order = "00c[d-1]"
		elseif str == "refined-hazard-concrete" then
			dataset[str].subgroup = "tiles-second-tier"
			dataset[str].order = "00c[d-2]"
		elseif str == "kr-white-reinforced-plate" then
			dataset[str].subgroup = "tiles-second-tier"
			dataset[str].order = "00c[d-3]"
		elseif str == "kr-black-reinforced-plate" then
			dataset[str].subgroup = "tiles-second-tier"
			dataset[str].order = "00c[d-4]"
			
		--science
		elseif str == "burner-lab" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "00"
		elseif str == "lab" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "01"
		elseif str == "kr-research-server" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "03"
		elseif str == "biusart-lab" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "02"
		elseif str == "kr-quantum-computer" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "04"
		elseif str == "kr-singularity-lab" then
			dataset[str].subgroup = "science-lab"
			dataset[str].order = "05"
		
		--circuit
		elseif string.find(str, "lamp") then
			if str == "concrete-lamppost" then
				dataset[str].order = "5"
			end
			dataset[str].subgroup = "circuit-visual"

		elseif str == "balloon-light" or str == "short-balloon-light" then
			dataset[str].subgroup = "circuit-visual"
		
			dataset[str].order= "000"
		elseif str == "hnt-search-light" then
			dataset[str].subgroup = "circuit-visual"
			dataset[str].order = "6"
		elseif str == "programmable-structures" then
			dataset[str].subgroup = "output-peripheralsl"
		elseif string.find(str, "nixie") then
			dataset[str].subgroup = "output-peripherals"
			
		--fuels
		elseif string.find(str, "fuel") then
			if str ~= "kr-fuel-refinery" and str ~= "fuel-processor" then
				dataset[str].subgroup = "fuelssmachine"
			end
		elseif str == "matter-stabilizer" then
			dataset[str].subgroup = "fuelssmachine"
		elseif str == "charge-stabilizer" then
			dataset[str].subgroup = "fuelssmachine"
		
		--artillery	
		--elseif str =="artillery-turret" then
		--	dataset[str].subgroup = "vanilla-artillery-turret"
		--elseif str == "artillery-shell" then
		--	dataset[str].subgroup = "vanilla-artillery-turret"
		--elseif str == "nuclear-artillery-shell" then --nuke
		--	dataset[str].subgroup = "vanilla-artillery-turret"
		--elseif str == "antimatter-artillery-shell" then --antimatter
		--	dataset[str].subgroup = "vanilla-artillery-turret"
		
		
--		elseif str =="artillery-turret" then
--			dataset[str].subgroup = "vanilla-artillery-turret"
--		elseif str == "artillery-shell" then
--			dataset[str].subgroup = "vanilla-artillery-turret"
--		elseif str == "nuclear-artillery-shell" then --nuke
--			dataset[str].subgroup = "vanilla-artillery-turret"
--		elseif str == "antimatter-artillery-shell" then --antimatter
--			dataset[str].subgroup = "vanilla-artillery-turret"
		elseif str == "kr-singularity-beacon" then
			if zrt_controlBool_AdvandcedModules then
				dataset[str].subgroup = "a-beacon"
				dataset[str].order = "0"
			else 
				dataset[str].order = "z"
			end

--			dataset[str].order= "z"
		elseif str == "rsc-excavation-site" then
			dataset[str].subgroup = "space-related"
			dataset[str].order = "00"
		elseif str == "satellite" then
			dataset[str].subgroup = "space-related"
			dataset[str].order = "01"
		elseif str == "gps-satellite" then
			dataset[str].subgroup = "space-related"
			dataset[str].order = "02"
		elseif str == "orbital-ion-cannon" then
			dataset[str].subgroup = "space-related"
--			dataset[str].order = "02"
		elseif str == "mirv-rocket" then
			dataset[str].subgroup = "space-related"
--			dataset[str].order = "02"
			
			
		--power-green
		elseif str == "kr-wind-turbine" then
			dataset[str].subgroup = "green-power-producer"
		elseif str == "solar-panel" then
			dataset[str].subgroup = "green-power-producer"
		elseif str == "kr-advanced-solar-panel" then
			dataset[str].subgroup = "green-power-producer"
		elseif str == "accumulator" then
			dataset[str].subgroup = "green-power-producer"	
		elseif str == "kr-energy-storage" then
			dataset[str].subgroup = "green-power-producer"	
		elseif str == "kr-air-purifier" then
			dataset[str].subgroup = "green-power-producer"	
		elseif string.find(str, "er:hcg") then
			dataset[str].subgroup = "green-power-producer"
			dataset[str].order = "00"

		--production - machines (aka crafters not fluids)
		elseif str == "burner-assembling-machine" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "assembling-machine-1" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "assembling-machine-2" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "assembling-machine-3" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "kr-advanced-assembling-machine" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "kr-crusher" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "centrifuge" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "kr-matter-plant" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "kr-matter-assembler" then
			dataset[str].subgroup = "assemblers-crafters"
		elseif str == "kr-stabilizer-charging-station" then
			dataset[str].subgroup = "assemblers-crafters"

		--tools
		elseif str == "first-aid-kit" then
			dataset[str].subgroup = "tool"
			dataset[str].order = "b[repair]-0[health]"
		elseif str == "kr-jackhammer" then
			dataset[str].subgroup = "tool"
			dataset[str].order = "b[repair]-b[hammer]"
		elseif str == "kr-creep-collector" then
			dataset[str].subgroup = "tool"
			dataset[str].order = "b[repair]-c[creep-clean]"
		elseif str == "grappling-gun" then
			dataset[str].subgroup = "tool"
			dataset[str].order = "b[repair]-d[grappling-gun]"
		elseif str == "grappling-gun-ammo" then
			dataset[str].subgroup = "tool"
			dataset[str].order = "b[repair]-e[grappling-gun-ammo]"
		elseif string.find(str, "remote") or str == "ion-cannon-targeter" then
			dataset[str].subgroup = "remote"

		--for *.type = "equipment-category" if >>vehicle ONLY
		elseif dataset[str].subgroup == "vehicle-motor" then
			dataset[str].subgroup = "vehicle_grid_modules"

		--transport
		elseif str == "manual-color-module" then
			dataset[str].subgroup = "vehicle_grid_modules"
			dataset[str].order = "a"
		elseif str == "kr-nuclear-locomotive" then
			dataset[str].subgroup = "vehicles-railway"
			dataset[str].order = "a[train-system]-f[nuclear locomotive]"
		
		elseif str == "equipment-gantry" then
			dataset[str].subgroup = "equipment-gantry"
		elseif str == "equipment-gantry-remover" then
			dataset[str].subgroup = "equipment-gantry"
		elseif str == "perfect-night-glasses" then
			dataset[str].subgroup = "character-equipment"
		elseif string.find(str, "jetpack") then
			dataset[str].subgroup = "character-equipment"

		--vanilla turrets
		elseif str == "gun-turret" then
			dataset[str].subgroup = "vanilla-turrets"
		elseif str == "laser-turret" then
			dataset[str].subgroup = "vanilla-turrets"
		elseif str == "flamethrower-turret" then
			dataset[str].subgroup = "vanilla-turrets"
		
		elseif str == "personal-laser-defense-equipment" and zrt_controlBool_krastorio2 ~= true then
			dataset[str].subgroup = "character-equipment"
		elseif str == "discharge-defense-equipment" and zrt_controlBool_krastorio2 ~= true then
			dataset[str].subgroup = "character-equipment"
		elseif str == "energy-shield-mk2-equipment" and zrt_controlBool_krastorio2 ~= true then
			dataset[str].subgroup = "character-equipment"
		elseif str == "energy-shield-equipment" and zrt_controlBool_krastorio2 ~= true then
			dataset[str].subgroup = "character-equipment"
		
		
			
		--radar/big brother
		elseif str == "big_brother-surveillance-center" then
			dataset[str].subgroup = "radars-and-rockets"
		elseif str == "radar" then
			dataset[str].subgroup = "radars-and-rockets"	
		elseif string.find(str, "vehicle") and string.find(str, "miner") then
			if string.find(str, "launcher") == false then
				dataset[str].subgroup = "ai:miners"
			end

		--pda-road-sign
		elseif string.find(str, "pda") then
			dataset[str].subgroup = "pda-road-sign"
		
		--long inserters		
		elseif string.find(str, "long-") then
			if string.find(str, "-inserter") then
				if zrt_controlBool_long_inserters then
					if dataset[str].category == "crafting"  then
						dataset[str].subgroup = "long-hand-inserters"
					elseif  dataset[str].type == "item" then
						dataset[str].subgroup = "long-hand-inserters"
					end
				end
			end
		end
	end
end
----------------------------------------------------------------
--SORT AMMO
----------------------------------------------------------------
--function zrtAmmo(dataset)
--	for a,s in pairs(dataset) do
--		ammovalcategory = s.name
--		log("category_dataset : " ..ammovalcategory)
--		log("index dataset : " ..s.type)
--		if ammovalcategory ~= nil then
--			zrtNewSubGroup(ammovalcategory,"combat","z")	
--		end
--	end
--end	
			--put IN FRONT (to do) guns that use the ammo
--			for h,gunitem in pairs(data.raw.gun) do
--				if gunitem.attack_parameters.ammo_category == ammovalcategory then
--					changeMainDatasets(item,property,newValue)()
--					--end
--				----find a way to push the guns always first, and to apply this to buildings (turrets)
--				--log("gun item_name:".. gunitem.name)
--				--log("gun item_type:".. gunitem.type)
--				--if gunitem.subgroup == "gun" then
--				--	protyName = gunitem.name
--				--	if gunitem.attack_parameters.ammo_type ~= nil then
--				--		protyCate = gunitem.attack_parameters.ammo_type
--				--	else 
--				--		protyCate = gunitem.attack_parameters.ammo_category
--				--	end
--				--	log("nome ARMA:  ".. protyName)
--				--	--log("nome CATE:  ".. protyCate.name)
--				--	if protyCate == ammovalcategory then
--				--		if protyCate ~= nil and protyName ~= nil then
--				--			changerecipefolder(protyName,ammovalcategory)
--				--		end
--				--	end
--				end
--			end
--
--			--put every ammo of that category together
--			for b,ammoItem in pairs(data.raw.ammo) do
--				nomone = ammoItem.name
--				log("aiming to fill> "..ammovalcategory)
--				log("name of ammo> "..nomone)
--				if string.find(nomone, "rounds") and string.find(nomone,"magazine") then
--					nomone = string.gsub(nomone, '"rounds-magazine"', '"ammo-recipe"')
--					log("new name of ammo> "..nomone)
--				end
--
--				for c,ammospecs in pairs(data.raw.ammo[nomone].ammo_type) do
--					if ammospecs == "bullets" and zrt_controlBool_AnyModForRifleandPistolAmmo == true then
--						data.raw.ammo[nomone].subgroup = "rifle-ammo"
--					elseif ammospecs == ammovalcategory then
--						data.raw.ammo[nomone].subgroup = ammovalcategory
--						log("ammo add> "..nomone)
--						log("in subgroup> "..ammovalcategory)
--					elseif string.find(nomone, "flamethrower") and ammovalcategory == "flamethrower" then
--						data.raw.ammo[nomone].subgroup = ammovalcategory
--					end
--				end
--			end
--		--
--	end

---------------------------------------------------------------- 
--function sortammo(dataset)
--	for a,category in pairs(dataset) do
--		ammovalcategory = category.name
--		
--		log("category_dataset : " ..ammovalcategory)
--		log("index dataset : " ..a)
--		--
--			MakeNewSubGroup(ammovalcategory ,"combat","z")
--		
--			--put IN FRONT (to do) guns that use the ammo
--			for h,gunitem in pairs(data.raw.gun) do
--				--find a way to push the guns always first, and to apply this to buildings (turrets)
--				log("gun item_name:".. gunitem.name)
--				log("gun item_type:".. gunitem.type)
--				if gunitem.subgroup == "gun" then
--					protyName = gunitem.name
--					if gunitem.attack_parameters.ammo_type ~= nil then
--						protyCate = gunitem.attack_parameters.ammo_type
--					else 
--						protyCate = gunitem.attack_parameters.ammo_category
--					end
--					log("nome ARMA:  ".. protyName)
--					--log("nome CATE:  ".. protyCate.name)
--					if protyCate == ammovalcategory then
--						if protyCate ~= nil and protyName ~= nil then
--							changerecipefolder(protyName,ammovalcategory)
--						end
--					end
--				end
--			end
--
--			--put every ammo of that category together
--			for b,ammoItem in pairs(data.raw.ammo) do
--				nomone = ammoItem.name
--				log("aiming to fill> "..ammovalcategory)
--				log("name of ammo> "..nomone)
--				if string.find(nomone, "rounds") and string.find(nomone,"magazine") then
--					nomone = string.gsub(nomone, '"rounds-magazine"', '"ammo-recipe"')
--					log("new name of ammo> "..nomone)
--				end
--
--				for c,ammospecs in pairs(data.raw.ammo[nomone].ammo_type) do
--					if ammospecs == "bullets" and zrt_controlBool_AnyModForRifleandPistolAmmo == true then
--						data.raw.ammo[nomone].subgroup = "rifle-ammo"
--					elseif ammospecs == ammovalcategory then
--						data.raw.ammo[nomone].subgroup = ammovalcategory
--						log("ammo add> "..nomone)
--						log("in subgroup> "..ammovalcategory)
--					elseif string.find(nomone, "flamethrower") and ammovalcategory == "flamethrower" then
--						data.raw.ammo[nomone].subgroup = ammovalcategory
--					end
--				end
--			end
--		--
--	end
--end

--
--/thx eduran by forumdigging for the reference of gsub about quotes
--
--
--local code_block = [[
--  local string_1, string_2 = "Hello World!", "foo"
--  local number = 123
--  local function foo(arg)
--    return tostring(arg) .. "\n"
--  end
--]]
--
--print(string.gsub(code_block, '".-"', '[color=64,64,64]%1[/color]'))  -- single quotes around double quotes
--print(string.gsub(code_block, "\".-\"", '[color=64,64,64]%1[/color]'))  -- escaped double quotes
--
--<output-->
-->local string_1, string_2 = [color=64,64,64]"Hello World!"[/color], [color=64,64,64]"foo"[/color]
-->local number = 123
-->local function foo(arg)
-->  return tostring(arg) .. [color=64,64,64]"\n"[/color]
-->end
--/

--["acid-rounds-magazine"] = {
--	ammo_type = {
--	  action = {
--		action_delivery = {
--		  target_effects = {
--			{
--			  entity_name = "acid-splash-fire-spitter-small",
--			  type = "create-entity"
--			},
--			{
--			  damage = {
--				amount = 20,
--				type = "acid"
--			  },
--			  type = "damage"
--			}
--		  },
--		  type = "instant"
--		},
--		type = "direct"
--	  },
--	  category = "bullet"

-----------------------------------------------------------
function gunItemAcceptsAmmo(givenGun,givenAmmo)
	for p,givenAmmoRecord in pairs(data.raw.ammo[givenAmmo].ammotype) do
		if data.raw.gun[givenGun].attack_parameters.ammo_category == givenAmmoRecord.category then
			return true
		end
	end
end
-----------------------------------------------------------
function zrtChangeTableItemProperty(dataset,item,property,newValue)
	for i,x in pairs(dataset) do
		if x.name == item then
			dataset[item].property = newvalue
		end
	end
end
-----------------------------------------------------------
--
function changeMainDatasets(item,property,newValue)
	zrtChangeTableItemProperty(data.raw.item,item,property,newValue)
	zrtChangeTableItemProperty(data.raw.recipe,item,property,newValue)
--v OLD
--function changerecipefolder(prototypeName,prototypeSubGroup)
--	if prototypeSubGroup ~= nil then
--		for _,recipe in pairs(data.raw.recipe) do
--			if recipe.name == prototypeName then
--				data.raw.recipe[prototypeName].subgroup = prototypeSubGroup
--			end
--		end
--		for _,item in pairs(data.raw.item) do
--			if item.name == prototypeName then
--				data.raw.item[prototypeName].subgroup=prototypeSubGroup
--			end
--		end
--	end
end
-----------------------------------------------------------
	--getbools()
	---zrtAmmo(data.raw["ammo-category"])	
	sortdataset(data.raw.recipe)
	sortdataset(data.raw.item)
	--sortdataset(data.raw.signal)
	
	--sortammo(data.raw.ammo)
--check for mod, call using a table with names and presets values for namepool{name, type(if item), category(if recipe), group, subgroup, order, mod_name(if mod)} to handle the sorting
--if krastorio2 ~= nil then
--	sortdataset(data.raw.item, namepool(where mod_name is krastorio2))
--	sortdataset(data.raw.recipe, namepool(where mod_name is krastorio2))
--end