sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ich habe ein nettes kleines Loch in der Wand gefunden und konnte daraus einen Banktresor formen. Wenn Du etwas darin sicher verwahren möchtest, lasse es mich einfach wissen. OH und keine Sorge, alle Deine Gegenstände werden zu jeder anderen Bank übertragen, die Du besuchst.");  
  }
}