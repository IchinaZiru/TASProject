// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "Ilya");
SetClientName(Ent("!rochelle"), "DXSamXD");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	director_no_bosses = 1
	director_no_mobs = 1
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
	st_idle_anytime = 1
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(892.010, 3760.000, 93.406) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.516, -13.395, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = ""
			dual = false
			clip = null
		}
		
		//slot2 = "" // throwable
		//slot3 = "" // medkit/defib
		//slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c6m1_coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}


Survivors["rochelle"] <-
{
	origin = Vector(936.000, 3760.000, 94.030) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(20.974, 174.586, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			weapon = ""
			dual = false
			clip = null
		}
		//slot2 = "" // throwable
		//slot3 = "" // medkit/defib
		//slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "c6m1_rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("molotov", Vector(3126.969, 2590.500, 205.094), QAngle(0.000, 0.000, 359.780), 1, 3.0);
SpawnItem("pain_pills", Vector(3109.781, 2590.406, 200.500), QAngle(1.890, 359.824, 6.108), 1, 3.0);
SpawnItem("pain_pills", Vector(3187.469, 1957.844, 237.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("grenade_launcher", Vector(3153.844, 2273.781, 201.875), QAngle(1.758, 0.044, 359.341), 5, 5.0);

SpawnItem("vomitjar", Vector(2387.750, 1295.438, 517.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(582.750, 1475.500, 517.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("vomitjar", Vector(551.219, 1504.875, 517.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("pistol_magnum", Vector(-4082.281, 1469.969, 766.000), QAngle(0.000, 30.015, 270.000), 5, 3.0);
SpawnItem("shotgun_chrome", Vector(-4104.281, 1474.969, 766.781), QAngle(0.000, 194.985, 90.000), 5, 3.0);

SpawnTrigger("idle", Vector(1531.862, 1070.129, 530.015));
SpawnTrigger("timescale", Vector(3920.597, 2012.455, 200.031));
SpawnTrigger("zdump", Vector(-1209.313, 403.519, 1264.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "idle")
		{
         ST_Idle(Ent("!rochelle"));
		}
		else if (sName == "timescale" && activator == Ent("!coach"))
		{
		cvar("host_timescale", 0.5);
		}
		else if (sName == "zdump" && activator == Ent("!rochelle"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(-3732.651, 500.474, 703.314), QAngle(0.0, 355.641, 0.0));
SpawnCommon("common_male_fallen_survivor", Vector(-3741.268, 107.934, 702.923), QAngle(0.0, 269.937, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-3239.094, 713.285, 704.031), QAngle(0.0, 289.669, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-3504.593, 492.898, 704.573), QAngle(0.0, 104.081, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-3808.479, 913.416, 704.031), QAngle(0.0, 318.469, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-3582.077, 1337.637, 704.204), QAngle(0.0, 237.334, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-3474.586, 1175.326, 704.031), QAngle(0.0, 175.754, 0.0));
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
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 20.633);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 20.400);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 26.668);
	
	SpawnCommon("common_male_dressShirt_jeans", Vector(1303.940, 3260.706, 8.031), QAngle(0.0, 137.822, 0.0));
SpawnCommon("common_male_fallen_survivor", Vector(1316.490, 3556.410, 8.031), QAngle(0.0, 242.374, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1365.390, 3392.921, 8.031), QAngle(0.0, 195.617, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1305.290, 3443.746, 8.031), QAngle(0.0, 224.239, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1573.499, 3264.165, 8.031), QAngle(0.0, 219.508, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1534.237, 3303.191, 8.031), QAngle(0.0, 250.890, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1583.183, 3609.698, 8.031), QAngle(0.0, 258.380, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1858.938, 3440.504, 8.031), QAngle(0.0, 213.437, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2087.428, 3353.677, 8.031), QAngle(0.0, 194.356, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2037.728, 3305.193, 8.031), QAngle(0.0, 190.729, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2000.792, 3322.722, 8.031), QAngle(0.0, 193.410, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1645.431, 3425.878, 8.031), QAngle(0.0, 236.776, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1311.374, 3366.319, 8.031), QAngle(0.0, 319.093, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1276.518, 2836.324, 93.459), QAngle(0.0, 128.340, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1512.740, 2860.660, 94.031), QAngle(0.0, 153.020, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(1511.875, 2814.432, 92.878), QAngle(0.0, 148.683, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(890.620, 2943.843, 92.086), QAngle(0.0, 45.944, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2408.862, 3331.483, -31.969), QAngle(0.0, 217.068, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(2439.145, 3641.514, -31.969), QAngle(0.0, 240.486, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(2237.908, 3386.431, 8.031), QAngle(0.0, 251.446, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(3509.008, 3132.449, -31.969), QAngle(0.0, 189.077, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(3508.289, 3176.802, -31.969), QAngle(0.0, 194.911, 0.0));
SpawnCommon("common_male_fallen_survivor", Vector(3310.475, 3205.088, 1.260), QAngle(0.0, 212.416, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(3306.757, 3390.376, 0.031), QAngle(0.0, 236.385, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(3019.536, 3045.263, 57.491), QAngle(0.0, 15.947, 0.0));
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
