// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Kyubi ツ");
SetClientName(Ent("!rochelle"), "so-so");
SetClientName(Ent("!ellis"), "月白瞳美は俺の妻");
SetClientName(Ent("!nick"), "im real");

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
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch1coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch1ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch1nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ch1rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("defibrillator", Vector(1518.750, 3116.000, -731.103), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(933.031, 3564.156, -723.750), QAngle(0.483, 359.868, 357.891), 1, 3.0);
SpawnItem("pumpshotgun", Vector(957.031, 3547.281, -727.844), QAngle(359.912, 197.314, 88.110), 5, 3.0);

SpawnItem("vomitjar", Vector(3800.063, -2263.063, -730.741), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(3802.906, -2248.813, -762.772), QAngle(0.000, 42.979, 0.000), 1, 3.0);
SpawnItem("adrenaline", Vector(3804.938, -2231.563, -735.478), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(1301.938, -2231.563, -731.036), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(1297.063, -2263.063, -730.741), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(1299.906, -2248.813, -763.067), QAngle(0.000, 42.979, 0.000), 1, 3.0);

SpawnTrigger("cb1", Vector(-1049.675, 5509.462, -767.173));
SpawnTrigger("zdump1", Vector(927.961, -3255.378, -812.450));
SpawnTrigger("zdump",  Vector(878.026, -5285.146, -960.938));
SpawnTrigger("zdump2", Vector(-3510.259, 8976.822, -307.104));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb1")
		{			
SpawnCommonForCB(Vector(-1602.451, 7539.139, -767.272), QAngle(-0.000, 277.966, 0.000));

SpawnCommon("common_female_tshirt_skirt", Vector(-1716.337, 7453.539, -767.272), QAngle(-0.000, 340.808, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(-1716.337, 7453.539, -767.272), QAngle(-0.000, 340.808, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(-1425.304, 7270.736, -769.562), QAngle(359.528, 145.344, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(-1386.273, 7281.842, -770.969), QAngle(359.183, 148.971, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(-1320.012, 7327.917, -770.969), QAngle(359.297, 163.006, 0.000));
		}
		else if (sName == "zdump1"&& activator == Ent("!rochelle"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(800.701, -1442.771, -769.967), QAngle(0.0, 311.185, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(909.199, -1724.871, -767.272), QAngle(0.0, 338.387, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1410.632, -1778.434, -755.672), QAngle(0.0, 185.974, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(799.559, -1280.004, -770.390), QAngle(0.0, 311.894, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(800.545, -1341.388, -766.865), QAngle(0.0, 47.143, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1341.557, -1745.212, -762.454), QAngle(0.0, 232.750, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1312.769, -1830.973, -763.892), QAngle(0.0, 226.994, 0.0));
		}
		else if (sName == "zdump2"&& activator == Ent("!rochelle"))
		{
			SpawnZombie("boomer", Vector(-4704.607, 9231.860, -390.969));
		}
		else if (sName == "zdump"&& activator == Ent("!rochelle"))
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(1358.679, -3817.687, -892.324), QAngle(0.0, 240.722, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1105.219, -4023.401, -889.696), QAngle(0.0, 252.628, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(993.343, -4272.480, -937.208), QAngle(0.0, 258.542, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1368.411, -4184.317, -919.308), QAngle(0.0, 220.537, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1321.316, -4276.401, -909.672), QAngle(0.0, 217.935, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1177.418, -4364.547, -906.268), QAngle(0.0, 221.247, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1319.416, -4079.702, -932.628), QAngle(0.0, 232.207, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(1053.841, -4392.393, -900.207), QAngle(0.0, 236.859, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1212.996, -4216.933, -934.891), QAngle(0.0, 232.207, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1205.664, -4457.611, -854.873), QAngle(0.0, 204.137, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1028.077, -3978.609, -881.218), QAngle(0.0, 260.829, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(659.772, -3634.190, -837.159), QAngle(0.0, 285.981, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(663.898, -3772.014, -855.226), QAngle(0.0, 288.268, 0.0));
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
	cvar("host_timescale", 0.5);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 33.833);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 33.067);
	 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 33.833);
	 EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 39.167);

	SpawnCommon("common_female_tankTop_jeans", Vector(579.888, -6059.816, -988.969), QAngle(0.0, 326.433, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(586.431, -6086.458, -988.969), QAngle(0.0, 326.433, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1245.160, -6140.194, -931.586), QAngle(0.0, 186.162, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1363.512, -6063.944, -899.246), QAngle(0.0, 191.997, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1350.364, -5619.124, -917.694), QAngle(0.0, 224.009, 0.0)); 
	
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
