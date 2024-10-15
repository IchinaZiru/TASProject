// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Azure");
SetClientName(Ent("!rochelle"), "ICHINA");
SetClientName(Ent("!ellis"), "おかゆさん");
SetClientName(Ent("!nick"), "月白瞳美は俺の妻");

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
	st_edgebug = 1
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(1306.261, -4887.216, 30.730) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(12.852, 90.311, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 44
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_chrome"
			clip = 8
			ammo = 72
			
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
		cvar("st_mr_force_file", "dkr3coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(1324.969, -4491.634, -54.435) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(34.378, 118.307, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "dkr3ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(1256.031, -5306.331, 7.150) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(-0.315, 82.111, 0.000)// camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 69
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_chrome"
			clip = 8
			ammo = 72
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "molotov" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "dkr3nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
		
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(1315.439, -5241.319, 40.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(16.953, 89.444, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 28
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "dkr3rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
		//SendToServerConsole("callvote changedifficulty Easy");
 				//SendToServerConsole("sm_voteall");
	}
}
RemoveItemByName("autoshotgun");RemoveItemByName("hunting_rifle");

SpawnItem("vomitjar", Vector(3599.063, 409.156, 186.290), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(3639.000, -963.000, 0.384), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(3790.000, -811.000, 48.103), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("pain_pills", Vector(4903.000, -895.000, -11.720), QAngle(0.000, 270.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(4901.000, -1119.000, -11.720), QAngle(0.000, 270.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(3006.125, -1775.969, -11.720), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(4025.000, -898.000, -11.720), QAngle(0.000, 270.000, 0.000), 1, 3.0);

SpawnItem("pain_pills", Vector(3982.906, -2042.000, 41.584), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("upgradepack_explosive", Vector(3304.125, -1736.906, 42.783), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("shotgun_spas", Vector(1384.219, -5156.000, 76.281), QAngle(359.692, 59.854, 90.264), 5, 3.0);
SpawnItem("rifle_ak47", Vector(1382.219, -5128.000, 76.313), QAngle(0.132, 82.002, 90.000), 4, 3.0);

SpawnTrigger("ci", Vector(1324.002, -4977.320, 44.031));
SpawnTrigger("ci2", Vector(-2653.607, 3620.738, -43.739));
SpawnTrigger("zdump1", Vector(3001.428, -2193.851, -11.969));
SpawnTrigger("zdump2", Vector(3748.917, -1806.092, -11.969));
SpawnTrigger("zdump3", Vector(2974.749, -217.919, 204.031));
SpawnTrigger("zdump4", Vector(428.601, 1268.198, 28.031));
SpawnTrigger("trigger_area1", Vector(3572.310, 236.453, 163.032));
SpawnTrigger("zdump23", Vector(1996.076, -547.787, -26.842));

SpawnTrigger("vote", Vector(-3903.977, 5735.610, -101.968));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "ci"  && activator == Ent("!nick"))
		{
			SpawnCommon("common_female_tankTop_jeans",  Vector(1285.939, -3078.443, -63.969), QAngle(0.000, 100.645, 0.000));
		}
		else if (sName == "ci2"  && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_tankTop_jeans", Vector(-3138.836, 4645.834, -27.969), QAngle(0.000, 122.024, 0.000));
			//SpawnZombie("witch", Vector(-3411.450, 4253.869, 219.255),  QAngle(0.000, 328.527, 0.000));
			SpawnZombie("witch", Vector(-3403.748, 4493.489, 89.688),  QAngle(0.000, 328.527, 0.000));
		}
		else if (sName == "zdump1" && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(3896.249, -1479.754, -11.969), QAngle(-0.000, 254.526, 0.000));
			SpawnCommon("common_female_tshirt_skirt", Vector(3968.584, -1490.621, -11.969), QAngle(-0.000, 236.470, 0.000));
		}
		else if (sName == "trigger_area2" && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(4630.982, -986.074, -11.983), QAngle(1.041, 248.334, 0.000));
			SpawnCommon("common_male_dressShirt_jeans", Vector(4439.478, -1030.656, -43.969), QAngle(353.433, 292.095, 0.000));
			SpawnCommon("common_male_tshirt_cargos", Vector(4346.981, -1047.052, -11.969), QAngle(1.089, 312.043, 0.000));
			SpawnCommon("common_female_tshirt_skirt", Vector(4332.775, -1081.537, -11.969), QAngle(1.145, 319.613, 0.000));
			SpawnCommon("common_female_tshirt_skirt", Vector(4437.150, -1166.327, -43.969), QAngle(350.757, 325.211, 0.000));
			SpawnCommon("common_female_tankTop_jeans", Vector(4358.804, -1384.938, -38.192), QAngle(-0.000, 16.068, 0.000));
			SpawnCommon("common_male_tankTop_jeans", Vector(4271.558, -1444.402, -27.969), QAngle(8.639, 271.358, 0.000));
		}
		else if (sName == "zdump3" && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(2689.779, -409.443, -11.969), QAngle(0.0, 355.726, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2628.300, -493.182, -27.969), QAngle(0.0, 4.005, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2330.395, -798.192, -11.983), QAngle(0.0, 40.433, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(2414.673, -813.995, -11.983), QAngle(0.0, 144.197, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(2379.860, -770.681, -11.983), QAngle(0.0, 144.197, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2237.279, -793.262, -11.983), QAngle(0.0, 30.893, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2130.659, -469.544, -11.969), QAngle(0.0, 265.324, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2202.692, -496.197, -11.969), QAngle(0.0, 241.196, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2097.191, -504.560, -30.035), QAngle(0.0, 95.662, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1818.031, -195.143, -11.969), QAngle(0.0, 298.835, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1818.031, -257.956, -11.969), QAngle(0.0, 305.142, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1847.801, -267.848, -27.969), QAngle(0.0, 300.885, 0.0));
		}
		else if (sName == "zdump4" && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(-776.349, 1638.816, -99.969), QAngle(0.0, 318.684, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-644.713, 1697.015, -99.969), QAngle(0.0, 318.684, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-478.237, 1549.072, -99.969), QAngle(0.0, 318.684, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-801.285, 1556.202, -99.969), QAngle(0.0, 318.684, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-861.631, 1048.606, -99.969), QAngle(0.0, 26.336, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-667.639, 1089.492, -99.969), QAngle(0.0, 35.088, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-507.945, 1123.170, -99.969), QAngle(0.0, 55.273, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-525.147, 938.653, -99.969), QAngle(0.0, 69.939, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-1414.204, 1775.470, -92.032), QAngle(0.0, 303.308, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1578.263, 1680.973, -99.969), QAngle(0.0, 323.020, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1510.980, 1647.065, -99.969), QAngle(0.0, 321.443, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-1070.413, 1799.163, -99.969), QAngle(0.0, 262.465, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-1145.860, 1567.403, -99.969), QAngle(0.0, 273.898, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1336.861, 1673.346, -99.969), QAngle(0.0, 302.047, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1295.071, 1575.652, -99.969), QAngle(0.0, 305.358, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-1272.954, 1727.066, -99.969), QAngle(0.0, 290.377, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-1604.948, 1034.511, -99.969), QAngle(0.0, 33.116, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-1565.917, 1024.578, -99.969), QAngle(0.0, 34.693, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-1171.333, 1057.086, -99.969), QAngle(0.0, 81.923, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-1259.902, 879.888, -99.969), QAngle(0.0, 74.433, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-1112.277, 1045.011, -99.969), QAngle(0.0, 93.514, 0.0));
		}
		else if (sName == "trigger_area1" && activator == Ent("!nick"))
		{
		SendToServerConsole("ent_remove_all infected");
		}
		else if (sName == "zdump23" && activator == Ent("!nick"))
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(883.576, 293.763, -11.969), QAngle(0.0, 335.857, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(724.618, 174.083, -41.769), QAngle(0.0, 1.978, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(986.145, 178.850, -43.969), QAngle(0.0, 352.358, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(907.391, 264.681, -26.483), QAngle(0.0, 342.266, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1098.164, 28.623, -11.983), QAngle(0.0, 34.556, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1138.684, 42.079, -11.983), QAngle(0.0, 4.233, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1104.348, 62.766, -11.983), QAngle(0.0, 6.374, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(973.679, 465.861, -3.969), QAngle(0.0, 311.196, 0.0));
 
		}
		else if (sName == "vote"  && activator == Ent("!rochelle"))
		{
			SendToServerConsole("callvote changedifficulty Easy");
 					SendToServerConsole("sm_voteall");
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);OpenSafeRoomDoor();

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 9.556);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 15.633);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 9.556);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 15.633);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 15.167);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 15.733);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 47.033);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 48.000);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 41.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 47.333);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 41.677);
 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 47.400);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 47.900);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 47.810);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 63.000);
 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 69.300);

 SpawnCommon("common_male_tshirt_cargos", Vector(1233.054, -3384.598, -15.969), QAngle(0.0, 73.353, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1453.414, -3097.721, -63.969), QAngle(0.0, 224.426, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1426.377, -3190.232, -63.969), QAngle(0.0, 120.347, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1204.483, -2988.361, -63.969), QAngle(0.0, 324.542, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1233.054, -3384.598, -15.969), QAngle(0.0, 73.353, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1453.414, -3097.721, -63.969), QAngle(0.0, 224.426, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1426.377, -3190.232, -63.969), QAngle(0.0, 120.347, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1204.483, -2988.361, -63.969), QAngle(0.0, 324.542, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1328.806, -2212.462, -15.969), QAngle(0.0, 298.680, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1457.793, -2071.291, -15.969), QAngle(0.0, 274.159, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1458.363, -2153.093, -15.969), QAngle(0.0, 275.026, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1275.988, -2407.368, -33.229), QAngle(0.0, 335.187, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1831.627, -2504.538, 0.031), QAngle(0.0, 180.251, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1502.933, -2617.730, -9.969), QAngle(0.0, 331.481, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1575.966, -2548.125, -11.969), QAngle(0.0, 331.481, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1568.606, -2593.882, -11.969), QAngle(0.0, 331.481, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1603.704, -2425.701, -11.969), QAngle(0.0, 331.481, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1741.786, -2235.694, -11.969), QAngle(0.0, 236.706, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1515.028, -2562.095, -11.969), QAngle(0.0, 190.679, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1672.893, -1786.080, -11.969), QAngle(0.0, 269.902, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1654.155, -1820.178, -11.969), QAngle(0.0, 273.924, 0.0));

	
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
