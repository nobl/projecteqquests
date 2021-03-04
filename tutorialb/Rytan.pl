#zone: tutorialb
#ToDo:
# Force succession of popup windows
# Flash spellbar
# items: 59973, 17708, 59971, 59972, 59963, 59962, 59965, 59966, 59959, 59961, 59960, 59964

sub EVENT_SAY {
  if ($text=~/hail/i)  {
    if (quest::istaskactivityactive(22, 4)) {
      quest::say("Hallo $name. Ich bin selbst kein großer Kämpfer, aber ich kann die Macht der Gunst meines Gottes verleihen. Möchtest Du [" . quest::saylink("gesegnet") . "] werden?");
    }
    else {
      quest::say("Hallo $name. Ich bin selbst kein großer Kämpfer, aber ich kann die Macht der Gunst meines Gottes verleihen. Möchtest Du [" . quest::saylink("gesegnet") . "] werden, oder möchtest Du vielleicht meine vorangegangene Lektion [" . quest::saylink("wiederholen") . "]?");
    }
    quest::popup("Buffs", "Rytan bietet Dir einen nützlichen Zauber (kurz 'Buff') an. Alle Zauber, die Dich gerade beeinflussen, erscheinen entweder im <c \"#00FF00\">Effekte-Fenster</c> oder im <c \"#00FF00\">Gesänge-Fenster</c>.<br><br>Zauber, die im <c \"#00FF00\">Gesänge-Fenster</c> erscheinen, sind in der Regel Zauber von kurzer Dauer, die immer verschwinden, wenn Du stirbst oder eine Zone verlässt. <br><br>Um die Eigenschaften eines Zaubers zu überprüfen, der auf Dich wirkt, bewegen Deine Maus über das Zaubersymbol und halte die <c \"#00FFFF\">rechte Maustaste</c><br><br><br><c \"#F07F00\">Reagiere auf Rytans Dialog in Deinem Haupt-Chatfenster, um fortzufahren.</c>");   
  }
  elsif ($text=~/gesegnet/i) {
    $npc->CastSpell(5150, $userid); #Gloomingdeep Guard
    if (quest::istaskactivityactive(22, 4)) {
      quest::updatetaskactivity(22, 4);
      if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
        quest::say("Bitte sehr, $name. Es sieht so aus, als würdest du dich eher auf deine Nahkampffähigkeiten als auf Zaubersprüche verlassen, um erfolgreich zu sein. Ich bin selbst kein guter Kämpfer, aber ich habe diesen Folianten für dich. Er könnte sich im Kampf gegen die Kobolde als nützlich erweisen. Mit zunehmender Erfahrung wirst du weitere Bände finden, aus denen du lernen kannst. Einige können bei Händlern gekauft werden, einige können von Spielern mit Handwerksfähigkeiten hergestellt werden und einige müssen durch Quests erlangt werden. Viel Glück da draußen!");
        quest::summonitem(59973); #Tome of Throw Stone - Now item 17708 on Live
        quest::popup("Niederschreiben und Auswendiglernen", "Rytan hat dir einen Fertigkeitsband gegeben!<br><br>Um eine Kampffähigkeit zu benutzen, musst du sie zuerst <c \"#00FF00\">erlernen</c>, dann musst du <c \"#00FF00\">einen Hotkey</c> erstellen, um sie auszulösen.<br><br>Um diese Kampffähigkeit zu erlernen, suche sie einfach in deinem Inventar und <c \"#00FFFF\">rechtsklicke</c> auf den Folianten.<br><br>Sobald Du die Fähigkeit gespeichert hast, öffne Dein <c \"#00FF00\">Kampffähigkeiten-Fenster</c>, indem Du <c \"#00FFFF\">[Alt+C]</c> drückst. Du kannst dann <c \"#00FFFF\">mit der linken Maustaste</c> auf die dünne <c \"#00FFFF\">S</c>-Taste klicken, um eine vollständige Liste aller Deiner bekannten Kampffähigkeiten zu sehen. Wähle die Kampffähigkeit in diesem Fenster aus und klicke dann <c \"#00FFFF\">mit der linken Maustaste</c> auf die Schaltfläche <c \"#00FFFF\">Make Hotkey</c> am unteren Rand des Fensters. Dadurch erhälst Du einen Hotkey, den Du in einem der 8 Slots in Deinem <c \"#00FF00\">Kampffähigkeitsfenster</c> oder direkt auf einer <c \"#00FF00\">Hotbar</c> platzieren kannst.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
        REVIEW();
      }
      elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
        quest::say("Du scheinst selbst ein bisschen ein Zauberer zu sein. Du wirst feststellen, dass Zaubersprüche und Lieder deine Macht stark verbessern können. Da du eine Art Hybrid bist, wirst du Zugang zu Magie und später auch zu Fertigkeitsbüchern haben. Nimm vorerst diese Schriftrolle. Sie könnte sich im Kampf gegen die Kobolde als nützlich erweisen. Wenn Du Geld verdienst und Erfahrung sammelst, wirst Du weitere mächtige Zaubersprüche finden. Einige Zaubersprüche können bei Händlern gekauft werden, einige können von Spielern mit Handwerksfähigkeiten hergestellt werden, und einige müssen durch Quests erlangt werden. Viel Glück da draußen!");
        if ($class eq "Paladin" || $class eq "Beastlord" || $class eq "Ranger") {
          quest::summonitem(59971); # Item: Spell: Salve
        }
        elsif ($class eq "Shadowknight") {
          quest::summonitem(59972); # Item: Spell: Spike of Disease
        }
        elsif ($class eq "Bard") {
          quest::summonitem(59963); #Song: Chords of Dissonance
        }
        quest::popup("Niederschreiben und Auswendiglernen", "Rytan hat dir eine Zauberschriftrolle gegeben!<br><br>Um einen Zauber zu benutzen, musst du zuerst <c \"#00FF00\">einen Zauber in dein Zauberbuch schreiben</c> und dann <c \"#00FF00\">den Zauber in deiner <c \"#00FF00\">Zauberleiste</c> speichern</c>. Es gibt nur eine begrenzte Anzahl von Plätzen in Ihrer Zauberleiste, daher ist die Auswahl der gespeicherten Zauber eine wichtige Strategie, sobald Du mehr Zauber kennst.<br><br>Um diesen Zauber zu schreiben, öffne zuerst Dein <c \"#00FF00\">Zauberbuch</c>, indem Du <c \"#00FFFF\">[Strg+B]</c> verwendest und die Zauberrolle auf ein leeres Zauberfeld auf einer Seite bewegst und mit der linken Maustaste klickst. Dadurch wird das Schreiben des Zaubers gestartet. Dieser Vorgang nimmt ein wenig Zeit in Anspruch. Ein dünner lila Fortschrittsbalken erscheint am unteren Rand des Zauberbuchfensters, während Du schreibst.<br><br>Wenn der Zauber fertig geschrieben ist, erscheinen das Symbol und der Name des Zaubers in Deinem Zauberbuch. <c \"#00FFFF\">Klicke mit der linken Maustaste</c> auf dieses neu hinzugefügte Symbol in Deinem Zauberbuch, um das Symbol mit Deinem Cursor zu verbinden. Dann <c \"#00FFFF\">Linksklick</c> auf einen leeren Zauberplatz in Deiner <c \"#00FF00\">Zauberleiste</c>. Das Ziehen des Zaubers bewirkt nichts; klicke einfach <c \"#00FFFF\">mit der linken Maustaste</c> einmal in Dein Zauberbuch und einmal auf Deine <c \"#00FF00\">Zauberleiste</c>. Die <c \"#00FF00\">Zauberleiste</c> beginnt kurz zu blinken, sobald Du diese Meldung schließt.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
        REVIEW();
      }
      elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Wizard") { #Caster
        quest::say("Du scheinst selbst ein bisschen ein Zauberer zu sein. Du wirst feststellen, dass Zaubersprüche und Lieder deine Macht erheblich verstärken können. Nimm das und schreibe es in dein Zauberbuch. Ich kann nur hoffen, dass es dir gegen die Koboldhorde hilft. Wenn du Geld verdienst und Erfahrung sammelst, wirst du weitere mächtige Zaubersprüche finden. Einige Zaubersprüche können bei Händlern gekauft werden, einige können von Spielern mit handwerklichen Fähigkeiten hergestellt werden, und einige müssen durch Quests erlangt werden. Viel Glück da draußen!");
        if ($class eq "Necromancer") {
          quest::summonitem(59962); # Item: Spell: Siphon Strength
        }
        elsif ($class eq "Druid") {
          quest::summonitem(59965); # Item: Spell: Snare
        }
        elsif ($class eq "Cleric") {
          quest::summonitem(59966); # Item: Spell: Yaulp
        }
        elsif ($class eq "Shaman") {
          quest::summonitem(59959); #Spell: Strengthen
        }
        elsif ($class eq "Enchanter") {
          quest::summonitem(59961); # Item: Spell: Minor Illusion
        }
        elsif ($class eq "Magician") {
          quest::summonitem(59960); # Item: Spell: Summon Food
        }
        elsif ($class eq "Wizard") {
          quest::summonitem(59964); # Item: Spell: Numbing Cold
        }
        quest::popup("Niederschreiben und Auswendiglernen", "Rytan hat dir eine Zauberschriftrolle gegeben!<br><br>Um einen Zauber zu benutzen, musst du zuerst <c \"#00FF00\">einen Zauber in dein Zauberbuch schreiben</c> und dann <c \"#00FF00\">den Zauber in deiner <c \"#00FF00\">Zauberleiste</c> speichern</c>. Es gibt nur eine begrenzte Anzahl von Plätzen in Ihrer Zauberleiste, daher ist die Auswahl der gespeicherten Zauber eine wichtige Strategie, sobald Du mehr Zauber kennst.<br><br>Um diesen Zauber zu schreiben, öffne zuerst Dein <c \"#00FF00\">Zauberbuch</c>, indem Du <c \"#00FFFF\">[Strg+B]</c> verwendest und die Zauberrolle auf ein leeres Zauberfeld auf einer Seite bewegst und mit der linken Maustaste klickst. Dadurch wird das Schreiben des Zaubers gestartet. Dieser Vorgang nimmt ein wenig Zeit in Anspruch. Ein dünner lila Fortschrittsbalken erscheint am unteren Rand des Zauberbuchfensters, während Du schreibst.<br><br>Wenn der Zauber fertig geschrieben ist, erscheinen das Symbol und der Name des Zaubers in Deinem Zauberbuch. <c \"#00FFFF\">Klicke mit der linken Maustaste</c> auf dieses neu hinzugefügte Symbol in Deinem Zauberbuch, um das Symbol mit Deinem Cursor zu verbinden. Dann <c \"#00FFFF\">Linksklick</c> auf einen leeren Zauberplatz in Deiner <c \"#00FF00\">Zauberleiste</c>. Das Ziehen des Zaubers bewirkt nichts; klicke einfach <c \"#00FFFF\">mit der linken Maustaste</c> einmal in Dein Zauberbuch und einmal auf Deine <c \"#00FF00\">Zauberleiste</c>. Die <c \"#00FF00\">Zauberleiste</c> beginnt kurz zu blinken, sobald Du diese Meldung schließt.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
        REVIEW();
      }
    }
  }
  elsif ($text=~/wiederholen/i) {
    if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Melee
      quest::say("Es sieht so aus, als ob Du Dich eher auf Deine Nahkampffähigkeiten als auf Zaubersprüche verlässt, um erfolgreich zu sein. Ich bin selbst kein guter Kämpfer, aber ich habe diesen Folianten, den ich Dir anbieten kann. Er könnte sich im Kampf gegen die Kobolde als nützlich erweisen. Mit zunehmender Erfahrung wirst Du weitere Bände finden, aus denen Du lernen kannst. Einige können bei Händlern gekauft werden, einige können von Spielern mit Handwerksfähigkeiten hergestellt werden und einige müssen durch Quests erlangt werden. Viel Glück da draußen!");
    }
    elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Bard" || $class eq "Beastlord" || $class eq "Ranger") { #Hybrid
      quest::say("Sie scheinen eine Art Hybrid zu sein. Du hast Zugang zu Magie und später auch zu Fertigkeitsbüchern. Wenn Du Geld verdienst und Erfahrung sammelst, wirst Du in der Lage sein, andere mächtige Zaubersprüche zu verwenden. Einige Zaubersprüche können von Spielern mit Handwerksfähigkeiten hergestellt werden, und einige müssen über Quests erhalten werden, aber die meisten von ihnen können von Anbietern wie jene über die Brücke nordwestlich von hier gekauft werden.");
    }
    elsif ($class eq "Necromancer" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Enchanter" || $class eq "Magician" || $class eq "Wizard") { #Caster
      quest::say("Du scheinst ein bisschen ein Zauberer zu sein wie ich. Wenn du Geld verdienst und Erfahrung sammelst, erhältst du Zugang zu anderen mächtigen Zaubern.  Einige Zaubersprüche können von Spielern mit Handwerksfähigkeiten hergestellt werden, und einige müssen über Quests erhalten werden, aber die meisten von ihnen können von Anbietern wie jene über die Brücke nordwestlich von hier gekauft werden.");
    }
    REVIEW();
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub REVIEW {
  if ($class eq "Warrior" || $class eq "Berserker" || $class eq "Monk" || $class eq "Rogue") { #Combat Abilities
    quest::popup("Kampffähigkeiten", "Um eine Kampffähigkeit zu benutzen, musst Du sie zuerst <c \"#00FF00\">erlernen</c>, dann musst Du <c \"#00FF00\">einen Hotkey</c> erstellen, um sie auszulösen.<br><br>Um diese Kampffähigkeit zu lernen, suche sie einfach in Ihrem Inventar und <c \"#00FFFF\">rechtsklicke</c> auf den Folianten. <br><br>Sobald Du Dirdie Fähigkeit gemerkt hast, öffne Dein <c \"#00FFFF\">Kampffähigkeiten-Fenster</c> mit <c \"#00FFFF\">[Alt+C]</c>. Du kannst dann <c \"#00FFFF\">mit der linken Maustaste</c> auf die dünne <c \"#00FFFF\">S</c>-Taste klicken, um eine vollständige Liste aller Dir bekannten Kampffähigkeiten anzuzeigen. Wähle die Kampffähigkeit aus diesem Fenster aus und <c \"#00FFFF\">klicke dann mit der linken Maustaste</c> auf die Schaltfläche <c \"#00FFFF\">Make Hotkey</c> am unteren Rand des Fensters. Dadurch erhälst Du einen Hotkey, den Du in einem der 8 Slots in Deinem <c \"#00FFFF\">Kampffähigkeiten-Fenster</c> oder direkt auf einer <c \"#00FFFF\">Hotbar</c> platzieren kannst.<br><br><c \"#F07F00\">Klicke 'OK', um fortzufahren.</c>");
    quest::popup("Kampffähigkeiten", "Tastenkombinationen für Kampffähigkeiten:<br><br>Es ist auch möglich, Tastenkombinationen zu erstellen, indem Du <c \"#00FFFF\">mit der rechten Maustaste</c> auf einen leeren Platz in Deinem <c \"#00FFFF\">Kampffähigkeiten-Fenster</c> klickst und Deine Fähigkeit aus dem <c \"#00FF00\">Kontextmenü</c> auswählst. Wenn Du mehr Fähigkeiten erlernst, werden weitere Kategorien in diesen Menüs erscheinen.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
    quest::popup("Kampffähigkeiten", "<c \"#FFFF00\">Kampffähigkeiten benutzen:</c><br>Für eine Beschreibung dessen, was Deine Kampffähigkeiten tun können, <c \"#00FFFF\">klicke mit der linken Maustaste</c> auf die Schaltfläche S in Deinem <c \"#00FFFF00\">Kampffähigkeiten-Fenster</c> und wähle dann den Namen der Kampffähigkeit in dem Fenster, das sich öffnet. Die Beschreibung erscheint im unteren Teil dieses <c \"#00FF00\">Kampffähigkeiten-Fensters</c>.<br><br>Um eine Fähigkeit zu verwenden, wähle Dein Ziel aus und klicke dann <c \"#00FFFF\">mit der linken Maustaste</c> auf den Hotkey, den Du in Deinem <c \"#00FF00\">Kampffähigkeiten-Fenster</c> oder Deiner <c \"#00FF00\">Hotbar</c> erstellt hast. <br><br><c \"#FFFF00\">Ausdauer:</c><br>Die meisten Kampffähigkeiten benötigen Ausdauer, um zu wirken oder aktiv zu bleiben. Ausdauer wird durch den gelben Balken unter Deiner Trefferpunktanzeige im <c \"#00FF00\">Spielerfenster</c> dargestellt. Ähnlich wie die Trefferpunkte regeneriert sich die Ausdauer mit der Zeit, aber im Gegensatz zu den Trefferpunkten regeneriert sie sich mit der gleichen Rate, egal ob Du sitzt oder stehst, solange Du nicht aktiv etwas angreifst. <br><br>Wenn Du Dich in einem ausgeruhten Zustand befindest und sitzt (es wird ein gelber Wirbel in Deinem <c \"#00FF00\">Spielerfenster</c> zu sehen sein, wenn dies der Fall ist), regenerieren sich sowohl Ausdauer als auch Trefferpunkte mit einer viel schnelleren Rate als normal.<br><br>Wenn Du diese Lektionen noch einmal lesen möchten, bitte einfach Rytan, sie zu [" . quest::saylink("wiederholen") . "].<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren</c>");
  }
  elsif ($class eq "Paladin" || $class eq "Shadowknight" || $class eq "Necromancer" || $class eq "Bard" || $class eq "Druid" || $class eq "Cleric" || $class eq "Shaman" || $class eq "Beastlord" || $class eq "Ranger" || $class eq "Enchanter" || $class eq "Magician" || $class eq "Wizard") { #Spells and Songs
    quest::popup("Niederschreiben und Auswendiglernen", "Um einen Zauber zu benutzen, musst Du zuerst <c \"#00FF00\">einen Zauber in Dein Zauberbuch schreiben</c> und dann <c \"#00FF00\">den Zauber in Deiner <c \"#00FF00\">Zauberleiste</c> speichern</c>. Es gibt nur eine begrenzte Anzahl von Plätzen in Deiner Zauberleiste, daher ist die Auswahl der Zauber, die Du gespeichert hast, eine wichtige Strategie, wenn Du mehr Zauber kennst.<br><br>Um diesen Zauber zu schreiben, öffne zuerst Dein <c \"#00FF00\">Zauberbuch</c>, indem Du <c \"#00FFFF\">[Strg+B]</c> verwendest und die Zauberrolle auf ein leeres Zauberfeld auf einer Seite überträgst und linksklickst. Dadurch wird das Schreiben des Zaubers gestartet. Dieser Vorgang nimmt ein wenig Zeit in Anspruch. Ein dünner lila Fortschrittsbalken erscheint am unteren Rand des Zauberbuchfensters, während Du schreibst.<br><br>Wenn der Zauber fertig geschrieben ist, erscheinen das Symbol und der Name des Zaubers in Deinem Zauberbuch. <c \"#00FFFF\">Klicke mit der linken Maustaste</c> auf dieses neu hinzugefügte Symbol in Deinem Zauberbuch, um das Symbol mit Deinem Cursor zu verbinden. Dann <c \"#00FFFF\">Linksklick</c> auf einen leeren Zauberplatz in Deiner <c \"#00FF00\">Zauberleiste</c>. Das Ziehen des Zaubers bewirkt nichts; klicke einfach <c \"#00FFFF\">mit der linken Maustaste</c> einmal in Dein Zauberbuch und einmal auf Deine <c \"#00FF00\">Zauberleiste</c>. Die <c \"#00FF00\">Zauberleiste</c> beginnt kurz zu blinken, sobald Du diese Meldung schließt.<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
    #Need to flash spell bar here (fade out/in 3-4 times)
    quest::popup("Zauber und Lieder", "Zauberkürzel:<br><br>Es ist auch möglich, sich Zauber zu merken, indem Du <c \"#00FFFF\">mit der rechten Maustaste</c> auf einen leeren Zauberplatz in Deiner <c \"#00FFFF\">Zauberleiste</c> klickst und Deinen Zauber aus dem <c \"#00FF00\">Kontextmenü</c> auswählst. Je mehr Zaubersprüche Du schreibst, desto mehr Kategorien werden in diesen Menüs erscheinen.<br><br>Eventuell wirst Du feststellen, dass Du verschiedene Gruppen von Zaubersprüchen zu unterschiedlichen Zeiten benutzt. Wenn Du Deine aktuell gespeicherten Zaubersprüche als <c \"#00FFFF\">Zauberspruch-Set</c> speichern möchten, kannst Du dies tun, indem Du <c \"#00FFFF\">mit der rechten Maustaste</c> auf das <c \"#00FF00\">Zauberbuch</c>-Symbol am Ende Deiner <c \"#00FF00\">Zauberspruch-Leiste</c> klickst. Wähle in diesem Menü <c \"#00FFFF\">Zaubersatz speichern</c> und gib dann einen Namen ein. Sobald Du ein <c \"#00FFFF\">Zauberspruch-Set</c> gespeichert hast, kannst Du diese Zaubersprüche schnell auswendig lernen, indem Du sie im Menü <c \"#00FFFF\">Zauberspruch-Set laden</c> auswählst.<br><br><c \"#F07F00\">Klicke 'OK', um fortzufahren.</c>");
    quest::popup("Zauber und Lieder", "<c \"#FFFF00\">Verwenden von Zaubern:</c><br><br>Um einen Zauber zu wirken, musst Du Dir den Zauber in Deiner <c \"#00FF00\">Zauberleiste</c> gemerkt haben. Um einen Zauber zu wirken, wählen Dein Ziel aus und klicke dann <c \"#00FFFF\">mit der linken Maustaste</c> auf das Zaubersymbol in Deiner <c \"#00FF00\">Zauberleiste</c>. <br><br>Für eine Beschreibung, was Deine Zaubersprüche können, <c \"#00FFFF\">klicke mit der rechten Maustaste</c> auf das Zauberspruch-Symbol in Deinem Zauberbuch.<br><br><c \"#FFFF00\">Mana:</c><br>Die meisten Zaubersprüche benötigen Mana, um gewirkt zu werden. Mana wird durch den blauen Balken unter Deiner Trefferpunktanzeige im <c \"#00FF00\">Spielerfenster</c> dargestellt. Ähnlich wie die Trefferpunkte regeneriert sich Mana mit der Zeit, aber es regeneriert sich viel schneller, wenn Du sitzt.<br><br>Wenn Du in einem ausgeruhten Zustand bist und sitzt (es wird ein gelber Wirbel in Deinem <c \"#00FF00\">Spielerfenster</c> angezeigt, wenn dies der Fall ist), regenerieren sich sowohl Mana als auch Trefferpunkte viel schneller als normal. <br><br>Wenn Du  diese Lektionen noch einmal lesen möchten, bitten Sie einfach Rytan, sie zu [" . quest::saylink("wiederholen") . "].<br><br><c \"#F07F00\">Klicke auf 'OK', um fortzufahren.</c>");
  }
  quest::say("Du lernst schnell, mein Freund. Hoffentlich kann Deine Magie uns durch den bevorstehenden Kampf führen.");
}