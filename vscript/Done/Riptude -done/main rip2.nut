// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "EunwooCC=ez lol why mad?");
SetClientName(Ent("!rochelle"), "月白瞳美は俺の妻");
SetClientName(Ent("!ellis"), "ICHINA");
SetClientName(Ent("!nick"), "Kyubi ツ");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Impossible"

	director_no_bosses = 1
	director_no_mobs = 0
	director_no_specials = 1

	god = 0
	z_common_limit = 0
	sv_infinite_ammo = 0
	host_timescale = 1.0

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
    
	st_fastreload = 0
	st_edgebug = 0
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-12581.999, 11320.438, 20.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(83.717, -2.527, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 94
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 67
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip2_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(-12584.485, 11322.838, 20.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.437, 9.513, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 93
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 66
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 9
		}
		slot2 = "" // throwable
		slot3 = "upgradepack_explosive" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip2_ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(-12584.485, 11322.838, 20.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.437, 9.513, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 94
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 70
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip2_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-12674.983, 11127.204, 20.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(9.994, 57.042, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot1"
		slot0 = // primary weapon
		{
			weapon = ""
			clip = null
			ammo = null
			
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
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip2_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
 RemoveItemByName("golfclub");  RemoveItemByName("knife"); RemoveItemByName("cricket_bat"); RemoveItemByName("shovel");  RemoveItemByName("tonfa");
 RemoveItemByName("frying_pan");RemoveItemByName("pitchfork");RemoveItemByName("baseball_bat");RemoveItemByName("katana");RemoveItemByName("electric_guitar");RemoveItemByName("fireaxe");
 RemoveItemByName("machete");RemoveItemByName("crowbar");RemoveItemByName("gascan");RemoveItemByName("propanetank");

SpawnItem("grenade_launcher", Vector(-9632.906, 12100.594, 52.107), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(-9580.219, 12205.438, 22.156), QAngle(54.844, 11.733, 270.220), 1, 3.0);
SpawnItem("pain_pills", Vector(-9276.875, 11841.750, 50.438), QAngle(1.099, 359.912, 3.516), 1, 3.0);
SpawnItem("pain_pills", Vector(-9278.031, 11822.750, 50.438), QAngle(1.099, 359.912, 3.560), 1, 3.0);
SpawnItem("molotov", Vector(-8380.156, 12115.719, 17.344), QAngle(358.550, 359.824, 358.198), 1, 3.0);
SpawnItem("pain_pills", Vector(-8347.969, 12109.781, 12.500), QAngle(0.967, 359.736, 3.164), 1, 3.0);
SpawnItem("vomitjar", Vector(-7915.688, 11357.906, 57.259), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("defibrillator", Vector(-7566.781, 11353.406, 52.491), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(-9346.500, 11766.375, 22.156), QAngle(56.514, 173.188, 270.220), 1, 3.0);

SpawnItem("molotov", Vector(-13060.563, 12857.469, -1293.688), QAngle(0.176, 359.868, 359.121), 1, 3.0);

SpawnItem("pumpshotgun", Vector(-12598.000, 11118.000, 51.000), QAngle(0.000, 104.985, 90.000), 5, 3.0);
SpawnItem("hunting_rifle", Vector(-12587.000, 11144.000, 51.063), QAngle(0.000, 81.475, 86.001), 4, 3.0);
SpawnItem("smg", Vector(-12601.000, 11176.000, 51.000), QAngle(0.000, 45.000, 90.000), 5, 3.0);
SpawnItem("pistol_magnum", Vector(-12585.250, 11455.219, 45.938), QAngle(0.000, 89.692, 76.641), 5, 3.0);


SpawnTrigger("cb1", Vector(-12481.722, 11307.123, 20.031));
SpawnTrigger("cb2", Vector(-12904.750, 11394.461, -1339.969));
SpawnTrigger("zdump1", Vector(-10065.734, 11407.290, 20.031));
SpawnTrigger("zdump2", Vector(-8861.969, 12696.969, -1027.969));
SpawnTrigger("clear", Vector(-8665.969, 12737.031, -115.969));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb1" && activator == Ent("!nick"))
		{
			SpawnCommonForCB(Vector(-11864.555, 11234.495, 20.031), QAngle(0.000, 180.047, 0.000));
		}
		else if (sName == "cb2" && activator == Ent("!rochelle"))
		{
			SpawnCommonForCB(Vector(-13257.542, 11694.509, -1339.969), QAngle(-0.000, 270.427, 0.000));
			SendToServerConsole("callvote changedifficulty Easy");
			 SendToServerConsole("sm_voteall");
SpawnCommon("common_female_tshirt_skirt", Vector(-8745.063, 12817.442, -1019.969), QAngle(0.0, 195.438, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-9038.146, 13024.913, -1019.969), QAngle(0.0, 257.807, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-13174.908, 12343.663, -1339.969), QAngle(0.0, 235.650, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-13322.774, 12984.229, -1339.969), QAngle(0.0, 276.099, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-13336.191, 12809.727, -1339.969), QAngle(0.0, 281.382, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-13438.668, 12664.943, -1339.969), QAngle(0.0, 311.265, 0.0));
		}
		else if (sName == "zdump1" && activator == Ent("!nick"))
		{
SpawnCommon("common_female_tshirt_skirt", Vector(-8693.263, 11674.107, 20.031), QAngle(0.0, 152.127, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-8735.337, 11623.623, 20.031), QAngle(0.0, 152.127, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-8988.265, 11652.464, 20.031), QAngle(0.0, 94.174, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8304.227, 12018.196, -19.969), QAngle(0.0, 197.622, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-8431.370, 11982.354, -19.969), QAngle(0.0, 198.411, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8337.183, 12392.983, -11.205), QAngle(0.0, 232.394, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-8790.881, 12285.169, -19.969), QAngle(0.0, 278.599, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-7996.153, 11508.903, 20.031), QAngle(0.0, 152.994, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8327.128, 11636.783, 20.031), QAngle(0.0, 148.579, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-7611.736, 11708.346, 20.031), QAngle(0.0, 160.800, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-7251.745, 12317.691, 20.031), QAngle(0.0, 205.192, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-7273.616, 12208.748, 20.031), QAngle(0.0, 200.303, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-7815.843, 12444.611, -19.969), QAngle(0.0, 240.121, 0.0));
		}
		else if (sName == "clear" && activator == Ent("!nick"))
		{
			SendToServerConsole("ent_remove_all infected");
		}
		else if (sName == "zdump2" && activator == Ent("!ellis"))
		{
SpawnCommon("common_female_tankTop_jeans", Vector(-9387.694, 13108.338, -1083.969), QAngle(0.0, 305.983, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-9397.719, 12993.010, -1083.969), QAngle(0.0, 316.864, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-9363.777, 13300.780, -1083.969), QAngle(0.0, 293.998, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8812.629, 12975.976, -1019.969), QAngle(0.0, 221.458, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-8745.063, 12817.442, -1019.969), QAngle(0.0, 195.438, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-9038.146, 13024.913, -1019.969), QAngle(0.0, 257.807, 0.0));
		}
		else if (sName == "trigger_area2")
		{

		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
		else if (sName == "trigger_area2")
		{
			
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5); OpenSafeRoomDoor();

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 15.133);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 21.233);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 43.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 49.155);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 10.033);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 17.633);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 21.333);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 23.555);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 17.455);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 23.533);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 20.455);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 23.555);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 43.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 49.155);
 
SpawnCommon("common_male_tankTop_jeans", Vector(-10802.314, 10943.207, 20.031), QAngle(0.0, 147.160, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-10865.938, 10943.116, 20.031), QAngle(0.0, 143.849, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-10570.710, 11492.560, 20.031), QAngle(0.0, 194.154, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-11024.349, 11436.687, 20.031), QAngle(0.0, 203.379, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-11203.158, 11122.901, 20.031), QAngle(0.0, 130.129, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-11569.923, 11481.548, 20.031), QAngle(0.0, 319.975, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-11458.337, 11486.762, 20.031), QAngle(0.0, 299.790, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-11554.528, 11099.451, 20.031), QAngle(0.0, 43.790, 0.0));

}

function OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function OnFinaleStart() // do some stuff when a finale event has been started
{

}

function OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function OnBeginCustomStage(iNum, iType)
{
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	if (iType == PANIC)
	{

	}
	else if (iType == TANK)
	{

	}
	else if (iType == DELAY)
	{

	}
}
