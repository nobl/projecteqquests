sub EVENT_SIGNAL {
  if($signal == 1) { 
  quest::spawn2(294578,0,0,$x,$y,$z,$h); # NPC: #Crumbling_Monument
  quest::depop_withtimer();
  }
  }