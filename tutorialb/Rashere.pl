#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Wusstest Du, dass Deine Seele, wenn Du stirbst, an Ihren letzten Bindungspunkt zurückgerufen werden kann? Nun, das kann sie und genau das ist meine Aufgabe auf dieser Welt. Ich kann Deine Seele an diesen Ort zu [" . quest::saylink("binden") . "], dass Du nach dem Tod an dieser Stelle wieder zum Leben erweckt wirst.");
  }
  if ($text=~/binden/i) {
    quest::selfcast(35);
  }
  if ($text=~/Geschwister/i) {
    quest::say("Sklavenmeister Ruga hat den Rest der Dracheneier bei sich. Er ist im Gloomingdeep-Gefängnis und versucht, den Rest der Sklaven an der Flucht zu hindern. Sei aber vorsichtig mit Ruga. Dieser Kobold hat immer seine Leibwächter in der Nähe!");
    quest::assigntask(36); #Task: Flutterwing's Dilemma
  }
}

sub EVENT_SIGNAL {
  quest::emote("blickt hinüber, als Du beginnst, mit dem Babydrachen zu sprechen.");
  quest::say("Hallo, $name. Das ist Flutterwing, mit dem du da redest. Niedlich, nicht wahr? Wir haben den kleinen Kerl gerade vor den Kobolden gerettet. Es stellte sich heraus, dass sie ein ganzes Gelege von Dracheneiern gefangen haben, in der Hoffnung, die Kreaturen als Kriegstiere aufzuziehen. Wenn Du Flutterwings ungeschlüpfte [" . quest::saylink("Geschwister") . "] bergen könntest, wäre er Dir sehr dankbar. Außerdem liebt der kleine Kerl Muffins, also wenn Du welche hast, verfüttere Sie an ihn. Pass nur auf Deine Finger auf.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}