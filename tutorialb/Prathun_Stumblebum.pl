#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i && quest::istaskactivityactive(22,5)) {
    quest::say("Es gibt viele Mitglieder der Revolte, die Dich im Kampf gegen die Kobolde unterstützen können.  Ein neuer Soldat wie Du wird nicht lange ohne Freunde überleben!");
    quest::say("Der Trick, um mit anderen Abenteurern zu sprechen, besteht darin, die richtigen Wege zu gehen.  Niemand mag einen Hitzkopf, der um Münzen bettelt, indem er jeden in Hörweite anbrüllt. . .   Aber wenn Du nett fragst, kannst Du andere dazu bringen, sich Dir bei Deinen Abenteuern anzuschließen.");
    quest::say("Die Gefahren des Kampfes und des Abenteurerlebens können manchmal das Schlimmste in den Menschen hervorbringen.  Es ist wichtig, einen kühlen Kopf zu bewahren und nur zu schreien, wenn es absolut notwendig ist.");
    quest::say("Viel Glück da draußen, mein Freund.  Ich bin sicher, Du wirst es gut machen!");
    quest::say("Mit dem Befehl /shout kannst Du in einem großen Radius schreien. Der Befehl /ooc ermöglicht es Dir, in der ganzen Welt außerhalb des Charakters zu sprechen.  Der Befehl /tell ermöglicht es Dir, nur mit einer Person zu sprechen, ohne dass es jemand anderes hört. Mit dem Befehl /say kannst Du mit anderen in Ihrer unmittelbaren Umgebung sprechen.");
    quest::updatetaskactivity(22,5);
   }
  elsif ($text=~/hail/i) {
    quest::say("Es gibt viele Mitglieder der Revolte, die Dich im Kampf gegen die Kobolde unterstützen können.  Ein neuer Soldat wie Du wird nicht lange ohne Freunde überleben!");
    quest::say("Der Trick, um mit anderen Abenteurern zu sprechen, besteht darin, die richtigen Wege zu gehen.  Niemand mag einen Hitzkopf, der um Münzen bettelt, indem er jeden in Hörweite anbrüllt. . .   Aber wenn Du nett fragst, kannst Du andere dazu bringen, sich Dir bei Deinen Abenteuern anzuschließen.");
    quest::say("Die Gefahren des Kampfes und des Abenteurerlebens können manchmal das Schlimmste in den Menschen hervorbringen.  Es ist wichtig, einen kühlen Kopf zu bewahren und nur zu schreien, wenn es absolut notwendig ist.");
    quest::say("Viel Glück da draußen, mein Freund.  Ich bin sicher, Du wirst es gut machen!");
    quest::say("Mit dem Befehl /shout kannst Du in einem großen Radius schreien. Der Befehl /ooc ermöglicht es Dir, in der ganzen Welt außerhalb des Charakters zu sprechen.  Der Befehl /tell ermöglicht es Dir, nur mit einer Person zu sprechen, ohne dass es jemand anderes hört. Mit dem Befehl /say kannst Du mit anderen in Ihrer unmittelbaren Umgebung sprechen.");
   }
}