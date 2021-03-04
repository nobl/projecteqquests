#zone: tutorialb

sub EVENT_SAY {
  if ($text=~/hail/i && quest::istaskactivityactive(22,0)){
    quest::say("Wir haben die anderen Sklaven gefunden! Nicht schlecht, mein Freund, nicht schlecht. Was auch immer in den Minen passiert, du solltest immer in der Lage sein, Deinen Weg hierhin zurück zu finden.");
    quest::popup("Das FINDEN Kommando:", "Es ist eine große Welt da draußen. Es hilft, wenn man weiß, wo man hin will.
	    <br><br><c \"#FFFF00\">Das FINDEN Kommando:</c><br>Mit dem Finden Kommando kannst Du andere 
		wichtige Charaktere der Rebellion finden. <br><br><c \"#F07F00\">Um das FINDEN menü zu öffnen, drücke [CTRL+F] oder nutze den Find Button 
		auf deiner Hotbutton Leiste.  Klicke dann auf Absors Namen unter 'Weapons'.  Ein leuchtender Pfad wird erscheinen 
		und Dir den Weg zu diesem NPC zeigen.</c>");    	
	quest::updatetaskactivity(22,0); 
}
  elsif ($text=~/hail/i && quest::istaskactivityactive(22,7)){
    quest::say("Hervorragend, mein Freund. Bitte nimm dieses Koboldschädelamulett. Du bist nun bereit, Dich den Sklaven in ihrem Kampf gegen die Kobolde von Gloomingdeep anzuschließen. Sprich mich Guard Rahtiz, um Dine nächste Aufgabe zu erhalten.");
    quest::updatetaskactivity(22,7); 
}
  elsif ($text=~/hail/i){
    quest::say("Wir haben die anderen Sklaven gefunden! Nicht schlecht, mein Freund, nicht schlecht. Was auch immer in den Minen passiert, du solltest immer in der Lage sein, Deinen Weg hierhin zurück zu finden.");
}
  if ($text=~/leave/i || $text=~/escape/i) {
    quest::say("Ich zeige Dir, wie Du die Minen verlassen kannst. Du bist jederzeit willkommen, uns wieder beizustehen!");
    quest::movepc(202,-55,44,-158.81); # Zone: poknowledge
 }
}
