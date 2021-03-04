#zone: tutorialb
#npc: Guard Vyrinn (Beginner Missions)
#quest:
# - Spider Caves - taskid:28 - starts
# - Spider Tamer Gugan - taskid:29 - starts/completes
# - Arachnophobia (Group) - taskid:33 - starts
# items: 54604

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Mein Kumpel, Rahtiz, und ich werden diese Position halten.  Wir brauchen dich, um die Tunnel dahinter zu erforschen.");
      quest::taskselector(28,29,33);
   }
}

sub EVENT_ITEM {
   if (quest::istaskactivityactive(29,1)) {
      if (plugin::check_handin(\%itemcount, 54604 => 1)) {
         #Gloomingdeep Violet
         quest::say("Gut gemacht, mein Freund. Du hast wahrscheinlich viele Leben gerettet.");
         quest::updatetaskactivity(29,1);
         quest::exp(12000);
         quest::ding();
      }
   }
   plugin::return_items(\%itemcount);
} 