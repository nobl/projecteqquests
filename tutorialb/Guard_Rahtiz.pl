#zone - tutorialb
#quest - Spider Tamer Gugan
#site3op
# items: 54604, 8500

sub EVENT_SAY {
   if (quest::istaskactivityactive(16,2)){
      quest::say("Gut gemacht! Wenn Du Gloomingdeep-Seide gesammelt hast, gib sie unbedingt Vahlara. Sie kann damit Verbände für die anderen verwundeten Sklaven machen. Hier sind ein paar Münzen, die ich bei einem toten Kobold fand. Gute Arbeit, mein Freund!");
   }
   else{
      if ($text=~ /Hail/i){
         quest::say("Grüße, $name. Wir sind froh, dass Du den Weg zu unserem Camp gefunden hast. Wir können jede Hilfe gebrauchen, die wir bekommen können!");   
         quest::say("Der Spinnenbändiger von Gloomingdeep ist in der Lage, Anti-Gift aus einer seltenen Blume zu brauen, die in Gloomingdeep wächst. Wenn wir diese Blume hätten, könnten wir damit vielleicht das Leben unserer Kameraden retten.");
         quest::updatetaskactivity(23,0);
      }
   }
   quest::taskselector(16, 17, 18);
}

sub EVENT_TASKACCEPTED {
        if($task_id == "16") {
                quest::say("Die Kobolde züchten die Gloomfangspinnen, um diese Minen zu bewachen. Die neueste Brut der Königin Gloomfang hat sich kürzlich aus ihren Kokons befreit und nun wimmelt es in den südlichen Höhlen von Riesenspinnen.");
      quest::say("Geh da rein und räume die verdammten Dinger aus dem Weg!");
        }
   if($task_id == "17") {
      quest::say("Das Ungeziefer, das diese Tunnel befallen hat, bedroht unsere knappen Vorräte. Wenn Du unserer Revolte helfen willst, beginne damit, den Tunnel hinter mir von Ratten und Fledermäusen zu säubern. Sprich mit Vahlara, wenn Du Deine Jagd beendet hast und sie wird Dich mit einem Paar genähter Leggings belohnen. Das ist zwar nicht viel, aber alles, was wir im Moment entbehren können.");
   } 
   if($task_id == "18") {
      quest::say("Die Kobolde werden diesen Gang hier hinunterstürmen. Ich werde nur Zeit haben, ein paar Pfeile abzufeuern, bevor sie in den Nahkampf gehen. Wage dich in die Tunnel dahinter und bringe mir einen weiteren Pfeil, er könnte mir das Leben retten. Die Kobolde hinterlassen in der Regel zusätzliche Munition in den Fässern, die überall in den Minen stehen. Brich ein paar von ihnen auf und du wirst wahrscheinlich ein paar Pfeile finden, die wir benutzen können.");
   }
}

sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 54604 => 1)) {
          quest::say("Gut gemacht $name! Wir werden sofort mit dem Brauen beginnen.");
          quest::exp(25);
     }
   elsif(plugin::check_handin(\%itemcount, 8500 => 1)) {
      if(quest::istaskactivityactive(18,0)) {
         quest::updatetaskactivity(18,0);
         if(quest::istaskactivityactive(18,1)) {
            quest::say("Gute Arbeit, ich bin sicher, die anderen werden diese Pfeile gut gebrauchen können. Ich fand diesen Köcher hinter einigen Kisten versteckt, als ich auf Patrouille war. Ich kann das breite Ende eines Ogers nicht mit einem Bogen treffen, aber vielleicht kannst Du ihn besser nutzen.");
            quest::updatetaskactivity(18,1);
         }   
      }
   }
   plugin::return_items(\%itemcount);
}