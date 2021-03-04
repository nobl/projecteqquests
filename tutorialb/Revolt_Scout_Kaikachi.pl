#zone - tutorialb
#quest - Busted Locks, Goblin Treachery

sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (quest::istaskactivityactive(21,2)) {
      quest::say("Ich bin froh, dass du das hinter dich gebracht habt. Jetzt können wir unsere Aufmerksamkeit auf die Kobolde selbst richten. Hier ist ein Unsichtbarkeitstrank, den wir von einem von Rookfynns Lehrlingen erbeutet haben. Möge er dich beschützen, Bruder.");
    }
    else{
      quest::say("Schhhh. Wir sind gerade durch den geheimen Tunnel geschwommen. Nicht mal die Kobolde wissen es. Führ sie hierher zurück und wir machen sie fertig.");  
      quest::taskselector(20, 21);
    }
  }
}

sub EVENT_TASKACCEPTED {
  if($task_id == "20") {
    quest::say("Die meisten Sklaven, die in diese Höhle zurückhumpeln, sind immer noch in Ketten gefesselt. Unsere Klingen sind stumpf vom Brechen der Koboldfesseln. Du musst den Kobold-Schlosser finden und seinen Schlüsselring stehlen. Der Schmied ist ein Albino-Kobold, der die meiste Zeit in der Nähe des Gloomingdeep-Gefängnisses verbringt.");
  }
  if($task_id == "21") {
    quest::say("Als die Revolte begann, dachten wir, die Goblinsklaven wären auf unserer Seite. Es stellte sich heraus, dass der frühere Anführer der Goblins, ein Schamane namens Rookfynn, seinen Verwandten heimlich befohlen hatte, den Gloomingdeep-Kobolden bei der Niederschlagung unserer Revolte zu helfen.");
    quest::say("Rookfynn hofft, durch seine Loyalität die Gunst der Kobolde zu gewinnen. Töte Rookfynn und zehn seiner verräterischen Verwandten. Das Einzige, was schlimmer ist als ein Kobold, ist ein Kobold, der einem Sklavenhalter gegenüber loyal ist.");
    quest::say("Die Goblins sind mit Ausgrabungen an Grabungsstätte 1 beschäftigt. Rookfynn ist wahrscheinlich bei ihnen.");
    quest::say("Viel Glück, mein Freund.");
  }
}