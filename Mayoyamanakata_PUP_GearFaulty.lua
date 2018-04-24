-- Define sets used by this job file.
function init_gear_sets()
    
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
	head="Pitre Taj +2",neck='Voltsurge Torque',ear2="Loquacious Earring",
	body="Zendik Robe",hands="Tali'ah Gages +1",ring1="Prolix Ring",ring2="Lebeche Ring",
	legs="Rao Haidate",feet="Herculean Boots"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Bead Necklace"})

    
    -- Precast sets to enhance JAs
    sets.precast.JA['Overdrive'] = {Body="Pitre Tobe +2"}	
	--sets.precast.JA['Role Reversal'] = {feet="Pantin Babouches"}	
	sets.precast.JA['Tactical Switch'] = {feet="Karagoz Scarpe +1"}
    sets.precast.JA.Maneuver = {ear2="Burana Earring",body="Karagoz Farsetto",hands="Foire Dastanas"}

	-- Repair/Maintenance 
	sets.precast.IdleRepair = {main="Nibiru Sainti",ammo=gear.RepairOil,ear1="Guignol Earring",ear2="Pratik Earring",feet="Foire Babouches"}		
	sets.precast.NormalRepair = {ammo=gear.RepairOil,ear1="Guignol Earring",ear2="Pratik Earring",feet="Foire Babouches"}
	sets.precast.JA['Maintenance'] = {ammo=gear.RepairOil}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {feet="Rawhide Boots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    sets.precast.Step = {ear1="Choreia Earring"}
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Pitre Taj +2",neck="Fotia Gorget",ear1="Brutal Earring",ear2="Bladeborn Earring",
        body="Pitre Tobe +2",hands="Tali'ah Gages +1",ring1="Apate Ring",ring2="Regal Ring",
        back="Visucius's Mantle",waist="Fotia Belt",legs="Rao Haidate",feet="Herculean Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	-- Stringing Pummel: 32% STR / 32% VIT. Chance of critical hit varies with TP.
    sets.precast.WS['Stringing Pummel'] = set_combine(sets.precast.WS, {})

	-- Victory Smite: 80% STR. Chance of critical hit varies with TP. 
    sets.precast.WS['Victory Smite'] = set_combine(sets.precast.WS, {})
 
	-- Shijin Spiral: 73~85% DEX. Attack Modifier: 	1.05. fTP doesn't transfer to every hit.
    sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
		neck="Caro Necklace",ear2="Dudgeon Earring",
		body="Pitre Tobe +2",hands="Tali'ah Gages +1",ring2="Zilant Ring", 
		back="Kayapa Cape",waist="Windbuffet Belt",feet="Herculean Boots"})

    
    -- Midcast Sets
    sets.midcast.FastRecast = {
		head="Pitre Taj +2",neck='Voltsurge Torque',ear2="Loquacious Earring",
		body="Zendik Robe",hands="Tali'ah Gages +1",ring1="Prolix Ring",ring2="Lebeche Ring",
		legs="Rao Haidate",feet="Herculean Boots"}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})		
        

    -- Midcast sets for pet actions
    sets.midcast.Pet.Cure = {legs="Foire Churidars +2",feet="Karagoz Scarpe +1"}

    sets.midcast.Pet['Elemental Magic'] = {
		head="Pitre Taj +2",neck="",ear1="Enmerkar Earring",ear2="Burana Earring",
		body="Tali'ah Manteel",hands="Tali'ah Gages +1",ring1="Thurandaut Ring",
		back="Visucius's Mantle",waist="Ukko Sash",legs="Foire Churidars +2",feet="Karagoz Scarpe +1"}
	
	sets.midcast.Pet['Dark Magic'] = {
		head="Pitre Taj +2",neck="",ear1="Enmerkar Earring",ear2="Burana Earring",
		body="Tali'ah Manteel",hands="Tali'ah Gages +1",ring1="Thurandaut Ring",
		back="Visucius's Mantle",waist="Ukko Sash",legs="Foire Churidars +2",feet="Karagoz Scarpe +1"}
	
	sets.midcast.Pet['Enfeebling Magic'] = {
		head="Pitre Taj +2",neck="",ear1="Enmerkar Earring",ear2="Burana Earring",
		body="Tali'ah Manteel",hands="Tali'ah Gages +1",ring1="Thurandaut Ring",
		back="Visucius's Mantle",waist="Ukko Sash",legs="Foire Churidars +2",feet="Karagoz Scarpe +1"}
	
	sets.midcast.Pet['Provoke'] = {
		head="Heyoka Cap",ear1="Rimeice Earring",ear2="Domesticator Earring",
		body="Heyoka Harness",hands="Heyoka Mittens",
		legs="Heyoka Subligar",feet="Durgai Leggings"}

    sets.midcast.Pet.Weaponskill = {
		head="Cirque Cappello +1", ear2="Burana Earring",
		hands="Cirque Guanti +2", legs="Cirque Pantaloni +2"}

	
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets --
    sets.idle = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Rimeice Earring",ear2="Enmerkar Earring",
		body="Zendik Robe",hands="Tali'ah Gages +1",ring1="Defending Ring",ring2="Succor Ring",
		back="Visucius's Mantle",waist="Isa Belt",legs="Foire Churidars +2",feet="Hermes' Sandals"}

    sets.idle.Town = set_combine(sets.idle, {})

	--Master/Pet both Idle
	sets.idle.Pet = {main='Ohtas',
		head="Pitre Taj +2",neck="Twilight Torque",ear1="Rimeice Earring",ear2="Enmerkar Earring",
		body="Foire Tobe +2",hands="Rao Kote",ring1="Thurandaut Ring",ring2="Varar Ring",
		back="Visucius's Mantle",waist="Isa Belt",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}	
	
	--Master Idle, Pet Melee Set
	sets.idle.Pet.Engaged = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Rimeice Earring",ear2="Enmerkar Earring",
		body="Foire Tobe +2",hands="Tali'ah Gages +1",ring1="Thurandaut Ring",ring2="Varar Ring",
		back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}

	--Master Idle, Pet Tank Set			
	sets.idle.Pet.Engaged.Tank = {Main='Midnights',
		head="Anwig Salade",neck="Empath Necklace",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Foire Tobe +2",hands="Rao Kote",ring1="Thurandaut Ring",ring2="Varar ring",
		back="Visucius's Mantle",waist="Isa Belt",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}    

	--Master Idle, Pet Ranged (not in melee range) Set		
	sets.idle.Pet.Engaged.Ranged = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Rimeice Earring",ear2="Burana Earring",
		body="Foire Tobe +2",hands="Rao Kote",ring1="Thurandaut Ring",ring2="Varar Ring",
		back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Tali'ah Seraweels",feet="Tali'ah Crackows +1"}

	--Master Idle, Pet BLM/RDM Set		
	sets.idle.Pet.Engaged.Mage = set_combine(sets.idle.Pet,{})

	--Master Idle, Pet WHM Set	
	sets.idle.Pet.Engaged.WHM = set_combine(sets.idle.Pet,{})	

	-- Engaged sets
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
	
    sets.engaged = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Brutal Earring",ear2="Rimeice Earring",
		body="Rawhide Vest",hands="Tali'ah Gages +1",ring1="Thurandaut Ring",ring2="Regal Ring",
		back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}
	sets.engaged.Acc = {}
    sets.engaged.DT = {}
    sets.engaged.Acc.DT = {}	

	sets.engaged.Pet = {}

	sets.engaged.Pet.Tank = sets.idle.Pet.Tank
	
	sets.engaged.Pet.Melee = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Rimeice Earring",ear2="Enmerkar Earring",
		body="Foire Tobe +2",hands="Tali'ah Gages +1",ring1="Regal Ring",ring2="Varar Ring",
		back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}

	sets.engaged.Pet.Ranged = {main='Ohtas',
		head="Pitre Taj +2",neck="Empath Necklace",ear1="Rimeice Earring",ear2="Kemas Earring",
		body="Foire Tobe +2",hands="Tali'ah Gages +1",ring1="Rajas Ring",ring2="Varar Ring",
		back="Visucius's Mantle",waist="Hurch'lan Sash",legs="Foire Churidars +2",feet="Tali'ah Crackows +1"}	
	
	sets.engaged.Pet.Mage = sets.engaged.Pet
		
	sets.engaged.Pet.WHM = sets.engaged.Pet	
	
						

    -- Defense sets

    sets.defense.Evasion = {}

    sets.defense.PDT = {}

    sets.defense.MDT = {}

    sets.Kiting = {feet="Hermes' Sandals"}

end
