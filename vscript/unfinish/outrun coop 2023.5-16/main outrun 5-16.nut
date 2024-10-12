//Squirrel

//Default Script By Dude: https://steamcommunity.com/id/retardman819/
//Edited By DarkNe$$: https://steamcommunity.com/id/nerogaming69/
//Created By Sw1ft: https://steamcommunity.com/id/alkashproduction

SkipIntro();

SetPreviousSegmentTime(0.0); // put previous map segment time. Ex: 24.833

//========================================================================================================================
//Delete Custom Campaigns's Intros
//========================================================================================================================

/*EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);
EntFire("", "Kill", 0.1);*/

//========================================================================================================================

EntFire("info_changelevel", "Disable");

Cvars <-
{
	// Game
	mp_gamemode = "Coop"
	z_difficulty = "Easy"
	host_timescale = 1.0
	god = 0
	sv_infinite_ammo = 0
	sv_client_min_interp_ratio = 0

	// AI
	director_no_bosses = 1
	director_no_mobs = 1
	director_no_specials = 1
	z_common_limit = 0

	nb_blind = 0
	nb_stop = 0
	sb_stop = 0

	// ST
	st_autocb = 1
	st_edgebug = 1
	st_fastreload = 0
};

//SetClientName(Ent("!nick"), "");
//SetClientName(Ent("!rochelle"), "");
//SetClientName(Ent("!coach"), "");
//SetClientName(Ent("!ellis"), "");

Survivors <- {}; // characters customization

Survivors["coach"] <-
{
	origin = Vector(2096.900, 1625.770, 1152.031)
	angles = QAngle(0.000, -0.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "coach");
		cvar("st_mr_play", Ent("!coach").GetEntityIndex());
		//ST_MR(hPlayer, true, "coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["ellis"] <-
{
	origin = Vector(2046.410, 1684.210, 1152.031)
	angles = QAngle(0.000, -0.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "ellis");
		cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
		//ST_MR(hPlayer, true, "ellis");
	}
}

Survivors["nick"] <-
{
	origin = Vector(2098.400, 1682.760, 1152.031)
	angles = QAngle(0.000, -0.505, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "nick");
		cvar("st_mr_play", Ent("!nick").GetEntityIndex());
		//ST_MR(hPlayer, true, "nick");
	}
}

Survivors["rochelle"] <-
{
	origin = Vector(2046.920, 1628.200, 1152.031)
	angles = QAngle(0.000, -0.500, 0.000)
	velocity = null

	health = 100
	buffer = 0.0
	revives = null
	idle = false

	Inventory =
	{
		active_slot = "slot1"

		slot0 = // primary weapon
		{
			weapon = ""
			clip = 0
			ammo = 0
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
	}

	Actions = function(hPlayer)
	{
		//SendToServerConsole("st_mr_record 1");
		cvar("st_mr_force_file", "rochelle");
		cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
		//ST_MR(hPlayer, true, "rochelle");
	}
}


SpawnTrigger("trigger_area1", Vector(2701.918, 1303.245, 1184.906));
//SpawnTrigger("trigger_area2", Vector(2755.365, 1392.305, 1203.167));
//SpawnTrigger("trigger_area", Vector(883.786, 2753.280, 928.915));


function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1" && activator == Ent("!nick"))
		{
			z1();
			caller.Kill();
		}
		else if (sName == "trigger_area2" && activator == Ent("!rochelle"))
		{
		//SpawnCommon("common_male_dressShirt_jeans", Vector(1905.668, 2797.251, 896.031), QAngle(346.064, 347.881, 0.000));
		//SpawnCommon("common_male_tshirt_cargos", Vector(1863.742, 2798.964, 896.031), QAngle(347.766, 348.638, 0.000));
		SpawnCommon("common_male_tshirt_cargos", Vector(2304.433, 2718.391, 896.031), QAngle(2.048, 18.298, 0.000));
		SpawnCommon("common_male_tshirt_cargos", Vector(2265.402, 2719.282, 896.031), QAngle(0.669, 15.889, 0.000));
			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
		else if (sName == "trigger_area2")
		{

			caller.Kill();
		}
	}
}

function Callbacks::OnGameplayStart() // do some stuff when the round has started
{

	g_ModeScript.DirectorOptions.cm_AggressiveSpecials <- 0; // Disable Force Attack on Spawn

	foreach (idx, val in g_bAutoShove) g_bAutoShove[idx] = false; // auto gascan shove

}

function Callbacks::OnSpeedrunStart() // do some stuff when the countdown is over
{
	cvar("host_timescale", 0.25);

	CreateTimer(11.000, function()
{
	cvar("host_timescale", 0.25);
});


	CreateTimer(5.933, function()
{
	Ent("!nick").SetHealth(40);
});
CreateTimer(5.933, function()
{
	Ent("!rochelle").SetHealth(40);
});
CreateTimer(5.933, function()
{
	Ent("!ellis").SetHealth(40);
});

/*
	DisableAutoClimb();
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");
*/

				//idle

						//ellis boosted
	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 13.683);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 13.766);
}

function Callbacks::OnSpeedrunRestart() // do some stuff when the speedrun is about to restart
{

}

function Callbacks::OnFinaleStart() // do some stuff when the finale has been started
{

}

function Callbacks::OnFinalePause() // called during pause stage of panic event in the finale
{

}

function Callbacks::OnLastTankKilled() // called after killing a specified amount of Tanks in the finale (FinaleManager.Settings.MaxTanksInFinale)
{

}

function Callbacks::OnRocketJumpCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBileBoostCompleted(hPlayer, hBooster, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnSpitterBoostCompleted(hPlayer, hSpitter, flGainedSpeed, flGainedSpeed2D)
{

}

function Callbacks::OnBeginCustomStage(iNum, iType)
{
	local ERROR = -1;
	local PANIC = 0;
	local TANK = 1;
	local DELAY = 2;
	local SCRIPTED = 3;

	local PAUSE = 0;

	if (iType == PANIC)
	{
	}
	else if (iType == TANK)
	{
	}
	else if (iType == DELAY)
	{
	}
	else if (iType == PAUSE)
	{
	}
}
//spawn items

SpawnItem("vomitjar", Vector(760.000, 2968.000, 901.228), QAngle(0.000, 0.000, 0.000), 1,3.0);
SpawnItem("vomitjar", Vector(760.000, 2988.531, 901.228), QAngle(0.000, 0.000, 0.000), 1,3.0);

//saferoom

SpawnItem("molotov", Vector(2078.000, 1572.063, 1201.000), QAngle(0.000, 270.000, 0.000), 1);
SpawnItem("pipe_bomb", Vector(2078.000, 1562.313, 1197.000), QAngle(80.508, 51.504, 90.000), 1);
SpawnItem("pumpshotgun", Vector(2071.000, 1517.688, 1197.000), QAngle(0.000, 90.000, 90.000), 5);
SpawnItem("pumpshotgun", Vector(2085.000, 1517.688, 1197.000), QAngle(0.000, 90.000, 90.000), 5);

function z1()
{


	SpawnCommon("common_male_tshirt_cargos", Vector(2492.873, 2813.708, 896.031), QAngle(0.000, 297.570, 0.000));
	SpawnCommon("common_male_tankTop_jeans",  Vector(2618.959, 2683.243, 1024.031), QAngle(0.000, 98.684, 0.000)); //rochelle
	SpawnCommon("common_male_tankTop_jeans", Vector(2412.694, 2810.403, 896.031), QAngle(0.000, 69.756, 0.000)); //nick
			//ramdom commons
SpawnCommon("common_male_dressShirt_jeans", Vector(2912.500, 2600.000, 1034.031), QAngle(0.000, 132.154, 0.000));
SpawnCommon("common_female_tankTop_jeans", Vector(2853.044, 2638.566, 1034.031), QAngle(0.000, 181.807, 0.000));
SpawnCommon("common_male_dressShirt_jeans", Vector(2728.140, 2616.228, 1034.031), QAngle(0.000, 239.813, 0.000));
//SpawnCommon("common_male_tshirt_cargos", Vector(1400.000, 3037.500, 906.031), QAngle(0.000, 201.765, 0.000));
//SpawnCommon("common_male_tankTop_jeans", Vector(1512.500, 2437.500, 906.031), QAngle(0.000, 49.249, 0.000));
//SpawnCommon("common_female_tshirt_skirt", Vector(1512.500, 2212.500, 906.031), QAngle(0.000, 173.292, 0.000));
SpawnCommon("common_male_dressShirt_jeans", Vector(1584.330, 2792.569, 896.031), QAngle(0.000, 362.055, 0.000));
SpawnCommon("common_female_tshirt_skirt", Vector(1261.089, 2712.209, 896.031), QAngle(0.000, 22.494, 0.000));
}