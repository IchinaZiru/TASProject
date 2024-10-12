// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!rochelle"), "");
//SetClientName(Ent("!ellis"), "");
//SetClientName(Ent("!nick"), "");

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
    
	st_fastreload = 1
	st_edgebug = 0
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(-2327.031, -11049.438, 70.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(-1.104, -89.478, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 42
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot0"
		slot0 = // primary weapon
		{
			weapon = "shotgun_spas"
			clip = 10
			ammo = 90
			
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
		cvar("st_mr_force_file", "coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(-2221.198, -11011.128, 70.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(14.193, 107.551, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		SendToServerConsole("callvote changedifficulty Impossible");
 				SendToServerConsole("sm_voteall");
	}
}

Survivors["nick"] <-
{
	origin = Vector(-2449.464, -11083.717, 70.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(9.146, 31.238, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(-2305.073, -11024.394, 70.031) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(3.627, 57.877, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 80
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
		slot3 = "" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
	}
}
RemoveItemByName("pistol");

SpawnItem("grenade_launcher", Vector(-2854.000, -7028.000, 123.451), QAngle(0.000, 59.985, 0.000), 1, 3.0);
SpawnItem("grenade_launcher", Vector(-2391.000, -7144.000, 123.201), QAngle(0.000, 59.985, 0.000), 1, 3.0);

SpawnItem("autoshotgun", Vector(-2222.000, -11092.000, 106.031), QAngle(360.000, 329.985, 90.527), 3, 3.0);

SpawnItem("molotov", Vector(-3304.000, -6965.000, 98.324), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(-3304.000, -7053.000, 145.093), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pipe_bomb", Vector(-3304.000, -7053.000, 149.745), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnItem("gascan_scavenge", Vector(-3929.031, -7028.156, 99.813), QAngle(0.703, 90.000, 359.780), -1, 3.0);
SpawnItem("gascan_scavenge", Vector(-2314.094, 2077.031, -301.125), QAngle(0.439, 165.015, 359.868), -1, 3.0);

SpawnItem("vomitjar", Vector(-3301.625, -7377.469, 129.603), QAngle(0.000, 0.000, 0.000), 1, 3.0); // tukue
SpawnItem("vomitjar", Vector(-3251.688, -9289.469, 79.228), QAngle(0.000, 0.000, 0.000), 1, 3.0); //risupo
SpawnItem("vomitjar", Vector(-3331.000, -2933.000, -226.397), QAngle(0.000, 0.000, 0.000), 1, 3.0); //kouen
SpawnItem("vomitjar", Vector(-3503.875, -4694.719, 83.915), QAngle(0.000, 0.000, 0.000), 1, 3.0);//kouen
SpawnItem("vomitjar", Vector(-2743.250, -5436.313, 95.821), QAngle(0.000, 0.000, 0.000), 1, 3.0);//kouen

SpawnItem("molotov", Vector(-2416.000, -6655.000, 94.167), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(-4067.813, -601.281, -291.067), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(-3457.844, -240.281, -251.067), QAngle(0.000, 0.000, 0.000), 1, 3.0);

//SpawnTrigger("cb", Vector(-2688.421, -7164.794, 89.031));
//SpawnTrigger("cbcoach", Vector(-3411.902, -5633.587, 79.948));
//SpawnTrigger("tank", Vector(-2487.944, -6658.986, 89.031));
SpawnTrigger("coachcb1", Vector(-2618.173, -6396.535, 89.031));
SpawnTrigger("coachcb2", Vector(-3707.666, -5644.085, 112.400));

//SpawnTrigger("time", Vector(-2587.147, -6339.558, 104.436));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "cb1" && activator == Ent("!coach"))
		{
//SpawnCommonForCB(Vector(-3401.727, -5696.907, 79.172), QAngle(0.000, 309.700, 0.000));
//SpawnCommonForCB(Vector(-3896.424, -5203.388, 77.810), QAngle(0.000, 275.984, 0.000));
SpawnCommonForCB(Vector(-2560.750, -6194.060, 89.031), QAngle(0.000, 307.249, 0.000));
//SpawnCommonForCB(Vector(-3968.587, -5092.945, 74.438), QAngle(0.000, 325.339, 0.000));
		}
		else if (sName == "tank")
		{
			
			SpawnZombie("tank", Vector(-3768.847, -4682.694, 29.448));
			SendToServerConsole("z_allow_ai_to_use_abilities 0");
		}
		else if (sName == "cb" && activator == Ent("!coach"))
		{
			SpawnCommonForCB(Vector(-2539.870, -6200.961, 89.031), QAngle(0.000, 291.144, 0.000));
			
		}
		else if (sName == "skip" && activator == Ent("!coach"))
		{
			SpawnCommon("common_male_dressShirt_jeans", Vector(-4075.638, -2215.589, -296.751), QAngle(0.0, 305.556, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-3993.226, -2103.916, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-3950.399, -2080.535, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-4042.159, -2089.427, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-4024.494, -2121.237, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-3994.797, -2160.953, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-3943.290, -2147.007, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-3943.010, -1997.948, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-3909.292, -2017.635, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-3935.793, -2037.396, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-3890.978, -2053.017, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-3900.630, -2085.525, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-3914.841, -2132.794, -295.969), QAngle(0.0, 299.327, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-4668.350, -5341.282, 118.962), QAngle(0.0, 112.251, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-4791.720, -5361.082, 124.944), QAngle(0.0, 27.136, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-4679.924, -5354.680, 120.192), QAngle(0.0, 87.566, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4732.722, -5272.061, 117.789), QAngle(0.0, 187.470, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-4732.054, -5249.161, 116.514), QAngle(0.0, 53.760, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-4738.538, -5330.704, 121.215), QAngle(0.0, 9.851, 0.0));
SpawnCommon("common_male_polo_jeans", Vector(-4674.706, -5374.436, 121.119), QAngle(0.0, 24.462, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4632.486, -5366.956, 119.047), QAngle(0.0, 241.071, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4625.505, -5229.877, 110.562), QAngle(0.0, 193.682, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-4757.877, -5376.830, 124.452), QAngle(0.0, 179.695, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4635.452, -5280.560, 114.031), QAngle(0.0, 358.771, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4692.369, -5303.146, 117.775), QAngle(0.0, 25.186, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4728.807, -5306.303, 119.486), QAngle(0.0, 262.147, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4786.720, -5229.946, 117.984), QAngle(0.0, 281.615, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-4462.500, -6562.500, 99.031), QAngle(0.0, 96.728, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-5100.000, -1400.000, -286.969), QAngle(0.0, 312.665, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-4613.165, -2025.000, -253.969), QAngle(0.0, 2.496, 0.0));
		}
		else if (sName == "cbcoach")
		{
			//SpawnCommonForCB( Vector(-3757.756, -4349.558, -5.083), QAngle(0.000, 278.098, 0.000));
			//SpawnCommonForCB(  Vector(-3951.429, -2876.313, -281.470), QAngle(0.000, 267.023, 0.000));

			//SpawnCommonForCB( Vector(-3779.354, -4055.833, -55.177),QAngle(0.000, 274.829, 0.000));
			//SpawnCommonForCB(Vector(-3779.447, -4040.608, -58.908), QAngle(340.903, 272.043, 0.000));
			//SpawnCommonForCB(Vector(-3915.652, -2513.695, -302.831), QAngle(0.000, 93.100, 0.000));

			SpawnCommonForCB(Vector(-3776.419, -3850.352, -104.514), QAngle(0.000, 270.258, 0.000));
			SpawnCommonForCB(Vector(-3967.048, -2277.804, -296.287), QAngle(0.000, 284.698, 0.000));
			 
		 //Vector(-3985.401, -2275.518, -296.416), QAngle(0.000, 275.334, 0.000)); osii
		}
		else if (sName == "coachcb1")
		{
			//SpawnCommonForCB( Vector(-3739.761, -5403.519, 74.917), QAngle(0.000, 278.551, 0.000)); ///1
			SpawnCommonForCB(Vector(-3739.369, -5422.793, 75.112), QAngle(0.000, 278.551, 0.000)); //1
			//SpawnCommonForCB(Vector(-3847.913, -4807.998, 39.513), QAngle(0.000, 264.829, 0.000)); //2
			SpawnCommonForCB(Vector(-3884.503, -4900.216, 46.081), QAngle(0.000, 287.050, 0.000));	 //2	
			}
		else if (sName == "coachcb2")
		{
			//SpawnCommonForCB(Vector(-4084.436, -3547.516, -142.152), QAngle(0.000, 292.954, 0.000));//3 seikou ban
			//SpawnCommonForCB(Vector(-4074.020, -3576.921, -133.450), QAngle(347.223, 286.093, 0.000));//3 
			
			SpawnCommonForCB( Vector(-4066.995, -1977.926, -184.205), QAngle(0.000, 313.004, 0.000));//4 seikou humituk

			//SpawnCommonForCB(Vector(-4078.404, -1973.078, -184.719), QAngle(336.681, 285.697, 0.000)); //4

			//SpawnCommonForCB(Vector(-4030.465, -1972.978, -184.205), QAngle(0.000, 270.008, 0.000)); //4
		}
		else if (sName == "time")
		{
			cvar("host_timescale", 0.25);
		}
		else if (sName == "trigger_area2")
		{
			
		}else if (sName == "trigger_area2")
		{
			
		}
		
	}
}

function __OnGameplayStart() // do some stuff when round has started
{
	
}

function OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);OpenSafeRoomDoor();SendToServerConsole("z_must_wander 1");
 	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"callvote changedifficulty Easy\");", 12.500);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_voteall\");", 12.550);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 29.167);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 0.033);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 25.267);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 0.033);

 EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 25.367);
 //EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 0.033);
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
