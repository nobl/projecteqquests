#zone: tutorialb
# items: 9997, 59950, 9998, 59951, 9999, 59952, 55623, 59953, 54229, 54230, 54231, 54232, 54233, 59954, 54235, 54236, 54237, 54238

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hallo $name. Vor der Sklavenrevolte habe ich Hacken und Schaufeln geschmiedet. Jetzt stelle ich Waffen her, damit wir zurückschlagen können. Hauptsächlich Schwerter und Speere. Einfaches Zeug. Wenn du mir deine Waffe gibst, kann ich dir eine bessere machen!");
    quest::updatetaskactivity(22, 1);
    quest::popup("Waffen", "Absor stellt Waffen her. Du solltest bereits eine Waffe von Deiner Flucht mit Arias ausgerüstet haben, doch Absor kann sie aufwerten. Öffnn Dein Inventar und entferne Deine Waffe aus dem unteren linken Slot. Dies ist Dein primärer Waffenslot, in dem Du Waffen ablegst, die Du gerade benutzt.<br><br><c \"#F07F00\">Gib Absor Deine Waffe, um fortzufahren.</c>");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9997 => 1)) { #Dagger*
    quest::summonitem(59950); #Sharpened Dagger
    quest::emote(" nimmt Dir die Waffe ab und beginnt, sie zu polieren und zu wuchten. Als er sie Dir zurückgibt, hat sie kaum noch Ähnlichkeit mit dem verrotteten alten Ding, das Du vorher benutzt hast.");
    quest::say("Bitteschön. Das sollte viel besser funktionieren.");
    quest::popup("Waffen", "Absor hat Deine Waffe repariert und wieder in Dein Inventar gelegt. Nimm die verbesserte Waffe aus Deinem Inventar auf und lege sie auf das rechteckige Symbol in der Mitte Deines Inventarfensters. Dadurch wird die Waffe automatisch wieder in Deinem primären Slot ausgerüstet.<br><br><c \"#FFFF00\">Öffne Dein Quest-Fenster [ALT+Q], um den nächsten Schritt Deiner Grundausbildung zu überprüfen.</c><br><br><c \"#F07F00\">Tipp: Benutze den Find-Befehl (STRG+F), um den nächsten NPC für Deine Grundausbildung zu finden.</c>");
  }
  elsif (plugin::check_handin(\%itemcount, 9998 => 1)) { #Short Sword*
    quest::summonitem(59951); #Sharpened Short Sword
    quest::emote(" nimmt Dir die Waffe ab und beginnt, sie zu polieren und zu wuchten. Als er sie Dir zurückgibt, hat sie kaum noch Ähnlichkeit mit dem verrotteten alten Ding, das Du vorher benutzt hast.");
    quest::say("Bitteschön. Das sollte viel besser funktionieren.");
    quest::popup("Waffen", "Absor hat Deine Waffe repariert und wieder in Dein Inventar gelegt. Nimm die verbesserte Waffe aus Deinem Inventar auf und lege sie auf das rechteckige Symbol in der Mitte Deines Inventarfensters. Dadurch wird die Waffe automatisch wieder in Deinem primären Slot ausgerüstet.<br><br><c \"#FFFF00\">Öffne Dein Quest-Fenster [ALT+Q], um den nächsten Schritt Deiner Grundausbildung zu überprüfen.</c><br><br><c \"#F07F00\">Tipp: Benutze den Find-Befehl (STRG+F), um den nächsten NPC für Deine Grundausbildung zu finden.</c>");
  }
  elsif (plugin::check_handin(\%itemcount, 9999 => 1)) { #Club*
    quest::summonitem(59952); #Polished Club
    quest::emote(" nimmt Dir die Waffe ab und beginnt, sie zu polieren und zu wuchten. Als er sie Dir zurückgibt, hat sie kaum noch Ähnlichkeit mit dem verrotteten alten Ding, das Du vorher benutzt hast.");
    quest::say("Bitteschön. Das sollte viel besser funktionieren.");
    quest::popup("Waffen", "Absor hat Deine Waffe repariert und wieder in Dein Inventar gelegt. Nimm die verbesserte Waffe aus Deinem Inventar auf und lege sie auf das rechteckige Symbol in der Mitte Deines Inventarfensters. Dadurch wird die Waffe automatisch wieder in Deinem primären Slot ausgerüstet.<br><br><c \"#FFFF00\">Öffne Dein Quest-Fenster [ALT+Q], um den nächsten Schritt Deiner Grundausbildung zu überprüfen.</c><br><br><c \"#F07F00\">Tipp: Benutze den Find-Befehl (STRG+F), um den nächsten NPC für Deine Grundausbildung zu finden.</c>");
  }
  elsif (plugin::check_handin(\%itemcount, 55623 => 1)) { #Dull Axe*
    quest::summonitem(59953); #Sharpened Axe
    quest::emote(" nimmt Dir die Waffe ab und beginnt, sie zu polieren und zu wuchten. Als er sie Dir zurückgibt, hat sie kaum noch Ähnlichkeit mit dem verrotteten alten Ding, das Du vorher benutzt hast.");
    quest::say("Bitteschön. Das sollte viel besser funktionieren.");
    quest::popup("Waffen", "Absor hat Deine Waffe repariert und wieder in Dein Inventar gelegt. Nimm die verbesserte Waffe aus Deinem Inventar auf und lege sie auf das rechteckige Symbol in der Mitte Deines Inventarfensters. Dadurch wird die Waffe automatisch wieder in Deinem primären Slot ausgerüstet.<br><br><c \"#FFFF00\">Öffne Dein Quest-Fenster [ALT+Q], um den nächsten Schritt Deiner Grundausbildung zu überprüfen.</c><br><br><c \"#F07F00\">Tipp: Benutze den Find-Befehl (STRG+F), um den nächsten NPC für Deine Grundausbildung zu finden.</c>");
  }
  elsif (plugin::check_handin(\%itemcount, 54229 => 1)) {
    #Chunk of Bronze -> Bronze Gloomingdeep weapons
    quest::say("Jetzt lass mich mal sehen... Ah ha! Da haben wir's ja! Eine viel bessere Waffe, um diese Bösewichte abzuwehren!");
    if($class eq 'Warrior'){quest::summonitem(quest::ChooseRandom(54230,54231,54232));}
    elsif($class eq 'Cleric'){quest::summonitem(54232);}
    elsif($class eq 'Paladin'){quest::summonitem(quest::ChooseRandom(54231,54232));}
    elsif($class eq 'Ranger'){quest::summonitem(quest::ChooseRandom(54230,54231,54232));}
    elsif($class eq 'Shadowknight'){quest::summonitem(quest::ChooseRandom(54230,54231,54232));}
    elsif($class eq 'Druid'){quest::summonitem(54232);}
    elsif($class eq 'Monk'){quest::summonitem(54232);}
    elsif($class eq 'Bard'){quest::summonitem(quest::ChooseRandom(54230,54231,54232));}
    elsif($class eq 'Rogue'){quest::summonitem(quest::ChooseRandom(54230,54231,54232));}
    elsif($class eq 'Shaman'){quest::summonitem(54232);}
    elsif($class eq 'Necromancer'){quest::summonitem(54230);}
    elsif($class eq 'Wizard'){quest::summonitem(54230);}
    elsif($class eq 'Magician'){quest::summonitem(54230);}
    elsif($class eq 'Enchanter'){quest::summonitem(54230);}
    elsif($class eq 'Beastlord'){quest::summonitem(quest::ChooseRandom(54230,54232));}
    elsif($class eq 'Berserker'){quest::summonitem(54233);}
  }
  elsif (plugin::check_handin(\%itemcount, 59954 => 1)) {
    #Chunk of Iron -> Iron Gloomingdeep weapons
    quest::say("Jetzt lass mich mal sehen... Ah ha! Da haben wir's ja! Eine schicke, neue Waffe, die Dir bei deinen Abenteuern hilft!");
    if($class eq 'Warrior'){quest::summonitem(quest::ChooseRandom(54235,54236,54237));}
    elsif($class eq 'Cleric'){quest::summonitem(54237);}
    elsif($class eq 'Paladin'){quest::summonitem(quest::ChooseRandom(54236,54237));}
    elsif($class eq 'Ranger'){quest::summonitem(quest::ChooseRandom(54235,54236,54237));}
    elsif($class eq 'Shadowknight'){quest::summonitem(quest::ChooseRandom(54235,54236,54237));}
    elsif($class eq 'Druid'){quest::summonitem(54237);}
    elsif($class eq 'Monk'){quest::summonitem(54237);}
    elsif($class eq 'Bard'){quest::summonitem(quest::ChooseRandom(54235,54236,54237));}
    elsif($class eq 'Rogue'){quest::summonitem(quest::ChooseRandom(54235,54236,54237));}
    elsif($class eq 'Shaman'){quest::summonitem(54237);}
    elsif($class eq 'Necromancer'){quest::summonitem(54235);}
    elsif($class eq 'Wizard'){quest::summonitem(54235);}
    elsif($class eq 'Magician'){quest::summonitem(54235);}
    elsif($class eq 'Enchanter'){quest::summonitem(54235);}
    elsif($class eq 'Beastlord'){quest::summonitem(quest::ChooseRandom(54235,54237));}
    elsif($class eq 'Berserker'){quest::summonitem(54238);}
  }
  plugin::return_items(\%itemcount);
}