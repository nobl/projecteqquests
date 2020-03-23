# TRIGGER: 
#   signal in 214056 - Decorin Berik dead, start/check timers
#   signal in 214057 - Decorin Grunhork dead, start/check timers
# 	signal in 214111 - event Vallon is dead, start timer/check timer
#	signal in 214108 - event Tallon is dead, start timer/check timer
#	signal in 214052 - mini rallos dead, check timer/spawn rallos
#	signal in 214113 - RZtW dead, depop
# 	blank signal out - despawn specified mob


my $Berik;
my $Grunhork;
my $event_vallon;
my $event_tallon;

sub EVENT_SPAWN {
    $Berik = 0;
    $Grunhork = 0;
	$event_vallon = 0;
	$event_tallon = 0;
	quest::settimer("rzuntarget", 5); # spawn untargetable rz
}

sub EVENT_SIGNAL {
        
        if ($signal == 214056) {        # Decorin Berik dead
                $Berik = 1;
              
                if ($Grunhork == 1) {   # Spawn Vallon and Tallon
                    quest::ze(0, "The air of Drunder grows strangely cold as a rumble shakes through the fortress' walls. The Warlord stirs.");
		    quest::stoptimer("Decorin");
                    quest::settimer("VTZek", 1800); # 30min to kill the Zek brothers
                    quest::unique_spawn(214111,188,0,620,580,145,385); # NPC: #Vallon_Zek_
                    quest::unique_spawn(214108,187,0,620,-560,145,385); # NPC: #Tallon_Zek
					$entity_list->FindDoor(14)->SetLockPick(0);
					$entity_list->FindDoor(15)->SetLockPick(0);
					$entity_list->FindDoor(16)->SetLockPick(0);
					$entity_list->FindDoor(17)->SetLockPick(0);
                    $Berik = 0;
                    $Grunhork = 0;
                } else {
                    quest::settimer("Decorin", 360); # 6min to kill other
                }
         }

        if ($signal == 214057) {        # Decorin Grunhork dead
                $Grunhork = 1;

                if ($Berik == 1) {   # Spawn Vallon and Tallon
		quest::ze(0, "The air of Drunder grows strangely cold as a rumble shakes through the fortress' walls. The Warlord stirs.");
                    quest::stoptimer("Decorin");
                    quest::settimer("VTZek", 1800); # 30min to kill the Zek brothers
                    quest::unique_spawn(214111,188,0,620,580,145,385); # NPC: #Vallon_Zek_
                    quest::unique_spawn(214108,187,0,620,-560,145,385); # NPC: #Tallon_Zek
					$entity_list->FindDoor(14)->SetLockPick(0);
					$entity_list->FindDoor(15)->SetLockPick(0);
					$entity_list->FindDoor(16)->SetLockPick(0);
					$entity_list->FindDoor(17)->SetLockPick(0);					
                    $Berik = 0;
                    $Grunhork = 0;
                } else {
                    quest::settimer("Decorin", 360); # 6min to kill other
                }
         }

		if ($signal == 214111) {	# Event Vallon Dead
			$event_vallon = 1;

			if ($event_tallon == 1) {	# check if Event Tallon is dead
				quest::stoptimer("VTZek");
				quest::signal(214052,0);	# tell fake Rallos to spawn Mini Rallos
							quest::settimer("Mini", 1800); # 30min to "kill" mini Rallos
				$event_vallon = 0;
				$event_tallon = 0;
			} 
		}
		
		if ($signal == 214108) {	# event Tallon dead
			$event_tallon = 1;
			if ($event_vallon == 1) { # check if event Vallon is dead
				quest::stoptimer("VTZek");
				quest::signal(214052,0);	# tell fake Rallos to spawn Mini Rallos
							quest::settimer("Mini", 1800); # 30min to "kill" mini Rallos
				$event_vallon = 0;
				$event_tallon = 0;
			} 			
		}

		if ($signal == 214052) {	# Mini Rallos done
			quest::stoptimer("Mini");
			quest::unique_spawn(214113,0,0,702,0,-294.9,0); # NPC: #Rallos_Zek_the_Warlord
		}
		
		if ($signal == 214113) {	#RZtW dead, depop
                        quest::updatespawntimer(214123,432000);
			quest::depop_withtimer();
		}
}

sub EVENT_TIMER {

    if ($timer eq "Decorin") { # times up to kill Decorins
            quest::stoptimer("Decorin");
            quest::signal(214056, 0); # NPC: Decorin_Berik
            quest::signal(214057, 0); # NPC: Decorin_Grunhork
            $Berik = 0;
            $Grunhork = 0;
    }

	if ($timer eq "VTZek") {	# times up, despawn Zeks
		quest::stoptimer("VTZek");
                quest::signal(214111);
                quest::signal(214108);
		$event_vallon = 0;
		$event_tallon = 0;
	}

	if ($timer eq "Mini") {		# times up, despawn mini rallos
		quest::stoptimer("Mini");
		quest::signal(214109);
		quest::settimer("rzuntarget", 5); # spawn untargetable rz
	}
	if ($timer eq "rzuntarget") {
		quest::stoptimer("rzuntarget");
		quest::unique_spawn(214052,0,0,500,11,194,129); # #Rallos_Zek_ (214052) untargetable
	}
}

# End of File	Zone: PoTactics	ID: 214123	-- #rallos_trigger
