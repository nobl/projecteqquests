--[[


Tutorial Revamp Re-write by Drogerin

##Color Reference guide##
<c \"#83f07a\"> Light Green
<c \"#F07F00\"> Dark Orange


--]]


function event_say(e)
	if (e.message:findi("hail") and eq.is_task_active(290)) then
		eq.popup("Hotbars & Hotkeys","<br><c \"#83f07a\"> Hotbars</c> sind die primären Werkzeuge zum Spielen von Everquest. Mit den zugewiesenen <c \"#83f07a\"> Hotkeys</c> können Sie verschiedene Arten von Fähigkeiten, alternative Fortschrittsfähigkeiten sowie benutzerdefinierte und vordefinierte Aktionen aktivieren.<br><br><c \"#F07F00\"> Klicke auf 'OK', um die Verwaltung Deiner Hotbars zu lernen.</c>",6,0,0);
	else
		e.self:QuestSay(e.other, "Der wichtigste Teil des Kampfes ist die Vorbereitung! Du wirst da draußen getötet werden, wenn du es nicht tust. Das ist das Wichtigste, was du lernen musst. Ich kann es dir zeigen.");
		eq.task_selector({290});
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
