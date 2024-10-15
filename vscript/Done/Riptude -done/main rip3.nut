// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Kyubi ツ");
SetClientName(Ent("!rochelle"), "EunwooCC=ez lol why mad?");
SetClientName(Ent("!ellis"), "ICHINA");
SetClientName(Ent("!nick"), "月白瞳美は俺の妻");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

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
	origin = Vector(4410.387, 3552.496, -127.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(-11.196, -1.601, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = "hunting_rifle"
			clip = 15
			ammo = 135
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 8
		}
		slot2 = "molotov" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip3_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(4336.312, 3522.331, -127.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.760, 89.339, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "rip3_ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(4410.387, 3552.496, -127.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(-11.196, -1.601, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = "grenade_launcher"
			clip = 1
			ammo = 30
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "vomitjar" // throwable
		slot3 = "defibrillator" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip3_nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(4375.675, 3609.222, -127.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(1.340, 123.671, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 90
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "hunting_rifle"
			clip = 15
			ammo = 150
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol_magnum"
			dual = false
			clip = 7
		}
		slot2 = "molotov" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rip3_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
SpawnItem("shotgun_spas", Vector(4307.000, 3464.000, -96.969), QAngle(359.912, 98.481, 269.868), 5, 3.0);
SpawnItem("autoshotgun", Vector(4309.000, 3508.000, -96.000), QAngle(0.000, 280.503, 90.000), 5, 3.0);

SpawnTrigger("vote", Vector(4690.438, 4263.260, -102.113));
SpawnTrigger("zdump", Vector(4647.703, 4219.835, -167.969));
SpawnTrigger("zdump2", Vector(9004.647, 5145.583, 88.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "vote" && activator == Ent("!rochelle"))
		{
			SendToServerConsole("callvote changedifficulty Impossible");
 				SendToServerConsole("sm_voteall");
		}
		else if (sName == "zdump" && activator == Ent("!rochelle"))
		{
SpawnCommon("common_female_tankTop_jeans", Vector(5812.755, 4935.458, 88.031), QAngle(0.0, 47.073, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(5854.091, 4961.206, 88.031), QAngle(0.0, 49.281, 0.0));
SpawnCommon("common_male_biker", Vector(5995.309, 5367.053, 88.031), QAngle(0.0, 295.582, 0.0));
SpawnCommon("common_male_fallen_survivor", Vector(6437.553, 5375.177, 88.031), QAngle(0.0, 203.961, 0.0));
SpawnCommon("common_male_biker", Vector(6429.590, 4974.726, 88.031), QAngle(0.0, 146.638, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(6368.024, 4978.492, 88.031), QAngle(0.0, 141.986, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(5959.917, 5355.625, 88.031), QAngle(0.0, 307.331, 0.0));
		}
		else if (sName == "zdump2" && activator == Ent("!rochelle"))
		{
SpawnCommon("common_male_fallen_survivor", Vector(6437.553, 5375.177, 88.031), QAngle(0.0, 203.961, 0.0));
SpawnCommon("common_male_ceda", Vector(9720.285, 6084.757, 88.031), QAngle(0.0, 307.036, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9737.029, 6008.874, 88.031), QAngle(0.0, 315.867, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(9681.741, 6227.210, 88.031), QAngle(0.0, 20.049, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(9738.167, 6211.512, 88.031), QAngle(0.0, 106.388, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(10204.854, 6276.596, 88.031), QAngle(0.0, 221.191, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9693.756, 6600.414, 88.031), QAngle(0.0, 302.325, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9770.127, 6499.919, 88.031), QAngle(0.0, 300.985, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(10304.646, 6016.534, 88.031), QAngle(0.0, 163.553, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(10283.213, 6047.210, 88.031), QAngle(0.0, 163.237, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(10280.558, 6858.887, 88.031), QAngle(0.0, 250.128, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(10269.844, 6737.683, 88.031), QAngle(0.0, 247.526, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(10269.301, 6979.262, 88.031), QAngle(0.0, 253.360, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9809.892, 6661.512, 88.031), QAngle(0.0, 323.693, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(9716.260, 6968.567, 88.031), QAngle(0.0, 306.031, 0.0));
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

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 11.233);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 17.755);

	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 14.600);
 	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 14.688);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 13.160);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 13.233);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 17.555);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 17.800);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 17.555);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 17.800);
	 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 7.533);
 	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 14.655);
	 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 13.200);
	
SpawnZombie("witch", Vector(9637.500, 12337.500, 290.031), QAngle(0.000, 21.950, 0.000));
	
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
