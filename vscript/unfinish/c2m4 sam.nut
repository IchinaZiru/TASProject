// Squirrel
// I'm the comment line ( // ), don't touch me, and the other comments too! (if you don't know Squirrel syntax, yup)

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(95.833); // put here (instead of '0.0') the time you got from the previous segment(s); use this format: 129.133 !!

SetClientName(Ent("!nick"), "19?");
SetClientName(Ent("!ellis"), "DXSamXD");
SetClientName(Ent("!coach"), "Carlos?");
SetClientName(Ent("!rochelle"), "Antho?");

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
	st_fastreload = 1
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(2932.659, 3264.109, -187.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.000, 96.152, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 50
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
			ammo = 72
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}

	Actions = function(hPlayer)
	{
		cvar("st_mr_force_file", "c2m4coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	health = 50
	origin = Vector(3011.869, 3312.560, -187.969)
	angles = QAngle(0.000, 105.414, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 8
			ammo = 72
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}
	Actions = function(hPlayer)
	{
		cvar("st_mr_force_file", "c2m4ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	health = 77
	origin = Vector(2914.689, 3517.109, -187.969)
	angles = QAngle(0.000, -89.451, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 0
			ammo = 25
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}
	Actions = function(hPlayer)
	{
		cvar("st_mr_force_file", "c2m4nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 50

	origin = Vector(3206.034, 3337.634, -187.968)

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
			clip = 15
		}
	}
	Actions = function(hPlayer)
	{
		cvar("st_mr_force_file", "c2m4rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

SpawnItem("shotgun_spas", Vector(2913.000, 3870.000, -187.000), QAngle(0.000, 284.985, 90.000), 5, 3.0);
SpawnItem("hunting_rifle", Vector(2957.000, 3858.000, -187.000), QAngle(0.000, 149.985, 90.000), 5, 3.0);
SpawnItem("rifle", Vector(2967.000, 3915.000, -187.000), QAngle(0.000, 210.015, 90.000), 5, 3.0);

SpawnTrigger("witch", Vector(919.753, 1359.964, -147.969));

SpawnTrigger("rochelletake", Vector(-1189.607, 1992.933, -276.685), Vector(512, 512, 512));
SpawnTrigger("coachtake", Vector(-1189.607, 1992.933, -276.685), Vector(512, 512, 512));


SpawnItem("sniper_military", Vector(-841.000, 2193.000, -222.000), QAngle(0.000, 93.999, 90.000), 5, 5.0);
SpawnItem("rifle_ak47", Vector(-853.000, 2192.000, -222.000), QAngle(0.000, 221.001, 90.000), 5, 5.0);
SpawnItem("rifle", Vector(-890.000, 2166.000, -222.000), QAngle(0.000, 18.501, 90.000), 5, 5.0);

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - the name of a trigger
		// activator - a player who activated a trigger
		local sName = caller.GetName();
		if (sName == "witch")
		{
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"callvote changedifficulty Impossible\");", 0.00);
			EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_voteall\");", 0.033);
			SpawnZombie("witch", Vector(550.000, 1977.500, -181.969), QAngle(0.000, 312.177, 0.000));
			caller.Kill();
		}
		else if (sName == "rochelletake" && activator == Ent("!rochelle"))
		{
			EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 0.033);
			caller.Kill();
		}
		else if (sName == "coachtake" && activator == Ent("!coach"))
		{
			EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 0.033);
			caller.Kill();
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
	cvar("host_timescale", 1.00); OpenSafeRoomDoor();

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 3.167);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 9.300);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 9.333);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 3.367);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 9.067);

	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 9.500);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 9.500);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 9.500);
		
	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 13.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"sm_idle\");", 9.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 9.633);

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"callvote changedifficulty Easy\");", 13.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_voteall\");", 13.033);

	SpawnCommon("common_male_tankTop_jeans", Vector(3057.365, 2731.795, -191.969), QAngle(0.0, 262.503, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2000.000, 3195.995, -191.969), QAngle(0.0, 199.769, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2000.000, 3218.344, -191.969), QAngle(0.0, 346.250, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2494.146, 3920.896, -191.969), QAngle(0.0, 123.610, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(2070.130, 2991.295, -191.969), QAngle(0.0, 247.945, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2024.293, 3299.833, -191.969), QAngle(0.0, 354.555, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2237.500, 2675.000, -191.969), QAngle(0.0, 60.003, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2887.500, 2487.500, -183.033), QAngle(0.0, 150.369, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2887.500, 2487.500, -183.033), QAngle(0.0, 27.862, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2177.944, 2594.060, -184.033), QAngle(0.0, 161.874, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(3137.154, 2545.768, -191.969), QAngle(0.0, 211.627, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(1987.500, 2980.000, -149.719), QAngle(0.0, 182.227, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2953.151, 2515.015, -191.969), QAngle(0.0, 355.782, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2375.000, 2537.500, -172.679), QAngle(0.0, 108.947, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2387.666, 2500.004, -175.139), QAngle(0.0, 140.864, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2512.898, 2285.352, -191.969), QAngle(0.0, 225.159, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1987.590, 2887.800, -191.969), QAngle(0.0, 181.124, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(1988.926, 2878.510, -191.969), QAngle(0.0, 110.003, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2116.156, 2698.453, -191.969), QAngle(0.0, 123.683, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2107.084, 2667.811, -191.969), QAngle(0.0, 57.545, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2020.000, 2912.500, -149.719), QAngle(0.0, 169.951, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(3137.500, 2487.500, -183.033), QAngle(0.0, 42.468, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2924.996, 2437.497, -64.303), QAngle(0.0, 44.042, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(2562.549, 2287.189, -191.969), QAngle(0.0, 98.300, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2037.500, 2587.500, -184.033), QAngle(0.0, 277.759, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(2023.399, 2656.637, -191.969), QAngle(0.0, 136.677, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2212.486, 2512.579, -67.338), QAngle(0.0, 124.348, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(2099.912, 2512.197, -66.167), QAngle(0.0, 73.236, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(3354.756, 2481.581, -191.969), QAngle(0.0, 16.460, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2562.500, 2012.500, -191.969), QAngle(0.0, 43.340, 0.0));
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
 