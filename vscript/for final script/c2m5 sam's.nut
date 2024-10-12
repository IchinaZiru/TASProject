// Squirrel
// I'm the comment line ( // ), don't touch me, and the other comments too! (if you don't know Squirrel syntax, yup)

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(111.500); // put here (instead of '0.0') the time you got from the previous segment(s); use this format: 129.133 !!

//map 5 time 2:59,267

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Easy"

	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 0

	god = 0
	z_common_limit = 0
	sv_infinite_ammo = 0
	host_timescale = 0.25

	sb_stop = 0
	nb_blind = 0
	nb_stop = 0
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-1059.175, 2110.287, -255.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.0000, 138.555, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
			clip = 4
			ammo = 71
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 1
		}
	}

	Actions = function(hPlayer)
	{
		Convars.SetValue("st_mr_force_file", "c2m5coach");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	health = 50

	origin = Vector(-834.106, 2285.377, -255.969)
	angles = QAngle(0.000, -93.175, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "pumpshotgun"
			clip = 50
			ammo = 100
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}
	Actions = function(hPlayer)
	{
		Convars.SetValue("st_mr_force_file", "c2m5ellis");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	health = 77

	origin = Vector(-1103.601, 2088.355, -255.969)
	angles = QAngle(-1.201, -171.901, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "grenade_launcher"
			clip = 1
			ammo = 23
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 7
		}
	}
	Actions = function(hPlayer)
	{
		Convars.SetValue("st_mr_force_file", "c2m5nick");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	health = 50

	origin = Vector(-1072.598, 2056.641, -255.969)
	angles = QAngle(0.00000, -146.742, 0.000)

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_chrome"
			clip = 6
			ammo = 64
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			clip = 15
		}
	}
	Actions = function(hPlayer)
	{
		Convars.SetValue("st_mr_force_file", "c2m5rochelle");
		Convars.SetValue("st_mr_play", hPlayer.GetEntityIndex());
	}
}


SpawnItem("sniper_military", Vector(-841.000, 2193.000, -222.000), QAngle(0.000, 93.999, 90.000), 5, 5.0);
SpawnItem("rifle_ak47", Vector(-853.000, 2192.000, -222.000), QAngle(0.000, 221.001, 90.000), 5, 5.0);
SpawnItem("rifle", Vector(-890.000, 2166.000, -222.000), QAngle(0.000, 18.501, 90.000), 5, 5.0);

SpawnTrigger("zombiehehe", Vector(-3608.486, 3012.104, -255.969));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - the name of a trigger
		// activator - a player who activated a trigger
		local sName = caller.GetName();
		if (sName == "zombiehehe")
		{
		SpawnCommon("common_female_tankTop_jeans", Vector(-3873.022, 2762.630, 88.546), QAngle(0.0, 143.263, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3818.815, 2934.139, 61.442), QAngle(0.0, 261.983, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3614.055, 3033.635, -29.567), QAngle(0.0, 345.292, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3710.738, 3163.421, 17.813), QAngle(0.0, 126.528, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3680.243, 3160.561, 2.603), QAngle(0.0, 278.286, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3659.757, 2734.114, -15.418), QAngle(0.0, 81.952, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3627.143, 2531.406, 53.440), QAngle(0.0, 200.660, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3633.229, 2698.211, 1.909), QAngle(0.0, 40.954, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3596.814, 3301.662, -49.558), QAngle(0.0, 278.271, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3815.795, 3231.352, 70.157), QAngle(0.0, 170.453, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3723.546, 3318.584, 24.033), QAngle(0.0, 270.098, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3751.226, 2862.233, 27.648), QAngle(0.0, 280.051, 0.0));
		SpawnCommon("common_male_tshirt_cargos", Vector(-3065.869, 2309.316, 17.377), QAngle(0.0, 245.880, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3276.089, 2294.059, 25.005), QAngle(0.0, 272.290, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3377.456, 2463.896, -19.445), QAngle(0.0, 264.594, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3631.085, 2278.125, 127.022), QAngle(0.0, 5.439, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3617.156, 2276.691, 133.156), QAngle(0.0, 317.499, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3613.934, 2322.352, 116.862), QAngle(0.0, 33.167, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3605.146, 2288.819, 125.110), QAngle(0.0, 115.438, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3605.790, 2331.051, 111.248), QAngle(0.0, 148.810, 0.0));
		SpawnCommon("common_male_tankTop_jeans", Vector(-3910.786, 2704.707, 107.428), QAngle(0.0, 274.379, 0.0));
		SpawnCommon("common_female_tankTop_jeans", Vector(-3500.534, 2767.204, -79.522), QAngle(0.0, 72.741, 0.0));
			caller.Kill();
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
	cvar("host_timescale", 0.25); OpenSafeRoomDoor(); CreateTimer(3.000, function(){ Items(); });
	CustomZombieSpawns();
	CustomSpawn.Settings.Enabled = true;

	SpawnCommon("common_female_tankTop_jeans", Vector(-1200.000, 2275.000, -245.970), QAngle(0.0, 290.060, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1634.442, 2223.903, -245.971), QAngle(0.0, 257.606, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1887.500, 2100.000, -245.971), QAngle(0.0, 153.280, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2012.500, 2062.500, -245.969), QAngle(0.0, 314.851, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(-2112.500, 2087.500, -239.719), QAngle(0.0, 71.129, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2137.500, 1987.500, -245.970), QAngle(0.0, 159.930, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-2362.500, 2137.500, -245.969), QAngle(0.0, 248.742, 0.0));
	SpawnCommon("common_male_polo_jeans", Vector(-2600.058, 2158.919, -245.970), QAngle(0.0, 71.099, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-1650.000, 2429.888, -245.970), QAngle(0.0, 198.774, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1563.823, 2425.000, -245.969), QAngle(0.0, 274.997, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-2080.787, 2389.197, -245.971), QAngle(0.0, 303.236, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1739.526, 1895.203, -245.971), QAngle(0.0, 99.412, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-1361.298, 2014.165, -211.719), QAngle(0.0, 290.693, 0.0));

}

function OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function OnFinaleStart() // do some stuff when a finale event has been started
{
	SendToServerConsole("director_start"); SendToServerConsole("host_timescale 0.5");
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
		CreateTimer(2.000, function(){ SayMsg("MOLOTOVS/GASCAN READY!"); });
	}
	else if (iType == TANK)
	{
		CreateTimer(0.000, function(){ SayMsg("SHOOT!"); });
	}
	else if (iType == DELAY)
	{
		CreateTimer(0.000, function(){ SayMsg("GET READY!"); });
	}
}

function CustomZombieSpawns()
{
    //Custom Zombie Spawns
	// SHOW POINTS
	//script foreach (point in CustomSpawn.CalculatePointsWithinCircle(Vector(-550.000, 2212.852, 330.031, 40.0, RandomInt(8, 8)) ) Mark(point);
    local aPanicOne = [];

	//Spot 1
    aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-809.544, 1965.813, 182.031), 40.0, RandomInt(6, 6)) );
	aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-862.500, 1862.500, 182.031), 1.0, RandomInt(1, 1)) );
	aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-725.000, 1936.422, 182.031), 1.0, RandomInt(1, 1)) );
	aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-787.500, 2037.500, 182.031), 1.0, RandomInt(1, 1)) );
    aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-812.500, 2050.000, 182.031), 1.0, RandomInt(1, 1)) );
	//Spot 2
	aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-1462.500, 1937.500, 72.371), 1.0, RandomInt(1, 1)) );
	//Spot 3
	aPanicOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-3236.234, 1933.614, 114.031), 20.0, RandomInt(6, 6)) );
	

    local aPanicTwo = [];
    //Spot 4
    aPanicTwo.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-3703.709, 3605.584, -245.969), 150.0, RandomInt(8, 8)) );
    //Spot 5
    aPanicTwo.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-550.000, 2410.729, 138.031), 10.0, RandomInt(7, 8)) );
	aPanicTwo.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-471.023, 2447.496, 138.031), 35.0, RandomInt(7, 7)) );
	aPanicTwo.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-454.935, 2396.722, 138.031), 1.0, RandomInt(1, 1)) );

	//Tank # 1
	AddScriptedTankSpawn( Vector(-4325.000, 2791.740, 172.031) );

    local aPanicThree = [];
    //Spot 6 
    aPanicThree.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-4142.431, 3226.166, 138.031), 125.0, RandomInt(8, 8)) );
    //Spot 7
    aPanicThree.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-4200.000, 2674.798, 182.031), 40.0, RandomInt(8, 8)) );

    local aRelaxOne = [];
    //Spot 8
    aRelaxOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-3870.771, 2050.534, 266.031), 40.0, RandomInt(8, 8)) );
    //Spot 9
    aRelaxOne.extend( CustomSpawn.CalculatePointsWithinCircle(Vector(-550.000, 2212.852, 330.031), 30.0, RandomInt(8, 8)) );

    CustomSpawn.aPanicSpawnPoints.push( aPanicOne );
    CustomSpawn.aPanicSpawnPoints.push( aPanicTwo );
    CustomSpawn.aPanicSpawnPoints.push( aPanicThree );

    CustomSpawn.aRelaxSpawnPoints.push( aRelaxOne );

    //Tank # 2
    AddScriptedTankSpawn( Vector(-662.676, 2012.677, 180.708) );
	//Tank # 3 just in case
	AddScriptedTankSpawn( Vector(-3837.500, 2212.500, 256.031) );
	//Tank # 4 just in case again
	AddScriptedTankSpawn( Vector(-3639.571, 3862.553, 64.031) );
}

function Items()
{
	SayMsg("Items Spawned!"); RemoveItemByName("pain_pills"); RemoveItemByName("molotov"); RemoveItemByName("pipe_bomb"); RemoveItemByName("adrenaline"); RemoveItemByName("defibrilator"); 
	RemoveItemByName("ammo"); RemoveItemByName("gascan"); RemoveItemByName("fireworkcrate"); RemoveItemByName("defibrillator");
//SPAWN
RemoveItemWithin(Vector(-2337.625, 2427.563, -63.719), 500.0);
RemoveItemWithin(Vector(-2280.938, 3256.000, -176.000), 100.0);

//molotov 9 -entrance
SpawnItem("molotov", Vector(-2964.000, 2991.156, -182.750), QAngle(0.000, 58.975, 0.000), 1);
SpawnItem("molotov", Vector(-2951.938, 2989.688, -182.750), QAngle(0.000, 268.989, 0.000), 1);
SpawnItem("molotov", Vector(-2943.969, 2986.531, -182.750), QAngle(0.000, 214.980, 0.000), 1);

//Stairs
SpawnItem("molotov", Vector(-2566.000, 2726.406, -186.750), QAngle(0.000, 246.006, 0.000), 1);
SpawnItem("molotov", Vector(-2574.813, 2733.531, -186.750), QAngle(0.000, 201.973, 0.000), 1);
SpawnItem("molotov", Vector(-2586.438, 2728.531, -186.750), QAngle(0.000, 42.012, 0.000), 1);
SpawnItem("molotov", Vector(-2578.188, 2726.375, -186.750), QAngle(0.000, 95.977, 0.000), 1);

//right wing

SpawnItem("molotov", Vector(-2805.375, 2514.219, 196.250), QAngle(0.000, 305.991, 0.000), 1);
SpawnItem("adrenaline", Vector(-2738.313, 2344.281, 80.500), QAngle(0.000, 338.027, 0.000), 1);
SpawnItem("adrenaline", Vector(-2734.344, 2342.219, 80.500), QAngle(0.000, 319.482, 0.000), 1);
SpawnItem("adrenaline", Vector(-2732.750, 2339.125, 80.500), QAngle(0.000, 301.025, 0.000), 1);
SpawnItem("adrenaline", Vector(-2731.813, 2336.094, 80.500), QAngle(0.000, 283.491, 0.000), 1);
//SpawnItem("defibrillator", Vector(-2667.813, 2358.750, 80.460), QAngle(0.000, 0.000, 0.000), 1);

//left wing
SpawnItem("molotov", Vector(-1852.844, 2519.500, 305.250), QAngle(0.000, 305.991, 0.000), 1);
SpawnItem("defibrillator", Vector(-1812.156, 2326.313, 80.460), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("pain_pills", Vector(-1940.406, 2334.188, 80.188), QAngle(0.000, 203.027, 0.000), 1);
SpawnItem("pain_pills", Vector(-1953.000, 2331.656, 80.188), QAngle(0.000, 166.992, 0.000), 1);

//pipe 

SpawnItem("pipe_bomb", Vector(-1868.000, 2825.656, -223.938), QAngle(90.000, 255.498, 0.000), 1);
SpawnItem("pipe_bomb", Vector(-1884.000, 2825.656, -223.938), QAngle(90.000, 329.985, 0.000), 1);
SpawnItem("pipe_bomb", Vector(-1884.000, 2818.656, -220.938), QAngle(0.000, 90.000, 0.000), 1);

//guns

SpawnItem("rifle", Vector(-2311.250, 2412.563, -62.719), QAngle(0.000, 34.980, 90.000), 5);
SpawnItem("ammo", Vector(-2337.625, 2427.563, -63.719), QAngle(0.000, 0.000, 0.000), 1);
SpawnItem("autoshotgun", Vector(-2362.250, 2447.563, -62.719), QAngle(0.000, 19.512, 90.000), 5);
SpawnItem("pistol", Vector(-2395.750, 2417.188, -63.219), QAngle(0.000, 120.015, 90.000), 5);

//gascans

SpawnItem("gascan", Vector(-2395.750, 2468.875, -245.063), QAngle(1.450, 90.220, 359.692), -1);
SpawnItem("gascan", Vector(-2428.500, 2488.375, -245.188), QAngle(0.571, 0.000, 359.912), -1);
SpawnItem("gascan", Vector(-2416.000, 2520.000, -252.531), QAngle(89.912, 7.075, 64.072), -1);
SpawnItem("gascan", Vector(-2393.031, 2537.563, -252.500), QAngle(270.000, 231.943, 180.000), -1);

SpawnItem("gascan", Vector(-1357.094, 3115.563, -252.531), QAngle(270.088, 52.603, 342.466), -1);
SpawnItem("gascan", Vector(-1318.656, 3086.875, -239.063), QAngle(0.615, 359.912, 0.000), -1);
SpawnItem("gascan", Vector(-1333.313, 3074.688, -248.094), QAngle(351.870, 40.342, 281.470), -1);

//fireworks

SpawnItem("fireworkcrate", Vector(-2197.690, 2598.000, -239.048), QAngle(0.000, 83.000, 0.000), -1);
SpawnItem("fireworkcrate", Vector(-2197.690, 2587.000, -245.048), QAngle(0.000, 97.500, 0.000), -1);
SpawnItem("fireworkcrate", Vector(-2198.690, 2611.000, -245.048), QAngle(0.000, 260.500, 0.000), -1);
SpawnItem("fireworkcrate", Vector(-2197.690, 2587.000, -251.048), QAngle(0.000, 81.500, 0.000), -1);
SpawnItem("fireworkcrate", Vector(-2198.690, 2611.000, -251.048), QAngle(0.000, 279.500, 0.000), -1);
}