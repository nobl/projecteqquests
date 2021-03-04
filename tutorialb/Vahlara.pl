#BeginFile Vahlara.pl
#Quests for The Mines of Gloomingdeep - Vahlara: Gloomingdeep Silk Collecting
# items: 67111, 67125, 67104, 67118, 54234, 54217, 54218, 54219, 54220, 54221, 54222, 54223, 54225, 54226, 54227, 54228, 86010
sub EVENT_SAY {
  if (quest::istaskactivityactive(17,3)) {
    quest::say("Gut gemacht. Der Nahrungsvorrat der Revolte ist vorerst sicher. Melde Dich bei den Wachen, wenn Du ausgeruht bist.");
  }
  else {
    if (defined($qglobals{amote}) && ($qglobals{amote} == 2)) { #Emote spawnwer "Vast"
      quest::spawn2(189119,0,0,-126.0,-295.8,3.0,249.6); # NPC: _
    }
    if (defined($qglobals{bmote}) && ($qglobals{bmote} == 2)) { #Emote spawner "Screams"
      quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,270.2); # NPC: _
    }
    if ($text=~/hail/i) {
      if(quest::istaskactivityactive(22,2)) {
		if ($class eq "Berserker" || $class eq "Rogue" || $class eq "Shaman" || $class eq "Ranger"){
        	quest::summonitem(67111); # Item: Gloomingdeep Kobold Chain Sleeves
		}
		elsif ($class eq "Enchanter" || $class eq "Necromancer" || $class eq "Wizard" || $class eq "Magician"){
		quest::summonitem(67125); # Item: Gloomingdeep Kobold Cloth Sleeves
		}
		elsif ($class eq "Warrior" || $class eq "Bard" || $class eq "Shadowknight" || $class eq "Paladin" || $class eq "Cleric"){
		quest::summonitem(67104); # Item: Gloomingdeep Kobold Plate Vambraces
		}
		elsif ($class eq "Druid" || $class eq "Monk" || $class eq "Beastlord"){
		quest::summonitem(67118); # Item: Gloomingdeep Kobold Leather Sleeves
		}
      }
      quest::say("Ich bin froh, dass Du es geschafft hast, den Sklavenlagern in einem Stück zu entkommen. Es gibt viele [" . quest::saylink("andere") . "], die nicht so viel Glück hatten. Hier, nimm diese Rüstung, die wir bei einem Kobold gefunden haben. Es ist nicht viel, aber es sollte Dir Sicherheit bieten.");
      quest::popup("Rüstung ausrüsten", "Vahlara hat Dir ein Stück Kobold-Rüstung angeboten, um Dich zu beschützen.
                    <br><br>Rüste die Rüstung aus, indem Du sie in das große rechteckige Symbol in der Mitte Deines Inventars (<c \"#00c8f0\"> i</c> ) ziehst und ablegst.
  Beachte, dass die Rüstung automatisch in den entsprechenden Rüstungsplatz an Deinem Körper wandert.<br><br> Beachte auch, dass einige Rüstungen, die Du später erhältst, nur ausgerüstet werden können, indem Du sie direkt in den entsprechenden Platz legst, z.B. indem Du einen Brustpanzer auf das \"Brust\"-Icon in Deinem Inventar ablegst. Wenn Du dies tust, wird die Rüstung auf Deinen Charakter \"abgestimmt\" und Du kannst sie nicht mehr mit anderen Spielern tauschen.
					<br><br> <c \"#F07F00\">Sobald Du die Rüstung ausgerüstet hast, antworte auf Vahlaras Dialog in Deinem Hauptchatfenster, um fortzufahren.</c>");
    }
    if ($text=~/andere/i) {
      if(quest::istaskactivityactive(22,2)) {
        quest::updatetaskactivity(22,2);
      }
      quest::say("Diese wenigen hier. Sie wurden verletzt, als der Aufstand ausbrach. Ich versuche zu helfen, aber wir haben einen knappen Vorrat an [" . quest::saylink("Verbandmaterial") . "], und es kommen immer mehr Verwundete. Ich fürchte, viele werden die Stunde nicht überleben.");
      quest::popup("Rüstung ausrüsten", "Jetzt, da Du die Ärmel ausgerüstet hast, bemerkst Du in Deinem Inventarfenster 
                    dass Deine Rüstungsklasse oder \"AC\" gestiegen ist.  Je höher Deine Rüstungsklasse ist, desto schwieriger wird es für Deine 
                    Feinde, Dich zu treffen.<br><br>Vahlara kann Dir mehr Rüstung machen, wenn Du es schaffst, ihr Stücke von 
                    Gloomingdeep Spider Silk aus den jenseitigen Minen zu holen.<br><br><c \"#F07F00\">Öffne Dein Questfenster [ALT+Q]
                    , um den nächsten Schritt in deiner Grundausbildung zu überprüfen.</c>");
    }
    if ($text=~/Verbandmaterial/i) {
      quest::say("Bevor ich versklavt wurde, war ich eine geschickte Schneiderin und konnte daher Spinnenseide zu notdürftigen Netzen und Verbänden weben. Aber jetzt wird sogar die Spinnlingseide knapp. Wenn Du drei Stücke Spinnlingseide findest, bringe sie mir ungestapelt und ich gebe Dir eine Rüstung, die ich aus Sackleinen hergestellt habe. Sackleinen taugt sowieso nicht für Verbände.");
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54234 => 1) || plugin::check_handin(\%itemcount, 54234 => 3)) { #Gloomingdeep Silk x 1 or 3
    quest::say("Du hast Dich als äußerst einfallsreich erwiesen $name.");
    quest::summonitem(quest::ChooseRandom(54217,54218,54219,54220,54221,54222,54223,54225,54226,54227,54228)); #Random Stitched Burlap item
  }
  elsif (plugin::check_handin(\%itemcount, 86010 => 4) || plugin::check_handin(\%itemcount, 86010 => 3) || plugin::check_handin(\%itemcount, 86010 => 2) || plugin::check_handin(\%itemcount, 86010 => 1)) {
    if (quest::istaskactivityactive(28,1)) {
      quest::say("Ah, ja. Ich danke Dir.");
    }
  }
  plugin::return_items(\%itemcount);
}
