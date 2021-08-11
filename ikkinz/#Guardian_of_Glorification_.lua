--Ikkinz Raid #2: Chambers of Glorification
--final split form that drops loot
local hp_regen = 15;

function event_spawn(e)
	eq.set_timer("checknpc", 1 * 1000);
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("random", 5 * 1000);
		eq.set_timer("OOBcheck", 3 * 1000);
	else
		eq.stop_timer("random");
		eq.stop_timer("OOBcheck");
	end
end

function event_timer(e)
	if (e.timer == "random") then
		local rand = math.random(1,100);
		if (rand >= 85) then -- 15 % to cast throw
		e.self:Emote("tosses its foes away wildly!");
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
				e.self:CastedSpellFinished(4185, e.self:GetHateRandom());	-- Spell: Throw
		elseif (rand < 85) and (rand >= 70) then -- 15 % to cast manabolt
			e.self:Emote("lets loose a bolt of energy toward his enemy!");
				e.self:CastedSpellFinished(1046, e.self:GetHateRandom());	-- Spell: Manabolt
		elseif (rand < 70) and (rand >= 55) then -- 15 % to cast Fling
			local npc1 = eq.get_entity_list():GetMobByNpcTypeID(294466);
			local npc2 = eq.get_entity_list():GetMobByNpcTypeID(294469);

				if (npc1.valid and npc2.valid) then

					if ( npc1:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) < npc2:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ())) then
						eq.signal(294466,1);
						
					else
						eq.signal(294469,1);
						
					end
				end
		end
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < 845) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
	elseif(e.timer=="checknpc") then
		eq.stop_timer("checknpc");
		local npc_list = eq.get_entity_list():GetNPCList();

		if (npc_list ~= nil) then
			-- loop through the list entries
			for npc in npc_list.entries do
			
				if (npc:GetNPCTypeID() == 294474) then
					-- if any Glorified_Bolsterer is alive, add hp
					eq.modify_npc_stat("max_hp", tostring(e.self:GetMaxHP() + 70000)); --increase max hp by 70k per npc (2 total)
				end
				if (npc:GetNPCTypeID() == 294475) then
					-- if any Glorified_Bolsterer is alive, add regen
					eq.modify_npc_stat("hp_regen", tostring(hp_regen + 1100)); --increase hp regen by 1100 per npc (2 total)
				end
				if (npc:GetNPCTypeID() == 294478) then
					-- if any Glorified_Bolsterer is alive, add min and max dmg
					eq.modify_npc_stat("min_hit", tostring(e.self:GetMinDMG() + 70)); --increase min dmg by 70 per npc (2 total)
					eq.modify_npc_stat("max_hit", tostring(e.self:GetMaxDMG() + 241)); --increase max dmg by 241 per npc (2 total)
				end
			end
		end
	end
end

function event_death_complete(e)
	eq.signal(294631,4); -- NPC: lockout_ikkinz
	eq.spawn2(294585, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --NPC: a_pile_of_bones
end

function event_signal(e)
	if (e.signal == 1) then
 		eq.modify_npc_stat("hp_regen", tostring(hp_regen - 1100)); --decrease max hp by 1100 per npc signal(2 total)
	elseif (e.signal == 2) then
		eq.modify_npc_stat("max_hp", tostring(e.self:GetMaxHP() - 70000)); --reduce max hp by 70k per npc signal (2 total)
	elseif (e.signal == 3) then
		eq.modify_npc_stat("min_hit", tostring(e.self:GetMinDMG() - 70)); --decrease min dmg by 70 per npc signal(2 total)
		eq.modify_npc_stat("max_hit", tostring(e.self:GetMaxDMG() - 241)); --decrease max dmg by 241 per npc signal(2 total)
	end
end
