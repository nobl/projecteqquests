#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Solange noch Blut in meinen Adern fließt, soll kein Kobold diese Brücke überqueren.");
  }
}