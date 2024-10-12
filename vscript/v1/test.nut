//script_execute test

//SendToServerConsole("st_mr_record 1");

//cvar("st_mr_force_file", "testco");cvar("st_mr_play", Ent("!coach").GetEntityIndex());

//cvar("st_mr_force_file", "testro");cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());

//cvar("st_mr_force_file", "testni");cvar("st_mr_play", Ent("!nick").GetEntityIndex());

//cvar("st_mr_force_file", "testel");cvar("st_mr_play", Ent("!ellis").GetEntityIndex());

//cvar("st_mr_force_file", "testlo");cvar("st_mr_play", Ent("!louis").GetEntityIndex());

//cvar("st_mr_force_file", "test");cvar("st_mr_play", Ent("!bill").GetEntityIndex());

//cvar("st_mr_force_file", "testfra");cvar("st_mr_play", Ent("!francis").GetEntityIndex());

//cvar("st_mr_force_file", "testzo");cvar("st_mr_play", Ent("!zoey").GetEntityIndex());


//SendToServerConsole("st_mr_record 1 ");
Ent("!nick").GiveItem("grenade_launcher");Ent("!coach").GiveItem("vomitjar");
Ent("!rochelle").GiveItem("pipe_bomb");Ent("!ellis").GiveItem("molotov");

Convars.SetValue("st_mr_force_file", "nick");Convars.SetValue("st_mr_play", Ent("!nick").GetEntityIndex())

Convars.SetValue("st_mr_force_file", "coach");Convars.SetValue("st_mr_play", Ent("!coach").GetEntityIndex())

//Convars.SetValue("st_mr_force_file", "ellis");Convars.SetValue("st_mr_play", Ent("!ellis").GetEntityIndex())

//Convars.SetValue("st_mr_force_file", "rochelle");Convars.SetValue("st_mr_play", Ent("!rochelle").GetEntityIndex())

