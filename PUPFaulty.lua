-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    
	state.Buff["Overdrive"] = buffactive["Overdrive"] or false
	state.Buff["Overload"] = buffactive["Overload"] or false
	
	petEmnitySkills = S{"Provoke", "Flash", "Shield Bash"}
	
	-- List of pet weaponskills to check for
    petWeaponskills = S{"Slapstick", "Knockout", "Magic Mortar",
        "Chimera Ripper", "String Clipper",  "Cannibal Blade", "Bone Crusher", "String Shredder",
        "Arcuballista", "Daze", "Armor Piercer", "Armor Shatterer"}
		
	-- Var to track the current pet mode.
    state.AutomatonMode = M{['description']='PetMelee','PetFullDT','PetRanged','PetMage','PetWHM'}	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.AutomatonMode:options('PetMelee','PetFullDT','PetRanged','PetMage','PetWHM')
	state.OffenseMode:options('Normal', 'Acc', 'Fodder')
    state.HybridMode:options('Normal', 'DT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Fodder')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

	gear.RepairOil = "Automat. Oil +3"
	
	-- Additional local binds
	send_command('bind ^f7 gs c cycle AutomatonMode')
	
   select_default_macro_book()	
	
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^f7')
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if spell.english == 'Repair' then
		if player.status == 'Idle' then
			equip(sets.precast.IdleRepair)
		else 
			equip(sets.precast.NormalRepair)
		end		
	end
end    	

-- Called when pet is about to perform an action
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if petEmnitySkills:contains(spell.english) then
        classes.CustomClass = "Emnity"
    end
end

-- Called when pet is about to perform an action
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if petWeaponskills:contains(spell.english) then
        classes.CustomClass = "Weaponskill"
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if pet.isvalid then
		if state.AutomatonMode.current ~= 'PetFullDT' then 
            idleSet = sets.idle.Pet.Tank			
		else 
			if pet.status == "Idle" then
				idleSet = set_combine(sets.idle.Pet,{})
			elseif pet.status == "Engaged" then
				if state.AutomatonMode.current ~= 'PetMelee' then
					idleSet = sets.idle.Pet.Engaged
				elseif state.AutomatonMode.current ~= 'PetRanged' then
					idleSet = sets.idle.Pet.Engaged.Ranged
				elseif	state.AutomatonMode.current ~= 'PetMage' then
					idleSet = sets.idle.Pet.Engaged.Mage
				elseif state.AutomatonMode.current ~= 'PetWHM' then
					idleSet = sets.idle.Pet.Engaged.WHM
				end
			end	
		end		
	else
		idleSet = sets.idle
    end
    return idleSet
end

-- Modify the default engaged set after it was constructed.
function customize_melee_set(meleeSet)
    if pet.isvalid then
		if state.AutomatonMode.current ~= 'PetFullDT' then 
            meleeSet = sets.engaged.Pet.Tank			
		elseif state.AutomatonMode.current ~= 'PetMelee' then
			meleeSet = sets.engaged.Pet.Melee
		elseif state.AutomatonMode.current ~= 'PetRanged' then
			meleeSet = sets.engaged.Pet.Ranged
		elseif	state.AutomatonMode.current ~= 'PetMage' then
			meleeSet = sets.engaged.Pet.Mage
		elseif state.AutomatonMode.current ~= 'PetWHM' then
			meleeSet = sets.engaged.Pet.WHM
		end
	else
		meleeSet = sets.engaged
    end
    return meleeSet
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Update custom groups based on the current pet.
function update_custom_groups()
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        classes.CustomIdleGroups:append(state.PetMode.value)
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(2, 2)
end


