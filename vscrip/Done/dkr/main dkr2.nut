// Squirrel

//SkipIntro(); // skip the intro of a custom campaign

SetPreviousSegmentTime(0.0); // put here (instead of '0.0') the time you got from the previous segment(s); for example: 129.133

SetClientName(Ent("!coach"), "ICHINA");
SetClientName(Ent("!rochelle"), "Azure");
SetClientName(Ent("!ellis"), "Juxar");
SetClientName(Ent("!nick"), "おかゆさん");

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
    
	st_fastreload = 1
	st_edgebug = 1
	
};

Survivors <- {}; // characters customization

Survivors["coach"] <- // make sure that the character name is in lowercase
{
	origin = Vector(9013.024, 451.921, -121.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(13.562, -140.101, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		cvar("st_mr_force_file", "dkr2coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
	}
}

Survivors["ellis"] <- // just copypaste the Coach's table params to extend settings of these survivors; btw, format of table:  key = value
{
	origin = Vector(9151.666, 542.709, -121.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(0.315, -146.056, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 100
	buffer = 0.0 // temporary health
	revives = null // count of revives (2 - black&white)
	idle = false // doesn't work without Speedrunner Tools (SourceMod) except the host player

	Inventory =
	{
		active_slot = "slot2"
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
		slot2 = "molotov" // throwable
		slot3 = "defibrillator" // medkit/defib
		slot4 = "pain_pills" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "dkr2ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
	}
}

Survivors["nick"] <-
{
	origin = Vector(9107.679, 528.169, -121.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.989, -139.792, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
	velocity = null // make a value 'null' if you don't want to apply anything or just remove a specified parameter

	health = 69
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
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "dkr2nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
		SendToServerConsole("callvote changedifficulty Easy");
               SendToServerConsole("sm_voteall");
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(9120.128, 564.050, -121.969) // position; format (for velocity too):  Vector( 0, 0, 0 )
	angles = QAngle(8.515, -137.667, 0.000) // camera angles; format:  QAngle( 0, 0, 0 )
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
		slot2 = "vomitjar" // throwable
		slot3 = "first_aid_kit" // medkit/defib
		slot4 = "adrenaline" // pills/adrenaline
		//slot5 = "gascan" // physics objects
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "dkr2rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
		
	}
}
RemoveItemByName("pistol");RemoveItemByName("pain_pills");

SpawnItem("grenade_launcher", Vector(3811.000, -1740.000, 42.389), QAngle(0.000, 255.015, 0.000), 1, 3.0);
SpawnItem("grenade_launcher", Vector(2578.750, -158.500, 39.313), QAngle(0.000, 104.985, 270.000), 1, 3.0); //小屋の中
SpawnItem("vomitjar", Vector(2755.000, 974.000, 71.009), QAngle(0.000, 0.000, 0.000), 1, 3.0);// 小屋の中
SpawnItem("vomitjar", Vector(2693.625, 1093.000, 39.853), QAngle(0.000, 0.000, 0.000), 1, 3.0);//小屋の中
SpawnItem("vomitjar", Vector(7468.000, 648.000, 69.228), QAngle(0.000, 0.000, 0.000), 1, 3.0);//リスポ近く

SpawnItem("molotov", Vector(3723.656, -1851.969, 5.167), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(3723.906, -2102.938, 5.167), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(4027.156, -1754.125, 5.167), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("pain_pills", Vector(4115.719, -2179.188, 0.280), QAngle(0.000, 0.000, 0.000), 1, 3.0);
SpawnItem("molotov", Vector(3561.000, -758.000, 32.933), QAngle(0.000, 0.000, 0.000), 1, 3.0);

SpawnTrigger("ci", Vector(5178.675, -781.426, 20.856));
SpawnTrigger("vote", Vector(6581.930, -556.919, 64.031));
SpawnTrigger("vote2", Vector(6350.308, -598.072, 101.489));
SpawnTrigger("test", Vector(4051.939, -1581.568, 5.281));
SpawnTrigger("cb", Vector(6821.314, -306.050, 71.031));
SpawnTrigger("zdump", Vector(806.588, 3231.245, 767.031));

function OnTriggerTouch()
{
	if (!activator) return;
	if (activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "ci" && activator == Ent("!nick"))
		{
//SpawnCommon("common_female_tankTop_jeans", Vector(3796.168, -1604.142, 5.281), QAngle(0.000, 198.547, 0.000));
		}
		else if (sName == "test" && activator == Ent("!coach"))
		{
			//cvar("host_timescale", 0.25);
		}
		else if (sName == "cb" && activator == Ent("!ellis"))
		{
			SpawnCommonForCB(Vector(6075.809, -612.618, 1.330), QAngle(0.000, 358.153, 0.000));
			//SpawnCommonForCB(Vector(5678.254, -571.371, 2.961), QAngle(0.000, 358.153, 0.000));
			
		}
		else if (sName == "zdump" && activator == Ent("!coach"))
		{
			SpawnCommon("common_male_tshirt_cargos", Vector(-2436.461, 4158.482, -126.088), QAngle(0.0, 316.883, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-2720.166, 4109.262, -119.969), QAngle(0.0, 302.296, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2669.366, 3900.236, -119.969), QAngle(0.0, 7.346, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(-2147.761, 4387.698, -127.969), QAngle(0.0, 250.829, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2076.384, 3821.815, -123.796), QAngle(0.0, 156.605, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2286.128, 3595.617, -127.650), QAngle(0.0, 94.079, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(-2220.066, 3870.014, -118.093), QAngle(0.0, 149.509, 0.0));
SpawnCommon("common_male_tshirt_cargos", Vector(-2475.749, 5000.903, -127.969), QAngle(0.0, 279.924, 0.0));
SpawnCommon("common_male_dressShirt_jeans", Vector(-2389.800, 4980.736, -127.969), QAngle(0.0, 274.641, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-2495.625, 4783.194, -127.969), QAngle(0.0, 284.576, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(-1862.710, 5574.093, -63.969), QAngle(340.162, 350.256, 0.000));
SpawnCommon("common_male_dressShirt_jeans", Vector(-1427.965, 5644.586, -63.969), QAngle(347.544, 200.681, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(-1480.975, 5553.633, -63.969), QAngle(343.559, 182.389, 0.000));
		}
		else if (sName == "vote2" && activator == Ent("!ellis"))
		{
			SendToServerConsole("callvote changedifficulty Impossible");
               SendToServerConsole("sm_voteall");
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
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 17.633);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 24.566);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 18.000);
 	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 24.633);
	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 24.378);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 24.267);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 24.766);
	 
	SpawnZombie("witch", Vector(3618.735, -2183.021, 12.000), QAngle(0.000, 202.593, 0.000));
	SpawnCommon("common_male_tankTop_jeans", Vector(9077.245, 117.637, -125.969), QAngle(0.0, 157.494, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(8989.328, 35.648, -125.969), QAngle(0.0, 137.940, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(9152.983, 228.117, -125.969), QAngle(0.0, 354.594, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(8283.999, 334.105, -117.869), QAngle(0.0, 327.411, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(8368.070, -53.744, -123.933), QAngle(0.0, 88.363, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(8251.989, 70.646, -119.969), QAngle(0.0, 44.366, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7756.031, 248.796, -47.969), QAngle(0.0, 341.208, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(7852.031, 210.669, -95.969), QAngle(0.0, 342.391, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(7891.685, -213.640, -47.969), QAngle(0.0, 57.139, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7797.122, -158.777, -31.969), QAngle(0.0, 44.996, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7965.621, -161.124, -87.969), QAngle(0.0, 67.074, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(8012.417, -34.652, -119.969), QAngle(0.0, 65.181, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(7577.826, 466.411, 0.031), QAngle(0.0, 325.754, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(7740.979, 467.447, 0.031), QAngle(0.0, 316.450, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7584.452, -29.942, 0.031), QAngle(0.0, 18.030, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7547.196, -236.670, 0.031), QAngle(0.0, 34.352, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7945.618, 435.574, -71.969), QAngle(0.0, 299.655, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(7990.064, 420.913, -87.969), QAngle(0.0, 289.405, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7851.921, 374.982, -55.969), QAngle(0.0, 144.739, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(7738.098, 182.375, -39.969), QAngle(0.0, 127.865, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(6640.246, -214.619, 64.031), QAngle(352.251, 346.333, 0.000));
	SpawnCommon("common_male_tankTop_jeans", Vector(6754.195, -227.042, 72.281), QAngle(312.831, 144.266, 0.000));
	SpawnCommon("common_female_tankTop_jeans", Vector(6892.866, -142.887, 71.031), QAngle(347.287, 304.702, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(9087.218, 324.263, -125.969), QAngle(359.980, 278.211, 0.000));
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
