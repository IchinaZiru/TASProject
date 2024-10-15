// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(14.677); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!louis"), "小小初音");
//SetClientName(Ent("!zoey"), "");
//SetClientName(Ent("!francis"), "");
SetClientName(Ent("!bill"), "小鼻鼻");

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
	origin = Vector(5123.754, 2630.192, 48.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(2.996, 1.878, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = "smg"
			clip = 45
			ammo = 650
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "molotov" // throwable
		slot3 = "defibrillator" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c11_2louis");
		cvar("st_mr_play", Ent("!louis").GetEntityIndex());
	}
}

Survivors["bill"] <-
{
	origin = Vector(5387.106, 2676.157, 48.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.594, 38.956, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "c11_2bill");
		cvar("st_mr_play", Ent("!bill").GetEntityIndex());
	}
}

SpawnItem("vomitjar", Vector(5528.000, 2560.000, 56.933), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnTrigger("dump", Vector(5526.120, 3822.699, 49.158));
SpawnTrigger("kick", Vector(7142.484, 4589.995, 705.353));
function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area" && activator == Ent("!louis"))
		{

		}
		else if (sName == "cb"&& activator == Ent("!louis"))
		{
SpawnCommonForCB(Vector(6841.344, 3849.388, 520.031), QAngle(0.000, 203.682, 0.000));
SpawnCommon("common_worker_male01", Vector(6876.344, 3687.526, 529.253), QAngle(0.0, 153.073, 0.0));
SpawnCommon("common_female01", Vector(6901.667, 3729.617, 524.420), QAngle(0.0, 163.402, 0.0));
SpawnCommon("common_military_male01", Vector(6912.689, 3777.316, 522.782), QAngle(0.0, 173.652, 0.0));
SpawnCommon("common_military_male01", Vector(6797.132, 3740.172, 523.561), QAngle(0.0, 156.778, 0.0));
SpawnCommon("common_female01_suit", Vector(6558.129, 3518.587, 522.888), QAngle(0.0, 74.225, 0.0));
SpawnCommon("common_female01", Vector(6452.220, 3497.344, 521.509), QAngle(0.0, 58.849, 0.0));
SpawnCommon("common_military_male01", Vector(6547.292, 3576.017, 522.145), QAngle(0.0, 68.232, 0.0));
SpawnCommon("common_male01", Vector(6692.354, 3693.687, 527.041), QAngle(0.0, 114.753, 0.0));
		}
		else if (sName == "kick")
		{
			AutoKick(Ent("!louis"), Ent("!bill"));
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
SpawnCommon("common_male02", Vector(5359.081, 3568.816, 53.811), QAngle(0.000, 277.452, 0.000));
SpawnCommon("common_male02", Vector(5746.807, 3748.473, 26.317), QAngle(0.0, 283.970, 0.0));
SpawnCommon("common_military_male01", Vector(5677.919, 3366.503, 16.031), QAngle(0.0, 215.678, 0.0));
SpawnCommon("common_male01", Vector(5655.757, 3330.854, 16.031), QAngle(0.0, 210.631, 0.0));
SpawnCommon("common_female01_suit", Vector(5690.744, 3427.065, 16.031), QAngle(0.0, 224.587, 0.0));
SpawnCommon("common_military_male01", Vector(5770.884, 3715.701, 16.031), QAngle(0.0, 219.305, 0.0));
SpawnCommon("common_female01", Vector(4925.284, 3965.727, 26.316), QAngle(0.0, 294.438, 0.0));
SpawnCommon("common_female01_suit", Vector(4938.315, 3971.128, 43.025), QAngle(0.0, 317.628, 0.0));
SpawnCommon("common_military_male01", Vector(5738.374, 3416.044, 26.419), QAngle(0.0, 306.757, 0.0));
SpawnCommon("common_male01", Vector(5684.074, 4028.391, 26.424), QAngle(0.0, 286.255, 0.0));
SpawnCommon("common_male02", Vector(5740.750, 3397.832, 26.424), QAngle(0.0, 353.262, 0.0));
SpawnCommon("common_male_suit", Vector(5709.923, 4025.138, 26.493), QAngle(0.0, 99.996, 0.0));
SpawnCommon("common_military_male01", Vector(5292.012, 3135.476, 55.620), QAngle(0.0, 15.130, 0.0));
SpawnCommon("common_male02", Vector(5296.417, 3083.768, 57.118), QAngle(0.0, 209.123, 0.0));
SpawnCommon("common_military_male01", Vector(5125.000, 3665.240, 40.707), QAngle(0.0, 274.088, 0.0));
SpawnCommon("common_male_suit", Vector(5023.382, 3531.439, 26.031), QAngle(0.0, 33.027, 0.0));
SpawnCommon("common_male_suit", Vector(5713.733, 3902.885, 26.491), QAngle(0.0, 0.080, 0.0));
SpawnCommon("common_male01", Vector(5065.000, 3612.500, 26.031), QAngle(0.0, 329.885, 0.0));
SpawnCommon("common_female01", Vector(5047.854, 3894.487, 26.031), QAngle(0.0, 201.511, 0.0));
SpawnCommon("common_male01", Vector(5900.000, 3691.364, 532.353), QAngle(0.0, 254.090, 0.0));
SpawnCommon("common_military_male01", Vector(5900.000, 3696.136, 532.308), QAngle(0.0, 70.637, 0.0));
SpawnCommon("common_male01", Vector(4550.339, 3358.828, 26.031), QAngle(0.0, 218.776, 0.0));
SpawnCommon("common_male_suit", Vector(5912.500, 3750.000, 531.646), QAngle(0.0, 84.493, 0.0));
SpawnCommon("common_female01", Vector(5950.000, 3775.000, 531.837), QAngle(0.0, 217.885, 0.0));
SpawnCommon("common_worker_male01", Vector(4562.500, 3262.500, 26.031), QAngle(0.0, 189.318, 0.0));
SpawnCommon("common_military_male01", Vector(4775.000, 3287.500, 462.179), QAngle(0.0, 183.215, 0.0));
SpawnCommon("common_military_male01", Vector(4487.690, 3364.175, 26.031), QAngle(0.0, 76.092, 0.0));
SpawnCommon("common_military_male01", Vector(4871.145, 4100.000, 26.280), QAngle(0.0, 212.751, 0.0));
SpawnCommon("common_male02", Vector(4900.462, 4100.000, 26.438), QAngle(0.0, 280.639, 0.0));
SpawnCommon("common_worker_male01", Vector(5900.000, 3800.000, 531.206), QAngle(0.0, 166.568, 0.0));
SpawnCommon("common_female01", Vector(5433.516, 4002.884, 16.031), QAngle(0.0, 249.819, 0.0));
SpawnCommon("common_female01_suit", Vector(5394.686, 3975.588, 16.031), QAngle(0.0, 257.704, 0.0));


EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!louis\"), \"sm_idle\");", 10.533);
EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!louis\")), true)", 10.600);

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
