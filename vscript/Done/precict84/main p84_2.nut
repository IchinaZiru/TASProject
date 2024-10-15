// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(31.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!louis"), "so-so");
SetClientName(Ent("!zoey"), "おかゆさん");
SetClientName(Ent("!bill"), "Reimu");
SetClientName(Ent("!francis"), "小鼻鼻");

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
    
	st_fastreload = 1
	st_edgebug = 1
	
};

Survivors <- {}; // characters customization

Survivors["louis"] <- // make sure that the character name is in lowercase
{
	origin = Vector(498.035, -123.481, -71.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.444, -73.890, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_2louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["francis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(564.331, -99.118, -71.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(1.814, -81.754, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 60
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
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_2francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
	}
}

Survivors["bill"] <-
{
	origin = Vector(524.433, -144.826, -71.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.631, -81.799, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 88
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
		slot2 = "molotov" // throwable
		slot3 = "" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_2bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

Survivors["zoey"] <-
{
	origin = Vector(535.694, -111.221, -71.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.838, -77.733, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
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
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "p84_2zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
	}
}
 RemoveItemByName("propanetank");

SpawnItem("pumpshotgun", Vector(427.688, -230.813, -56.594), QAngle(272.988, 0.000, 0.000), 3, 3.0);
SpawnItem("vomitjar", Vector(-1153.438, -618.906, -37.522), QAngle(0.000, 268.506, 0.000), 1, 3.0); //heya
SpawnItem("vomitjar", Vector(-1134.313, -632.688, -37.522), QAngle(0.000, 268.506, 0.000), 1, 3.0); //heya
SpawnItem("grenade_launcher", Vector(-1130.000, -663.000, -39.188), QAngle(0.000, 300.015, 88.506), 1, 3.0); //heya
SpawnItem("grenade_launcher", Vector(-3522.000, 1004.000, 302.000), QAngle(3.516, 218.716, 271.494), 1, 3.0);

SpawnItem("vomitjar", Vector(534.156, -797.094, -33.772), QAngle(0.000, 268.506, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(740.000, -845.000, -40.772), QAngle(0.000, 268.506, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(550.000, -793.000, -38.500), QAngle(0.000, 27.510, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(463.156, -799.469, -38.509), QAngle(0.000, 268.506, 0.000), 1, 3.0);
SpawnItem("defibrillator", Vector(488.750, -792.844, -38.540), QAngle(0.000, 268.506, 0.000), 1, 3.0);

SpawnItem("pipe_bomb", Vector(600.000, -653.000, -39.000), QAngle(0.000, 43.506, 88.989), 1, 3.0);
SpawnItem("molotov", Vector(-3401.719, 170.219, 355.688), QAngle(0.000, 0.000, 0.000), 1, 3.0);


SpawnItem("gascan_scavenge", Vector(-4350.563, -241.188, 333.906), QAngle(359.868, 268.374, 359.912), -1, 3.0);
SpawnItem("molotov", Vector(-4224.000, -319.000, 334.000), QAngle(0.000, 315.000, 0.000), 1, 3.0);
SpawnItem("gascan_scavenge", Vector(-1178.313, -1788.531, 434.844), QAngle(0.132, 268.330, 359.956), -1, 3.0);
SpawnItem("gascan_scavenge", Vector(-4123.438, 1047.813, -68.188), QAngle(359.736, 268.550, 359.956), -1, 3.0);

SpawnTrigger("door", Vector(611.910, -436.324, -71.969));
SpawnTrigger("boomer", Vector(-8288.164, 1641.184, -37.969));
SpawnTrigger("vote", Vector(-7494.753, 3497.714, -46.969));

SpawnTrigger("zdump1", Vector(-6346.467, 1382.783, -62.969));
SpawnTrigger("zdump2", Vector(-4338.313, 962.050, 538.031));
SpawnTrigger("zdump3", Vector(-8248.031, 1732.988, -37.969));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "door" && activator == Ent("!louis"))
		{
			OpenSafeRoomDoor();
		}
		else if (sName == "boomer")
		{
			SpawnZombie("boomer", Vector(-8135.147, 2106.392, -37.969));
		}
		else if (sName == "vote")
		{
			SendToServerConsole("callvote changedifficulty Easy");
 				SendToServerConsole("sm_voteall");
		}
		else if (sName == "zdump1")
		{		
SpawnCommon("common_male_tankTop_jeans", Vector(-6993.761, 981.935, -78.969), QAngle(359.996, 38.469, 0.000));
SpawnCommon("common_male_tankTop_jeans", Vector(-6879.108, 984.435, -78.969), QAngle(359.994, 51.164, 0.000));
		}
		else if (sName == "zdump2")
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(-4950.885, 2222.080, -78.712), QAngle(0.0, 311.697, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-4859.039, 2141.430, -85.969), QAngle(0.0, 310.278, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-5438.155, 2188.969, -77.969), QAngle(0.0, 332.355, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-4913.633, 2049.476, -85.969), QAngle(0.0, 320.370, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-5043.590, 1346.848, -99.956), QAngle(0.0, 30.230, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-4964.638, 1378.052, -100.969), QAngle(0.0, 31.491, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-5472.163, 1179.087, -45.877), QAngle(0.0, 40.322, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-5407.201, 982.981, -85.969), QAngle(0.0, 50.572, 0.0));
		}
		else if (sName == "zdump3")
		{
		}
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.5);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!francis\"), \"sm_idle\");", 8.567);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!francis\")), true)", 15.167);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 14.867);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 21.033);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 14.867);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 21.033);

	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 40.567);
    //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 21.033);
	
	SpawnCommon("common_male_dressShirt_jeans", Vector(-256.969, -94.130, -77.969), QAngle(0.0, 317.473, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(52.846, -178.007, -82.742), QAngle(0.0, 299.890, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(151.017, -145.406, -84.145), QAngle(0.0, 287.668, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4.034, -306.469, -81.969), QAngle(0.0, 315.501, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-306.572, -247.003, -78.969), QAngle(0.0, 329.536, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-386.657, -1877.482, -81.869), QAngle(0.0, 59.581, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-314.444, -1803.735, -83.815), QAngle(0.0, 61.473, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(107.535, -1892.260, -84.969), QAngle(0.0, 94.668, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(21.239, -1659.959, -84.532), QAngle(0.0, 87.257, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(321.292, -2300.594, -78.969), QAngle(0.0, 103.342, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-256.969, -634.030, -77.969), QAngle(0.0, 1.155, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-297.393, -1586.956, -78.969), QAngle(0.0, 54.535, 0.0));
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
