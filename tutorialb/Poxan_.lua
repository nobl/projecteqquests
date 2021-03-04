--[[

Tutorial Revamp by Drogerin

##Color Reference guide##
<c \"#00c8f0\"> Light Blue
<c \"#F07F00\"> Dark Orange


--]]

function event_say(e)
	if (e.message:findi("hail") and eq.is_task_active(22)) then -- Basic Training(22)
		e.self:QuestSay(e.other," seufzt schwer, als er in das trübe Wasser blickt. Das ist ja schrecklich, ich habe mein Schwert ins Wasser fallen lassen und kann nicht schwimmen! Ich nehme nicht an, dass Du es für mich zurückholen könntest, $name? Ohne ein Schwert kann ich nicht gut gegen Kobolde kämpfen.'",{speak_mode = SpeakMode.Emote});
		eq.popup("Schwimmen","<br>Beim Schwimmen kannst Du die Tasten<c \"#00c8f0\">Bild Hoch</c> oder <c \"#00c8f0\">Bild Runter</c> verwenden, um Deinen Charakter nach oben oder unten zu richten. Du kannst dann mit den <c \"#00c8f0\">Pfeiltasten</c> normal schwimmen.<br><br><c \"#F07F00\">Springe ins Wasser und schnappe Dir Poxans Schwert unter der Brücke. Klicke dann auf "OK", um fortzufahren.</c>",10,0,0);
	end
end


function event_trade(e)
	local item_lib = require("items");
	
	if (item_lib.check_turn_in(e.trade, {item1 = 59968})) then -- Poxan's Sword.
		e.self:QuestSay(e.other, "Ausgezeichnet! Jetzt kann ich an der Seite des Aufstandes gegen die Kobolde kämpfen. Hier nimm das. Ich habe es vorhin in den Tunneln gefunden. Du könntest es brauchen.");
		e.other:QuestReward(e.self,{itemid=59969}); --Kobold Leather Mask.
		eq.update_task_activity(22,6,1); --Basic Training(22)
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
