DefDebug(Vector(-1702.358765, -13667.229492, 130.281250), Vector(-1705.010010, -13663.115234, 130.031250), Vector(3692.599, -1646.229, 232.531));

::DefDebug <- function(vecPos_Pre, vecPos_Aft, vecPos_Tst, bNotReverse = true) { if(vecPos_Pre == null) { Say(null, "\"第一个坐标有误\".", false);         return; }
    if(vecPos_Aft == null){Say(null, "\"第二个坐标有误\".", false);
    return;
}
if(vecPos_Tst == null){Say(null, "\"第三个坐标有误\".", false);
return;
}
local vecPos_Map = vecPos_Aft - vecPos_Pre;
if(bNotReverse)//正向映射 {
    //local vecPos_Final = vecPos_Tst + vecPos_Map; Ent(1).SetOrigin(vecPos_Tst + vecPos_Map); } else { Ent(1).SetOrigin(vecPos_Tst - vecPos_Map); } }