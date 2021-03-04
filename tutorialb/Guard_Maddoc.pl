#zone - tutorialb
#quest - Queen Gloomfang
#site3op
# items: 14018, 77780

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Grüße, $name. Wir sind froh, dass Du den Weg zu unserem Camp gefunden hast. Wir können jede Hilfe gebrauchen, die wir bekommen können!");
      quest::taskselector(34, 35);
   }
} 

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 14018 => 1)) {
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::exp(500);
  }
  plugin::return_items(\%itemcount); 
}