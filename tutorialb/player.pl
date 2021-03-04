sub EVENT_ENTERZONE 
{

	quest::movepc(189,18, -147, 19.6, 0); # Zone: tutorialb

	if(!defined $qglobals{tutbind} && $ulevel == 1) 
	{
		quest::selfcast(2049);
		quest::setglobal("tutbind",1,1,"D30");
	}
	
	if(!defined $qglobals{tutpop}) 
	{
		quest::popup("Schließ Dich der Revolution an!", "Willkommen bei der Revolte! Du hast zwei neue Quests erhalten:
			<br><br><c \"#FFFF00\">Rally mit Rahtiz:</c><br>Wenn du bereit bist, für die Revolte zu kämpfen, 
			grüße Wächter Rahtiz und finde heraus, wo Du gebraucht wirst.<br><br><c \"#FFFF00\">Grundausbildung:</c><br>Wenn Du mehr über die Feinheiten von Everquest lernen möchtest, sprich mit Arias und er wird dich an andere sachkundige Mitglieder der Sklavenrevolte verweisen.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
			quest::assigntask(22);
			quest::assigntask(23);
			quest::setglobal("tutpop",1,1,"D30");
	}
	
	if($ulevel > 15 && $status < 80)
	{
		$client->Message(15,"Du bist zu hoch im Level, um in dieser Zone zu sein.");
		quest::selfcast(2433);
	}  
}


sub EVENT_POPUPRESPONSE { ## color of "Additional Map Features may  need adjusted at later time, I just browsed greens -Drogerin
	if ($popupid == 111) { 
		quest::popup("Karsten", "<br><br> <c \"#94f000\"> Zusätzliche Kartenmerkmale </c>  
		<br><br> Wenn Du die Sichtbarkeit von Ebenen über oder unter Deiner aktuellen Position ein- oder ausblenden möchtest, kannst Du die Schaltfläche <c \"#00c8f0\"> Height Filter </c> einschalten. Wenn diese Schaltfläche aktiviert ist, werden Orte und Elemente unterhalb eines im Feld \"Low\" angegebenen Abstands nicht gezeichnet. Ebenso wird alles, was über dem Abstand \"High\" liegt, nicht gezeichnet.
		<br><br> Um Beschriftungen auf der Karte ein- oder auszublenden, schalte die Schaltfläche <c \"#00c8f0\"> Labels </c> um.
		<br><br> Wenn Du in einer Gruppe bist und die Mitglieder Deiner Gruppe auf der Karte sehen möchtest, aktiviere die Schaltfläche <c \"#00c8f0\"> Group </c>. Die Gruppenmitglieder erscheinen in der Karte als grünes <c \"#54f000\"> X</c>'s.");
	}
	if ($popupid == 1) {
		quest::popup("Handwerkskunst", "<br> Wenn das Rezept, das Du erstellen möchtest, nicht bereits in Deiner Liste der bekannten Rezepte enthalten ist, kannst Du <c \"#83f07a\"> experimentieren</c>.<br><br>
		Wenn Du das Fenster <c \"#1b6e14\"> Tradeskill </c> geöffnet hast, klicke auf die Schaltfläche <c \"#00c8f0\"> Experiment</c>. Dies öffnet ein neues Fenster mit dem Namen des Handwerks-Containers
		in dem Du experimentierst - in diesem Fall Ofen.<br><br> Anschließend kannst Du Deine Zutaten in die Slots des Fensters <c \"#1b6e14\">Ofen </c> platzieren. Für Rattensteaks benötigst Du dazu das Rattenfleisch
		und die Kochsauce.<br><br> Wenn die Zutaten im Ofen sind, klicke auf die Schaltfläche <c \"#00c8f0\"> Combine </c>. Die Zutaten werden verbraucht, und Du erhälst ein gekochtes Rattensteak.
		<br><br><c \"#F07F00\"> Klicke auf 'OK', um mehr über Rezepte und Fähigkeitsstufen zu erfahren.",2);
	}
	if ($popupid == 2) {
		quest::popup("Handwerkskunst", "<br> Einige Handwerksrezepte sind komplizierter als andere und erfordern eine höhere Stufe in dem Handwerk, das Du ausüben möchtest.
		<br><br> Wenn Deine Stufe nicht hoch genug ist, um ein bestimmtes Rezept zu versuchen, wirst Du wahrscheinlich bei der Kombination scheitern. Wenn dies geschieht, verlierst Du oft einige oder alle Zutaten, die Du für die Kombination verwendet hast.
		<br><br><c \"#F07F00\"> Klicke auf 'OK', um mehr über die verschiedenen Arten von Handwerksfertigkeiten zu erfahren.",3);
	}
	if ($popupid == 3) {
		quest::popup("Handwerkskunst", "<br> Es gibt viele verschiedene Arten von Handwerksberufen, die Du ausüben kannst, einschließlich Backen, Töpfern, Pfeil und Bogen Bau, Schmieden und Schneidern. Du kannst alle möglichen Gegenstände mit diesen Fertigkeiten herstellen.
		<br><br> Um die verschiedenen Arten von Handwerksberufen auszuüben, musst Du die richtigen Behälter für die Handwerksberufe verwenden. Für das Backen benötigen Sie zum Beispiel einen Ofen.
		Schmieden erfordert eine Schmiede. Töpfern erfordert einen Brennofen. Halte Ausschau nach verschiedenen Arten von Handwerksfertigkeitsbehältern, die sich in den Städten in Norrath befinden.");
	}
	if ($popupid == 6) {
		quest::popup("Hotbars verwalten", "<br> Es gibt mehrere Möglichkeiten, Deine <c \"#83f07a\"> Hotbars anzupassen und zu verwalten:</c><br><br>
		<c \"#1b6e14\">Umschalten</c><br>Du wechselst, auf welcher Seite der Hotbar Du Dich befindest, indem Du die Auf- und Ab-Pfeile auf der rechten Seite der Leiste verwendest.<br><br><c \"#1b6e14\">Neue Hotbars</c><br>
		Du kannst neue Hotbars hinzufügen, indem Du die Taste <c \"#83f07a\"> EQ Menu</c> verwenden, <c \"#83f07a\"> Actions,</c> auswählst und dann die Option <c \"#83f07a\"> Hotkeys </c> 1-10.<br><br>
		<c \"#F07F00\"> Klicke auf 'OK', um die Verwaltung Deiner Hotbars zu lernen.</c>",7);
	}
	if ($popupid == 7) {
		quest::popup("Hotkeys zuweisen", "<br><c \"#83f07a\">Hotkeys</c> sind Fähigkeiten, Aktionen und Makros, die mit einem einfachen Klick aktiviert werden können. Es gibt mehrere Möglichkeiten zur Anpassung Deiner 
		<c \"#83f07a\">Hotbar</c> mittels dieser Schaltflächen:<br><br><c \"#1b6e14\">Drag und Drop</c><br>Du kannst <c \"#83f07a\"> Hotkeys</c> verschieben, indem Du die linke Maustaste einen Moment lang gedrückt hälst und dann
		das Symbol auf die<c \"#83f07a\"> Hotbar ziehst.</c> Dies ist besonders nützlich für das Ziehen aus Deinen Menüs <c \"#83f07a\">Aktion,</c><c \"#83f07a\">Alternative Weiterentwicklung,</c> und <c \"#83f07a\">Zaubersprüche</c>.
		<br><br><c \"#1b6e14\">Rechts-Klick</c><br>Du kannst mit der rechten Maustaste auf einen leeren<c \"#83f07a\"> Hotbar</c>-Slot klicken und über <c \"#83f07a\">Assigning Social</c> benutzerdefinierte Aktionen zuweisen. Mehr über diese werden wird im nächsten Abschnitt vorgestellt.<br><br><c \"#F07F00\"> Klicke auf 'OK', um mehr über benutzerdefinierte Funktionen für Deine Hotbars zu erfahren.</c>",8);
	}
	if ($popupid == 8) {
		quest::popup("Benutzerdefinierte Hotkeys", "<br>Das Ziehen vorhandener Fähigkeiten und Zuweisen von Standardaktionen ist nur der erste Schritt. Du kannst auch Deine eigenen <c \"#83f07a\">Hotkeys</c> erstellen! Du kannst
		Dein <c \"#83f07a\">Action</c> Menü nutzen, um auf die <c \"#83f07a\">Social-Seite</c> zuzugreifen.<br><br><c \"#F07F00\"> Klicke auf 'OK', um mehr über die Personalisierung Deiner Hotbars zu erfahren.</c>",9);
	}
	if ($popupid == 9) {
		quest::popup("Personalisierung der Hotbar", "<br>Du kannst Deine <c \"#83f07a\">Hotkeys</c> personalisieren, indem Du das erweiterte Rechtsklickmenü verwendest. Halte die rechte Maustaste über einem
		bestehenden <c \"#83f07a\">Hotkey</c> gedrückt, um die Optionen zu sehen:<br><br><c \"#1b6e14\">Activate</c><br>Dadurch wird die Taste so verwendet, als ob Du mit der linken Maustaste darauf geklickt hättest.<br><br><c \"#1b6e14\">Clear</c><br>Dadurch wird die Taste entfernt.
		<br><br><c \"#1b6e14\">Assign Icon</c><br>Wähle ein gewünschtes Symbol aus der gesamten Bibliothek der Symbole aus.<br><br><c \"#1b6e14\">Clear Icon</c><br>Dadurch wird das benutzerdefinierte Symbol entfernt.<br><br><c \"#1b6e14\">Assign Label</c><br>
		Dadurch wird der Text auf der Taste geändert.<br><br><c \"#1b6e14\">Assign Social</c><br>Damit kannst Du eine benutzerdefinierte Fähigkeit, von der <c \"#83f07a\">Socials Seite</c> direkt auf die <c \"#83f07a\">Hotbar</c> ziehen.<br><br>
		<c \"#1b6e14\">Change Size</c><br>Damit kannst Du die Größe und Skalierung der gesamten<c \"#83f07a\"> Hotbar verändern.</c><br><br><c \"#1b6e14\">Unmemorize</c><br>Damit kannst Du einen gespeicherten Zauberspruch vergessen. Funktioniert nur auf Zauber-<c \"#83f07a\">Hotkeys.</c><br><br><c \"#F07F00\"> Klicke auf 'OK', um die Anleitung für Hotbars abzuschließen.</c>");
		quest::updatetaskactivity(290,1);
	}
	if ($popupid == 10) {
		quest::popup("Schwimmen", "<br>Wenn Du unter Wasser bist, wird Deine verbleibende Luft im Fenster <c \"#1b6e14\">Air Remaining</c> angezeigt. Wenn Dein Luftvorrat zur Neige geht, beginnst Du, Schaden zu nehmen.<br><br>
		Mit zunehmender Schwimmfertigkeit steigt auch Dein Luftvorrat und Deine Schwimmgeschwindigkeit. Je mehr Zeit Du im Wasser verbringst, desto besser wirst Du als Schwimmer!");
	}
}	


sub EVENT_TASK_STAGE_COMPLETE 
{
	if ($task_id == 34)
	{
		quest::ze(15, "Ein Jubelschrei ertönt von den Sklaven, als der letzte der Koboldaufseher fällt.");
	}
  if ($task_id == 28 && $activity_id == 1) {
    $client->Message(0,"Vahlara verbeugt sich, als du zurückkommst. 'Gerade noch rechtzeitig. Viele sind verwundet und stündlich kommen mehr dazu. Wenn Ihr Gloomingdeep-Seide findet, bringt sie mir, und ich kann Euch mit mehr Sackleinen-Kleidung belohnen. Es ist nicht viel, aber schöner als die Lumpen, mit denen uns diese Kobolde zurückgelassen haben.'");
  }
} 

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	if($d_id == 11)
	{
		my $s_zone = $client->GetStartZone();
		if($s_zone == 9)
		{
			quest::movepc(9,-60.9,-61.5,-24.9); # Zone: freportw
		}
		elsif($s_zone == 19)
		{
			quest::movepc(19,-98.4,11.5,3.1); # Zone: rivervale
		}
		elsif($s_zone == 24)
		{
			quest::movepc(24,-309.8,109.6,23.1); # Zone: erudnext
		}
		elsif($s_zone == 25)
		{
			quest::movepc(25,-965.3,2434.5,5.6); # Zone: nektulos
		}
		elsif($s_zone == 29)
		{
			quest::movepc(29,12.2,-32.9,3.1); # Zone: halas
		}
                elsif($s_zone == 40)
		{
			quest::movepc(40,156.9,-2.9,31.1); # Zone: neriaka
		}
                elsif($s_zone == 41)
		{
			quest::movepc(41,-499,2.9,-10.9); # Zone: neriakb
		}
                elsif($s_zone == 42)
		{
			quest::movepc(42,-968.9,891.9,-52.8); # Zone: neriakc
		}
		elsif($s_zone == 45)
		{
			quest::movepc(45,-343,189,-38.22); # Zone: qcat
		}
		elsif($s_zone == 49)
		{
			quest::movepc(49,520.1,235.4,59.1); # Zone: oggok
		}
		elsif($s_zone == 50)
		{
			quest::movepc(50,560,-2234,3); # Zone: rathemtn
		}
		elsif($s_zone == 52)
		{
			quest::movepc(52,1.1,14.5,3.1); # Zone: grobb
		}
		elsif($s_zone == 54)
		{
			quest::movepc(54,-197,27,-0.7); # Zone: gfaydark
		}
		elsif($s_zone == 55)
		{
			quest::movepc(55,7.6,489.0,-24.9); # Zone: akanon
		}
		elsif($s_zone == 61)
		{
			quest::movepc(61,26.3,14.9,3.1); # Zone: felwithea
		}
		elsif($s_zone == 68)
		{
			quest::movepc(68,-214.5,2940.1,0.1); # Zone: butcher
		}
		elsif($s_zone == 75)
		{
			quest::movepc(75,200,800,3.39); # Zone: paineel
		}
		elsif($s_zone == 106)
		{
			quest::movepc(106,-415.7,1276.6,3.1); # Zone: cabeast
		}
		elsif($s_zone == 155)
		{
			quest::movepc(155,105.6,-850.8,-190.4); # Zone: sharvahl
		}
		else
		{
			quest::movepc(202,-55,44,-158.81); # Zone: poknowledge
		}
	}
}
