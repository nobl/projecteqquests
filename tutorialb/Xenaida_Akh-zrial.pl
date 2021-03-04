# items: 59955, 59765
sub EVENT_SPAWN
{
	quest::settimer("try_sit", 5);
}

sub EVENT_TIMER
{
	if($timer eq "try_sit")
	{
		$npc->SetAppearance(1);
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::stoptimer("try_sit");
}

sub EVENT_SAY {
   if ($text=~/hail/i){
		if(quest::istaskactivityactive(22,3)) {
		quest::say("Grüße $name. Ich brauche einige Pilze, um meinen Heiltrank für die verwundeten Sklaven fertigzustellen. Ich habe den Standort einiger Pilze auf Deiner Karte markiert. Könntest Du mir bitte einen bringen? Ich bin hier im Moment ziemlich beschäftigt.");
		quest::popup("Karten", "<br><br>Du kannst Dein Kartenfenster aufrufen, indem Du die Taste [ <c \"#00c8f0\"> M </c>] drückst.  Du solltest die Gloomingdeep Mushrooms auf Deiner Karte sehen. Du solltest auch Deine aktuelle Position auf der Karte sehen, die durch den Pfeil dargestellt wird (achte darauf, ob er sich bewegt, wenn Du Dich bewegst).
		<br><br>
		<c \"#F07F00\"> Verwende Dein Karte, um den Gloomingdeep-Pilz zu finden. Wähle einen aus, indem Du ihn mit der linken Maustaste anklickst, und liefere ihn an Xenaida, um fortzufahren.</c>", 111);
   		}
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 59955 => 1) && quest::istaskactivityactive(22,3)) {
    quest::say("Danke! Sehr hilfreich!"); 
    quest::summonitem(59765); # Item: Shimmering Vial of Vigor
    quest::updatetaskactivity(22,3);
  }
   elsif (plugin::check_handin(\%itemcount, 59955 => 1)) {
    quest::say("Danke! Sehr hilfreich!"); 
    quest::summonitem(59765); # Item: Shimmering Vial of Vigor
  }
  plugin::return_items(\%itemcount);
}
