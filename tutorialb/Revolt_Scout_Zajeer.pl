#zone: tutorialb
#npc: Revolt Scout Zajeer
# quests:
# - Scouting Gloomingdeep - taskid:32 - starts/completes
# - Sabotage - taskid:31 - Starts
# items: 86011

sub EVENT_SAY {
   if($text=~/Hail/i) {
      if (quest::istaskactivityactive(32,4)) {
         quest::emote("lächelt, als Du zurück kommst. \'Heya, willkommen zurück, Freund'. Du hast dich als würdiger Späher für unsere Revolte erwiesen. Arias meinte sogar, du würdest den Angriff auf die Koboldfestung anführen. Aber das werden wir sehen. Wir werden schon sehen...");
         quest::updatetaskactivity(32,4);
      }
      else {
         quest::say("Schhhh.  Wir sind gerade durch den geheimen Tunnel geschwommen.  Nicht mal die Kobolde wissen es.  Führt sie hierher zurück und wir machen sie fertig.");
        quest::taskselector(31,32);
      }
   }
} 

sub EVENT_TASKACCEPTED {
        if($task_id == 31) {
      quest::summonitem(86011); # Item: Makeshift Lantern Bomb
      # Makeshift Lantern Bomb
   }
} 