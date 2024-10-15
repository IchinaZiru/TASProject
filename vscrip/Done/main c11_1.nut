// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!louis"), "Kyubi ツ");
//SetClientName(Ent("!zoey"), "");
//SetClientName(Ent("!francis"), "");
SetClientName(Ent("!bill"), "おかゆさん");

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
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player  "f" = "setang_exact 23.181225 -91.581261 0.000000"

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
			weapon = "null"
			dual = null
			clip = null
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c11_1louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["bill"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
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
			weapon = "null"
			dual = null
			clip = null
		}
		slot2 = "" // throwable
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c11_1bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}


SpawnItem("adrenaline", Vector(4776.000, 2388.000, 92.491), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("defibrillator", Vector(4700.969, 2381.750, 92.460), QAngle(0.000, 127.485, 0.000), 1, 3.0);

SpawnTrigger("c", Vector(3986.189, 1872.705, 9.947));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "c" && activator == Ent("!louis"))
		{
SpawnCommon("common_male02", Vector(4623.033, 2505.467, 48.031), QAngle(0.0, 205.412, 0.0));
SpawnCommon("common_female01", Vector(4744.930, 2730.887, 48.031), QAngle(0.0, 263.602, 0.0));
SpawnCommon("common_male01", Vector(4676.853, 2680.619, 48.031), QAngle(0.0, 283.472, 0.0));
SpawnCommon("common_male02", Vector(4964.052, 2736.652, 56.988), QAngle(0.0, 230.880, 0.0));
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
	cvar("host_timescale", 0.25);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 2.933);
    EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 9.033);

	SpawnCommon("common_female01", Vector(6300.000, -445.747, 682.031), QAngle(0.0, 10.896, 0.0));
SpawnCommon("common_female01_suit", Vector(6301.705, -544.326, 682.031), QAngle(0.0, 73.290, 0.0));
SpawnCommon("common_male_suit", Vector(6187.500, -787.500, 732.631), QAngle(0.0, 28.128, 0.0));
SpawnCommon("common_military_male01", Vector(6145.383, -653.013, 682.031), QAngle(0.0, 320.996, 0.0));
SpawnCommon("common_male_suit", Vector(6312.776, -775.244, 682.031), QAngle(0.0, 132.776, 0.0));
SpawnCommon("common_male01", Vector(6287.500, -350.000, 686.737), QAngle(0.0, 319.139, 0.0));
SpawnCommon("common_female01_suit", Vector(6262.500, -337.500, 690.296), QAngle(0.0, 341.976, 0.0));
SpawnCommon("common_military_male01", Vector(6125.000, -787.500, 733.243), QAngle(0.0, 252.107, 0.0));
SpawnCommon("common_female01", Vector(6308.375, -655.214, 682.031), QAngle(0.0, 1.464, 0.0));
SpawnCommon("common_military_male01", Vector(6212.500, -337.500, 697.282), QAngle(0.0, 357.244, 0.0));
SpawnCommon("common_worker_male01", Vector(6237.500, -312.500, 690.067), QAngle(0.0, 111.841, 0.0));
SpawnCommon("common_male02", Vector(6175.000, -550.000, 732.665), QAngle(0.0, 57.382, 0.0));
SpawnCommon("common_male01", Vector(6200.000, -312.500, 697.871), QAngle(0.0, 66.208, 0.0));
SpawnCommon("common_female01", Vector(6200.000, -312.500, 697.871), QAngle(0.0, 204.087, 0.0));
SpawnCommon("common_female01", Vector(6162.500, -337.500, 690.472), QAngle(0.0, 97.665, 0.0));
SpawnCommon("common_worker_male01", Vector(6162.500, -337.500, 690.472), QAngle(0.0, 280.130, 0.0));
SpawnCommon("common_male01", Vector(6023.391, -673.707, 682.031), QAngle(0.0, 90.744, 0.0));
SpawnCommon("common_female01_suit", Vector(6187.500, -287.500, 690.244), QAngle(0.0, 283.183, 0.0));
SpawnCommon("common_worker_male01", Vector(6212.500, -287.500, 689.837), QAngle(0.0, 194.673, 0.0));
SpawnCommon("common_female01", Vector(6075.000, -550.000, 725.113), QAngle(0.0, 99.692, 0.0));
SpawnCommon("common_female01", Vector(6162.500, -362.500, 682.031), QAngle(0.0, 65.569, 0.0));
SpawnCommon("common_military_male01", Vector(6162.500, -262.500, 690.531), QAngle(0.0, 349.333, 0.0));
SpawnCommon("common_female01", Vector(6175.000, -1012.500, 731.149), QAngle(0.0, 293.535, 0.0));
SpawnCommon("common_military_male01", Vector(6187.500, -237.500, 682.031), QAngle(0.0, 18.662, 0.0));
SpawnCommon("common_male_suit", Vector(6112.500, -237.500, 689.824), QAngle(0.0, 341.056, 0.0));
SpawnCommon("common_female01", Vector(5920.178, -963.261, 682.031), QAngle(0.0, 294.387, 0.0));
SpawnCommon("common_military_male01", Vector(5937.217, -532.709, 682.031), QAngle(0.0, 45.012, 0.0));
SpawnCommon("common_worker_male01", Vector(6112.500, -312.500, 690.003), QAngle(0.0, 46.374, 0.0));
SpawnCommon("common_male_suit", Vector(6062.500, -287.500, 689.534), QAngle(0.0, 220.416, 0.0));
SpawnCommon("common_worker_male01", Vector(6212.500, -250.000, 682.031), QAngle(0.0, 302.439, 0.0));

//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 3.167);
//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 0.033);
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
