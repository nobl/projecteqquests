#BeginFile Poxan_.pl
#Quests for The Mines of Gloomingdeep - Poxan
# items: 59968 (quest item), 59969 (reward)
sub EVENT_SAY {
  if ($text=~/hail/i && quest::istaskactivityactive(22,6)) {
	quest::emote(" seufzt schwer, als er in das trübe Wasser blickt. Das ist ja schrecklich, ich habe mein Schwert ins Wasser fallen lassen und kann nicht schwimmen! Ich nehme nicht an, dass Du es für mich zurückholen könntest, $name? Ohne ein Schwert kann ich nicht gut gegen Kobolde kämpfen.'");
	quest::popup("Schwimmen","<br>Beim Schwimmen kannst Du die Tasten<c \"#00c8f0\">Bild Hoch</c> oder <c \"#00c8f0\">Bild Runter</c> verwenden, um Deinen Charakter nach oben oder unten zu richten. Du kannst dann mit den <c \"#00c8f0\">Pfeiltasten</c> normal schwimmen.<br><br><c \"#F07F00\">Springe ins Wasser und schnappe Dir Poxans Schwert unter der Brücke. Klicke dann auf \"OK\", um fortzufahren.</c>");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 59968 => 1)) { #Poxan's sword 59968
    quest::say("Ausgezeichnet! Jetzt kann ich an der Seite des Aufstandes gegen die Kobolde kämpfen. Hier nimm das. Ich habe es vorhin in den Tunneln gefunden. Du könntest es brauchen.");
    quest::summonitem(59969); #Kobold Leather Mask.
	quest::updatetaskactivity(22,6);
  }
  plugin::return_items(\%itemcount);
}
