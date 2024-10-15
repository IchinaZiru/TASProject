// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "instagib");
SetClientName(Ent("!rochelle"), "Kurokotei");
SetClientName(Ent("!ellis"), "ICHINA");
SetClientName(Ent("!nick"), "エミリアは俺の嫁");

Cvars <- // console variables manager; format:  cvar_name = value(string or number)
{
	mp_gamemode = "Coop"
	z_difficulty = "Impossible"

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
	st_edgebug = 0

	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-784.629, -638.802, 9816.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(20.500, -142.037, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
		SendToServerConsole("callvote changedifficulty Easy");
                SendToServerConsole("sm_voteall");
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(-886.983, -638.610, 9816.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(17.504, -54.609, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(-870.392, -397.314, 9816.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(17.189, 83.828, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = null // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = null // camera angles; format:  QAngle( 0, 0, 0 )
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
			ammo = 28
			
		}
		slot1 = // secondary weapon
		{
			weapon = "pistol"
			dual = false
			clip = 15
		}
		slot2 = "" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}

//SpawnTrigger("spawn", Vector(-904.138, -779.460, 9816.031));

SpawnItem("smg_silenced", Vector(-879.000, -597.000, 9845.000), QAngle(2.241, 274.175, 93.999), 2, 3.0);
SpawnItem("shotgun_chrome", Vector(-896.000, -605.000, 9845.000), QAngle(2.241, 84.683, 93.999), 2, 3.0);
SpawnItem("first_aid_kit", Vector(-893.886, -547.000, 9819.089), QAngle(83.825, 140.955, -140.029), -1, 3.0);
SpawnItem("first_aid_kit", Vector(-883.106, -575.949, 9819.100), QAngle(83.956, -62.452, -138.748), -1, 3.0);
SpawnItem("first_aid_kit", Vector(-872.109, -601.960, 9819.099), QAngle(83.923, -61.651, -138.120), -1, 3.0);
SpawnItem("first_aid_kit", Vector(-868.019, -621.115, 9819.100), QAngle(83.947, 38.357, -137.610), -1, 3.0);
SpawnItem("machete", Vector(-763.000, -578.000, 9829.000), QAngle(356.045, 73.828, 9.009), 2, 3.0);
SpawnItem("fireaxe", Vector(-769.000, -603.000, 9829.000), QAngle(356.045, 73.828, 9.009), 2, 3.0);
SpawnItem("vomitjar", Vector(-1860.000, -802.000, 10185.000), QAngle(0.000, 0.000, 0.000), 2, 3.0);
SpawnItem("molotov", Vector(-1864.000, -796.000, 10185.000), QAngle(0.000, 0.000, 0.000), 2, 3.0);
SpawnItem("pipe_bomb", Vector(-1867.000, -788.000, 10185.000), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(-1871.000, -785.000, 10185.000), QAngle(0.000, 0.000, 0.000), 2, 3.0);
SpawnItem("first_aid_kit", Vector(-1833.000, -849.000, 10183.000), QAngle(88.989, 149.985, 180.000), 1, 3.0);
SpawnItem("first_aid_kit", Vector(-1837.000, -827.000, 10183.000), QAngle(88.989, 149.985, 180.000), 1, 3.0);
SpawnItem("first_aid_kit", Vector(-1801.000, -846.000, 10183.000), QAngle(88.989, 185.010, 180.000), 1, 3.0);
SpawnItem("first_aid_kit", Vector(-1815.000, -830.000, 10183.000), QAngle(88.989, 119.004, 180.000), 1, 3.0);
SpawnItem("adrenaline", Vector(-1844.000, -545.000, 10180.000), QAngle(0.000, 297.510, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-1844.000, -554.000, 10180.000), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(-1845.000, -558.000, 10180.000), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("rifle_desert", Vector(-1816.000, -545.000, 10181.000), QAngle(0.000, 28.477, 87.495), 5, 3.0);
SpawnItem("shotgun_spas", Vector(-1814.000, -573.000, 10181.000), QAngle(0.000, 307.485, 87.495), 5, 3.0);
SpawnItem("rifle", Vector(-1781.000, -577.000, 10181.000), QAngle(0.000, 103.491, 87.495), 5, 3.0);
SpawnItem("rifle_ak47", Vector(-1780.000, -611.000, 10181.000), QAngle(0.000, 28.477, 87.495), 5, 3.0);
SpawnItem("ammo", Vector(-1871.000, -822.000, 10215.000), QAngle(0.000, 0.000, 0.000), 1, 3.0);


SpawnItem("molotov", Vector(-1766.000, -623.000, 9821.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "spawn"  && activator == Ent("!coach"))
		{
			SpawnZombie("tank", Vector(-1316.093, -268.010, 10110.031));
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
	cvar("host_timescale", 0.5);OpenSafeRoomDoor();
	CustomZombieSpawns();
	CustomSpawn.Settings.Enabled = true;

	SpawnCommon("common_female_tshirt_skirt", Vector(-1242.585, -815.738, 9816.031), QAngle(-0.000, 32.000, 0.000));
	SpawnCommon("common_male_tankTop_jeans", Vector(-1204.985, -653.657, 9816.031), QAngle(-0.000, 313.965, 0.000));
}

function OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{
	
}

function OnFinaleStart() // do some stuff when a finale event has been started
{
SendToServerConsole("director_start"); SendToServerConsole("host_timescale 0.7");
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
function CustomZombieSpawns()
{
    /*
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
	AddScriptedTankSpawn( Vector(-1516.430, -1147.934, 10110.031) );

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
    AddScriptedTankSpawn( Vector(-1516.430, -1147.934, 10110.031) );
	//Tank # 3 
	AddScriptedTankSpawn( Vector(-1516.430, -1147.934, 10110.031) );
	//Tank # 4 just in case
	AddScriptedTankSpawn( Vector(-1078.997, -1647.293, 8877.428));
	*/
}
