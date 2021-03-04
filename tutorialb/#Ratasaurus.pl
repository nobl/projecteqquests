# NPC: Tutorial rats
# Angelox

sub EVENT_COMBAT{
    quest::emote("rennt voran, um anzugreifen.");
}

sub EVENT_DEATH_COMPLETE{
  quest::emote("s Leichnam bewegt sich nicht mehr");
 }

# EOF zone: Tutorialb