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
	st_edgebug = 0
	st_fastreload = 0
};

/*
SetClientName(Ent("!nick"), "");
SetClientName(Ent("!rochelle"), "");
SetClientName(Ent("!coach"), "");
SetClientName(Ent("!ellis"), "");
*/

Survivors <- {}; // characters customization

Survivors["coach"] <-
{
	origin = null
	angles = null
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
		//ST_MR(hPlayer, 0, "campaign/m1_coach"); // 0 - record | 3 - Split From Trigger | put [true] for playbacking.
	}
}

Survivors["ellis"] <-
{
	origin = null
	angles = null
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
		//ST_MR(hPlayer, 0, "campaign/m1_ellis");
	}
}

Survivors["nick"] <-
{
	origin = null
	angles = null
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
		//ST_MR(hPlayer, 0, "campaign/m1_nick");
	}
}

Survivors["rochelle"] <-
{
	origin = null
	angles = null
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
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "trigger_area1")
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
	DisableAutoClimb();
	CreateTimer(4.0, function()
	{
		z1();
		sayf("Loaded...");
	});

	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 15.000);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 23.100);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 15.000);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 23.100);

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

RemoveItemByName("gascan"); RemoveItemByName("propanetank");RemoveItemByName("oxygentank");

SpawnItem("vomitjar", Vector(472.000, 1480.000, 469.228), QAngle(0.000, 270.000, 0.000), 1,3.0);
//沼の奥
SpawnItem("vomitjar", Vector(1264.000, 4500.000, 421.196), QAngle(0.000, 0.000, 0.000), 1,3.0);

//SpawnItem("defibrillator", Vector(582.000, 3067.000, 491.460), QAngle(0.000, 180.000, 0.000), 1,3.0);
SpawnItem("vomitjar", Vector(582.000, 3067.000, 496.228), QAngle(0.000, 180.000, 0.000), 1,3.0);
SpawnItem("vomitjar", Vector(712.000, 6063.000, 421.196), QAngle(0.000, 0.000, 0.000), 1,3.0);

SpawnItem("defibrillator", Vector(791.000, 7324.000, 418.554), QAngle(0.000, 0.000, 0.000), 1,3.0);
//沼手前
//SpawnItem("defibrillator", Vector(791.000, 7324.000, 418.554), QAngle(0.000, 0.000, 0.000), 1,3.0);

SpawnItem("shotgun_chrome", Vector(373.250, 615.250, 418.969), QAngle(358.462, 13.931, 259.497), 3,3.0);
SpawnItem("fireaxe", Vector(353.000, 577.000, 418.000), QAngle(0.000, 325.986, 275.493), 1,3.0);
SpawnItem("smg_silenced", Vector(441.000, 616.938, 418.531), QAngle(0.000, 301.816, 266.221), 5,3.0);

SpawnItem("pipe_bomb", Vector(606.000, 3067.000, 495.933), QAngle(0.000, 180.000, 0.000), 1,3.0);

//DefDebug(Vector(-1702.358765, -13667.229492, 130.281250), Vector(-1705.010010, -13663.115234, 130.031250), Vector(3692.599, -1646.229, 232.531));

//===============Custom Functions================//
function z1()
{
	SpawnCommonForCB(Vector(900.363, 1706.514, 415.989), QAngle(0, RandomInt(260.842, 260.842), 0), 0.1);
	//SpawnCommon("common_male_tankTop_overalls_swamp", Vector(998.280, 1540.332, 438.738), QAngle(0.000, 285.905, 0.000));
//SpawnCommon("common_male_tankTop_overalls_swamp", Vector(1185.998, 1573.896, 421.960), QAngle(0.0, 260.842, 0.0));
SpawnCommon("common_male_mud", Vector(1169.685, 2023.829, 333.474), QAngle(0.0, 265.057, 0.0));
SpawnCommon("common_male_tshirt_cargos_swamp", Vector(1337.555, 2066.892, 355.242), QAngle(0.0, 246.990, 0.0));
SpawnCommon("common_female_tshirt_skirt_swamp", Vector(1342.317, 1970.643, 342.571), QAngle(0.0, 251.431, 0.0));
SpawnCommon("common_female_tshirt_skirt_swamp", Vector(1480.065, 1774.560, 389.294), QAngle(0.0, 233.883, 0.0));
SpawnCommon("common_male_tankTop_overalls_swamp", Vector(1475.951, 2283.492, 414.032), QAngle(0.0, 255.355, 0.0));
SpawnCommon("common_male_tankTop_overalls_swamp", Vector(1499.831, 2138.406, 393.782), QAngle(0.0, 245.720, 0.0));
SpawnCommon("common_female_tshirt_skirt_swamp", Vector(1469.281, 2064.506, 382.990), QAngle(0.0, 241.947, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(1364.270, 1457.994, 420.406), QAngle(0.0, 213.517, 0.0));
SpawnCommon("common_male_tshirt_cargos_swamp", Vector(430.795, 2065.719, 413.286), QAngle(0.0, 307.344, 0.0));
SpawnCommon("common_male_tshirt_cargos_swamp", Vector(587.185, 1882.001, 416.031), QAngle(0.0, 317.564, 0.0));
}
//11.500 11.967
