--[[

Tutorial revamp rewrite by Drogerin

##Color Reference Chart##
<c \"#F07F00\"> Dark Orange
<c \"#00c8f0\"> Light Blue
<c \"#1b6e14\"> Dark Green

Frizznik Hailstorm  NPCID -- 189017


Things to DO:
Add as an (Opt) Optional task under Basic Training.


--]]



function event_say(e)	
	if (e.message:findi("hail")) then
		e.self:QuestSay(e.other, "Nun, hallo. Mein Name ist Frizznik und ich bin dafür zuständig, Essen für die Revolte zu finden. Ich habe mehr als genug Rattenfleisch gefunden, um Steaks zu machen, wenn du also Lust hast, dir etwas zu kochen, dann sei mein Gast. Willst du lernen, wie man [" .. eq.say_link("rat steaks") .. "] kocht?");
		eq.popup("Handwerkliche Fertigkeiten", "<br> In der Welt von Norrath gibt es viele verschiedene Arten von Handwerksfertigkeiten, mit denen Spieler nützliche Gegenstände und Ausrüstung herstellen können. Handwerksfertigkeiten sind ein lustiger Zeitvertreib und können Deinem Charakter auch helfen, Geld zu verdienen, indem Du die Gegenstände an andere Spieler verkaufst. In diesem Tutorial zeigt Dir Frizznik, wie Du den Handwerks-Skill "Backen" verwendest.<br><br><c \"#F07F00\"> Frage  Frizznik nach 'rat steaks', um fortzufahren.</c>", 5,0,0);
	elseif (e.message:findi("rat steaks")) then
		e.self:QuestSay(e.other, "Es ist nicht das tollste Gericht, aber für den Moment muss es reichen. Hier ist eine schöne Rattenlende für Dich und ein Krug mit Soße.");
		e.other:SummonItem(59946) -- Gloomingdeep Rat Meat
		e.other:SummonItem(59947) -- Kobold Cooking Sauce
		eq.popup("Handwerkliche Fertigkeiten", "<br> Um die von Frizznik gewünschten Rattensteaks zu braten, benutze den Ofen neben ihm. Lege das Rattenfleisch und die Kobold-Kochsauce in Dein Inventar und klicke dann <c \"#00c8f0\"> mit der linken Maustaste </c>auf den Ofen, um das <c \"#1b6e14\"> Handwerksfenster</c> zu öffnen. Dann <c \"#00c8f0\"> klicke mit der linken Maustaste </c> auf die Schaltfläche 'Search Recipes' oben im Fenster, um eine Liste von Rezepten im Feld darunter anzuzeigen. Scrolle nach unten, bis Du 'Rat Steals' in der Liste siehst und <c \"#00c8f0\"> klicke mit der linken Maustaste </c> darauf. Klicke dann auf die <c \"#00c8f0\"> Combine </c>Schaltfläche, um das Rattensteak zuzubereiten. <br><br><c \"#F07F00\"> Klicke auf 'OK', um eine andere Methode zum Garen eines Rattensteaks zu erfahren.",1,0,0);
	end
end


function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
