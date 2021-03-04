# Emotes
# Zone: Tutorialb

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::delglobal("amote");
	quest::setglobal("amote",3,3,"F");
	$amote=undef;
}

sub EVENT_ENTER
{
	quest::emote("Vor Dir erstreckt sich eine riesige Mine, aus deren Tiefen Du das Klappern von Flaschenzügen und Karren hörst. Es scheint, als wäre sie bewohnt . . .");
	quest::depop();
	quest::delglobal("amote");
	quest::setglobal("amote",2,3,"F");
	$amote=undef;
}