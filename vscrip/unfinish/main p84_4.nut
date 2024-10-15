// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!louis"), "");
//SetClientName(Ent("!zoey"), "");
//SetClientName(Ent("!francis"), "");
//SetClientName(Ent("!bill"), "");

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

Survivors["louis"] <- // make sure that the character name is in lowercase
{
	origin = Vector(21.581, 87.690, 3.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.050, -115.444, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 99
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
			ammo = 27
			
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
		cvar("st_mr_force_file", "louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["francis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(-12.742, 56.361, 3.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(3.548, -103.932, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 89
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 0
			ammo = 27
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 14
		}
		slot2 = "vomitjar" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "francis");
		cvar("st_mr_play", Ent("!francis").GetEntityIndex());
	}
}

Survivors["bill"] <-
{
	origin = Vector(-24.237, 108.992, 3.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.315, -101.152, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "" // throwable
		slot3 = "defibrillator" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

Survivors["zoey"] <-
{
	origin = Vector(-88.995, -26.938, 3.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(5.914, -70.263, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "zoey");
		cvar("st_mr_play", Ent("!zoey").GetEntityIndex());
	}
}
 RemoveItemByName("pistol");
//SpawnItem("gascan_scavenge", Vector(-307.733, 1181.949, 232.599), QAngle(90.000, -133.437, 180.000), -1);
//SpawnItem("gascan_scavenge", Vector(1162.451, 2552.300, 327.947), QAngle(0.409, 46.794, 0.000), -1);
SpawnItem("sniper_military", Vector(-6.000, -427.000, 3.906), QAngle(360.000, 214.497, 90.264), 5, 3.0);

SpawnTrigger("zdump", Vector(-597.495, -177.303, 213.031));
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "zdump" && activator == Ent("!francis"))
		{
SpawnCommon("common_male_tshirt_cargos", Vector(-731.384, 483.990, 228.031), QAngle(-0.000, 266.327, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(-697.612, 416.159, 228.031), QAngle(-0.000, 253.632, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(-711.931, 335.817, 228.031), QAngle(-0.000, 276.814, 0.000));
SpawnCommon("common_male_tshirt_cargos", Vector(-804.067, 359.833, 228.031), QAngle(-0.000, 297.708, 0.000));
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
	cvar("host_timescale", 0.25);OpenSafeRoomDoor();

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!bill\"), \"sm_idle\");", 5.000);
//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!bill\")), true)", 0.033);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!zoey\"), \"sm_idle\");", 5.133);
//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!zoey\")), true)", 0.033);

EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 10.533);
//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 0.033);

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
