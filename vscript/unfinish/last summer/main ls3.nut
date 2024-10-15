//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//Created By Sw1ft: https://steamcommunity.com/id/alkashproduction

SkipIntro();

SetPreviousSegmentTime(84.000); // put previous map segment time. Ex: 24.833

//========================================================================================================================
//Delete Custom Campaigns's Intros
//========================================================================================================================

/*EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);*/

//========================================================================================================================

Say(null, "Type !practice or !help in chat for practice", false);
EntFire("info_changelevel", "Disable");

Cvars <-
{
	// Game
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	host_timescale = 1.0
	god = 0
	sv_infinite_ammo = 0
	sv_client_min_interp_ratio = 0

	// AI
	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 1
	z_common_limit = 0

	nb_blind = 0
	nb_stop = 0
	sb_stop = 0

	// ST
	st_autocb = 1
	st_edgebug = 1
	st_fastreload = 1
};

/*
SetClientName(Ent("!nick"), "");
SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!coach"), "");
SetClientName(Ent("!ellis"), "");
*/

Survivors <- {}; // characters customization

Survivors["francis"] <-
{
	origin = Vector(-3022.362, -3351.751, -1551.969)
	angles = QAngle(6.193, 109.559, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "francis");
		//cvar("st_mr_play", Ent("!francis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["bill"] <-
{
	origin = Vector(-3098.584, -3295.198, -1551.969)
	angles = QAngle(7.570, 61.173, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}

		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "bill");
		//cvar("st_mr_play", Ent("!bill").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["louis"] <-
{
	origin = Vector(-3027.982, -3261.866, -1551.969)
	angles = QAngle(11.974, 125.037, 0.000)
	velocity = null

	health = 94
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot0"

		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 29
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 8
		}

		slot2 = "molotov" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "louis");
		//cvar("st_mr_play", Ent("!louis").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
		OpenSafeRoomDoor();
	}
}

Survivors["zoey"] <-
{
	origin = Vector(-3032.641, -3416.480, -1551.969)
	angles = QAngle(6.331, 100.892, 0.000)
	velocity = null

	health = 60
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot0"

		slot0 = // primary weapon
		{
			weapon = "smg_silenced"
			clip = 48
			ammo = 650
		}

		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 8
		}

		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		//cvar("st_mr_force_file", "zoey");
		//cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
		{

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn

	foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove

}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25); OpenSafeRoomDoor();
	DisableAutoClimb();
	/*
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");

	CreateTimer(0.000, function()
	{
		OpenSafeRoomDoor(); OpenSafeRoomDoor(bool bOpen = false) | CloseSafeRoomDoor(bool bBeginningDoor = true)
	});
	*/

}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{

}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{
	SendToServerConsole("director_start");
	SayMsg("Finale Started.");
	FinaleScript();
	FinaleManager.Settings.Enabled = true;
	FinaleManager.OnBeginCustomStage(1, 0);

}

function Callbacks::OnFinalePause() // called during pause stage of panic event in the finale
{

}

function Callbacks::OnLastTankKilled() // called after killing a specified amount of Tanks in the finale (FinaleManager.Settings.MaxTanksInFinale)
{

}

function Callbacks::OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBeginCustomStage(iNum, iType)
{
	local ERROR = -1;
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	local SCRIPTED = 3;

	local PAUSE = 0;

	if (iType == PANIC)
	{
		//CreateTimer(0.500, function(){ SayMsg("MOLOTOVS/GASCAN READY!"); });
		//CreateTimer(1.800, function(){ SayMsg("Throw!"); });
	}
	else if (iType == TANK)
	{
		reateTimer(0.000, function()
		{
			SendToServerConsole("host_timescale 0.25");
			SayMsg("Slowing down timescale to 0.25");
		});

		CreateTimer(4.00, function()
		{
			SendToServerConsole("host_timescale 0.5");
		});

		CreateTimer(4.00, function()
		{
			SayMsg("Turning timescale back to 0.5");
		});
	}
	else if (iType == DELAY)
	{
		//CreateTimer(0.000, function(){ SayMsg("GET READY!"); });
	}

}


function DirectorScript::MapScript::OnBeginCustomFinaleStage( num, type )
{
	if ("FinaleManager" in getroottable())
		FinaleManager.OnBeginCustomStage(num, type);
}

function OnPlayerTakeDamageEvent(tParams)
{
	local hPlayer = tParams["_player"];

	if ( !hPlayer )
		return;

	if ( hPlayer.GetZombieType() == 8 ) // 8 = Tank
	{
		SayMsg( "Remaining HP: " + hPlayer.GetHealth() );
	}
}
HookEvent( "player_hurt", OnPlayerTakeDamageEvent );


function FinaleScript()
{

	printl("Finale Script Loaded...");

	//local aPanicOne = [];

	local aPauseOne = [];
	//panic 1
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-5702.031, -3530.188, 532.031),Vector(-5717.327, -3534.462, 532.031),  RandomInt(15, 15), -20, 50));
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3697.642, -3134.746, 698.031),Vector(-3642.037, -3322.348, 698.031), RandomInt(8, 8), -20, 20));

	//local aPanicTwo = [];

	local aPauseTwo = [];
	//panic 2
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-453.371, 838.173, -15.451),Vector(-236.563, 826.410, -12.608), RandomInt(13, 13), -20, 20));
	aPauseOne.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3519.954, 1963.390, -55.644),Vector(-3429.121, 1965.943, -47.898), RandomInt(16, 16), -10, 10));

	//local aPanicThree = [];

	local aPauseThree = [];
	//panic 3
	aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-2862.977, -3918.412, 230.031),Vector(-3017.309, -3740.184, 230.031), RandomInt(11, 11), -45, 45));
	//aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-1798.540, 425.915, -449.541),Vector(-1772.545, 424.416, -448.992), RandomInt(3, 3), -10, 10));
	aPauseThree.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-3017.309, -3740.184, 230.031),Vector((-4881.007, -3764.349, 854.031), RandomInt(15, 15), -45, 40)));

	local aPauseFour = [];

	//panic 4
	aPauseFour.extend(FinaleManager.CalculatePointsWithinCircle(Vector(), 45.0, RandomInt(12, 12)));
	aPauseFour.extend(FinaleManager.CalculatePointsByLinearDirection(Vector(-5330.904, -3296.241, 922.176),Vector(-5356.926, -3290.496, 912.535), RandomInt(16, 16), -5, 5));

	FinaleManager.aPauseSpawnPoints.push(aPauseOne);

	FinaleManager.aPauseSpawnPoints.push(aPauseTwo);

	FinaleManager.aPauseSpawnPoints.push(aPauseThree);

	FinaleManager.aPauseSpawnPoints.push(aPauseFour);

	AddScriptedTankSpawn(Vector(-3488.330, -3798.834, 844.031));
	AddScriptedTankSpawn(Vector(-4651.969, -3708.714, 844.031));
	AddScriptedTankSpawn(Vector(-3674.828, 1537.500, 61.073));

}

function slowtank()
{
	CreateTimer(0.000, function()
	{
		SendToServerConsole("host_timescale 0.25");
		SayMsg("Slowing down timescale to 0.25");
	});

	CreateTimer(4.00, function()
	{
		SayMsg("Turning timescale back to 0.5");
		SendToServerConsole("host_timescale 0.5");
	});
}

//items

/*
local ent;
while (ent =Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();
RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("gascan"); RemoveItemByName("propanetank");
RemoveItemByName("oxygentank"); RemoveItemByName("pain_pills"); RemoveItemByName("defibrillator"); RemoveItemByName("first_aid_kit");
RemoveItemByName("vomitjar");
*/

//others
SpawnItem("vomitjar", Vector(-4628.000, -3630.000, -1548.772), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("grenade_launcher", Vector(-7424.000, 332.000, -1551.830), QAngle(0.000, 0.000, 0.000), 1,3.0);

//saferoom
SpawnItem("hunting_rifle", Vector(-3117.000, -3388.000, -1522.063), QAngle(0.615, 260.947, 89.912), 5);
SpawnItem("sniper_military", Vector(-3115.031, -3413.031, -1521.625), QAngle(358.945, 74.531, 90.747), 5,3.0);
SpawnItem("first_aid_kit", Vector(-3122.000, -3368.000, -1520.219), QAngle(90.000, 269.473, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-3107.000, -3368.000, -1520.219), QAngle(90.000, 269.473, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-3122.000, -3354.000, -1520.219), QAngle(90.000, 269.473, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-3108.000, -3354.000, -1520.219), QAngle(90.000, 269.473, 0.000), 1);
//屋上


SpawnItem("first_aid_kit", Vector(-4103.000, -3369.000, 847.000), QAngle(90.000, 270.000, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4103.000, -3354.000, 847.000), QAngle(90.000, 270.000, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4121.000, -3354.000, 847.000), QAngle(90.000, 270.000, 0.000), 1);
SpawnItem("first_aid_kit", Vector(-4121.000, -3369.000, 847.000), QAngle(90.000, 270.000, 0.000), 1);

SpawnItem("ammo", Vector(-4443.000, -3752.000, 844.000), QAngle(0.000, 0.000, 0.000), 1,3.0);
//ammo に近いほう
SpawnItem("sniper_military", Vector(-4435.969, -3706.031, 845.438), QAngle(358.989, 203.862, 90.879), 5,3.0);
//ammoから遠いほう
SpawnItem("shotgun_spas", Vector(-4447.969, -3661.938, 845.469), QAngle(0.000, 305.815, 90.000), 5,3.0);
//SpawnItem("sniper_military", Vector(-4447.688, -3660.594, 845.438), QAngle(359.341, 305.244, 90.264), 5);
//SpawnItem("hunting_rifle", Vector(-4448.000, -3662.000, 845.031), QAngle(0.571, 305.991, 90.132), 5);

SpawnItem("gascan_scavenge", Vector(-4090.219, -3104.656, 854.906), QAngle(358.989, 0.000, 359.561), -1,3.0);

SpawnItem("molotov", Vector(-4471.000, -3935.000, 849.167), QAngle(0.000, 320.977, 0.000), 1,3.0);
SpawnItem("molotov", Vector(-4452.000, -3935.000, 849.167), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("molotov", Vector(-4446.000, -3908.000, 849.167), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("molotov", Vector(-4470.000, -3910.000, 849.167), QAngle(0.000, 0.000, 0.000), 1,3.0);

//屋上の1つ下の階

SpawnItem("gascan_scavenge", Vector(-3762.125, -3541.438, 698.938), QAngle(359.517, 360.000, 359.780), -1,3.0);

//屋上の4つ下の階
//左側
SpawnItem("ammo", Vector(-2923.000, -3862.000, 220.000), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("gascan_scavenge", Vector(-3344.094, -3899.531, 230.938), QAngle(359.604, 360.000, 359.824), -1,3.0);
SpawnItem("sniper_military", Vector(-2947.469, -3901.500, 221.531), QAngle(358.901, 122.036, 91.055), 5,3.0);
//右側
SpawnItem("sniper_military", Vector(-6321.031, -3131.031, 221.438), QAngle(358.989, 124.849, 90.967), 5,3.0);
SpawnItem("molotov", Vector(-6383.375, -3171.906, 224.933), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("ammo", Vector(-6369.000, -3128.000, 220.000), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("gascan_scavenge", Vector(-5914.188, -3897.313, 230.906), QAngle(359.209, 0.000, 359.648), -1,3.0);


function MarkRemover()
{
	local hEntity = null;
	while ((hEntity = Entities.FindByModel(hEntity, "models/extras/info_speech.mdl")) != null)
	{
		hEntity.Kill();
	}
}

function MarkRemover()
{
	local hEntity = null;
	while ((hEntity = Entities.FindByModel(hEntity, "models/extras/info_speech.mdl")) != null)
	{
		hEntity.Kill();
	}
}

function ChatCommand_practice(hPlayer)
{
	Say(null, "Type !wave2 - Show the 2st wave position", false);
	Say(null, "Type !wave2_2 - Show the 2nd wave 2nd position", false);
	Say(null, "Type !wave3 - Show the 3rd wave position", false);
	Say(null, "Type !wave3_2 - Show the 3rd wave 2nd position", false);
	Say(null, "Type !wave4 - Show the 4th wave position", false);
	Say(null, "Type !wave4_2 - Show the 4th wave 2nd position", false);
	Say(null, "Type !molly - Gives molotov", false);
	Say(null, "Type !tankspawns - Show the tank spawn position", false);
	Say(null, "Type !clear - Clear bubble speech thing", false);
	Say(null, "Type !fs - Finale Sequence Guide", false);
	Say(null, "Type !req - Recording cVars requirement", false);

	RegisterChatCommand("!wave2", ChatCommand_wave2, true);
	RegisterChatCommand("!w2", ChatCommand_wave2, true);
	RegisterChatCommand("!wave2_2", ChatCommand_wave2_2, true);
	RegisterChatCommand("!w2_2", ChatCommand_wave2_2, true);
	RegisterChatCommand("!wave3", ChatCommand_wave3, true);
	RegisterChatCommand("!w3", ChatCommand_wave3, true);
	RegisterChatCommand("!wave3_2", ChatCommand_wave3_2, true);
	RegisterChatCommand("!w3_2", ChatCommand_wave3_2, true);
	RegisterChatCommand("!wave4", ChatCommand_wave4, true);
	RegisterChatCommand("!w4", ChatCommand_wave4, true);
	RegisterChatCommand("!wave4_2", ChatCommand_wave4_2, true);
	RegisterChatCommand("!w4_2", ChatCommand_wave4_2, true);
	RegisterChatCommand("!tankspawns", ChatCommand_tankspawn, true);
	RegisterChatCommand("!ts", ChatCommand_tankspawn, true);
	RegisterChatCommand("!clear", ChatCommand_markremover, true);
	RegisterChatCommand("!fs", ChatCommand_fnlseqguide, true);
	RegisterChatCommand("!req", ChatCommand_req, true);
	RegisterChatCommand("!molly", ChatCommand_gmolly, true);
}

function ChatCommand_wave2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-354.207, 830.333, -20.232), angles = Vector(), glowstate = 3, disableshadows = 1});
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1020.026, 159.940, 93.176), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov throw ang, pos", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "Line up on the tip of the bubble thing, on the line, then -72 to 73", false);
	Say(null, "setpos_exact -1091.214966 90.502693 -103.682159;setang_exact -72.0000 42.517090 0.000000", false);
}

function ChatCommand_wave2_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-3519.954, 1963.390, -55.644), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "No lineup needed", false);
}

function ChatCommand_wave3(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1904.669, 406.512, -453.699), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Shoot Gascan and hide from common sight", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1460.453979 125.454262 -68.233093;setang_exact 38.642273 149.796387 0.000000", false);
}

function ChatCommand_wave3_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-3441.993, -15.538, -461.299), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -3231.858643 -83.982040 -183.968750;setang_exact 51.512615 165.966461 0.000000", false);
}

function ChatCommand_wave4(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1087.484, 1933.316, 34.199), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos (Runthrow)", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1528.049438 -223.968750 -103.968750;setang_exact -35.111309 77.932503 0.000000", false);
}

function ChatCommand_wave4_2(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-1.086, -534.732, -491.765), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Molotov Throw ang, pos (Crouch Throw)", false);
	Say(null, "Copy Paste into console and memorize", false);
	Say(null, "setpos_exact -1052.611938 -852.267090 -103.968750;setang_exact 12.440001 15.232302 0.000000", false);
}

function ChatCommand_gmolly(hPlayer)
{
	local pName = hPlayer.GetPlayerName();
	Say(null, "Gave " + pName + " a molotov.", false);
	hPlayer.GiveItem("molotov");
}

function ChatCommand_tankspawn(hPlayer)
{
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-4687.500, -2125.000, 144.031), angles = Vector(), glowstate = 3, disableshadows = 1});
	SpawnEntityFromTable("prop_dynamic", {model = "models/extras/info_speech.mdl", origin = Vector(-4954.078, 210.086, -436.444), angles = Vector(), glowstate = 3, disableshadows = 1});
	Say(null, "Copy Paste into console to see the tank spawns", false);
	Say(null, "Tank # 1: setpos_exact -4687.500, -2125.000, 144.031", false);
	Say(null, "Tank # 2: setpos_exact-4954.078, 210.086, -436.444", false);
}

function ChatCommand_markremover(hPlayer)
{
	MarkRemover();
	Say(null, "Cleared.", false);
}

function ChatCommand_req(hPlayer)
{
	Say(null, "cvars required:", false);
	Say(null, "r_drawothermodels 2; sv_minrate 0; rate 786432", false);
}

function ChatCommand_fnlseqguide(hPlayer)
{
	Say(null, "After your movement stopped, kill the commons as soon as possible, and get the utilities needed", false);
	CreateTimer(3.00, function()
	{
		Say(null, "Wave 1 (Panic # 1) is also part of movement so, we are moving on to wave 2", false);
		CreateTimer(3.00, function()
		{
			Say(null, "Next is Wave 2 which is PAUSE#2", false);
			CreateTimer(3.00, function()
			{
				Say(null, "After Wave 2, The first tank spawn.", false);
				CreateTimer(3.00, function()
				{
					Say(null, "2 PAUSE stages have 5-7 commons to spawns but at this time, the Tank is about to spawn.", false);
					CreateTimer(3.00, function()
					{
						Say(null, "Shoot the infected after killing the tank to make the next wave spawn as soon as possible.", false);
						CreateTimer(3.00, function()
						{
							Say(null, "Tank Spawn is at PAUSE#2 and PAUSE#5, which has 5-7 infected but it doesn't bother that much, just focus on shooting the tank.", false);
						});
						CreateTimer(3.00, function()
						{
							Say(null, "Also, one last thing, Shoot the CEDA infected! It doesn't burn. GLHF!", false);
						});
					});
				});
			});
		});
	});
}

RegisterChatCommand("!practice", ChatCommand_practice, true);
RegisterChatCommand("!prac", ChatCommand_practice, true);
RegisterChatCommand("!help", ChatCommand_practice, true);