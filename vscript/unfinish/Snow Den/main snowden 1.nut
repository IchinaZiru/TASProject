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

EntFire("info_changelevel", "Unable");

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


SetClientName(Ent("!nick"), "萌新野生菌");
SetClientName(Ent("!rochelle"), "rudd1y");
SetClientName(Ent("!coach"), "サムライサム");
SetClientName(Ent("!ellis"), "ICHINA");


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
		//cvar("st_mr_force_file", "coach");
		//cvar("st_mr_play", Ent("!coach").GetEntityIndex());
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
		//cvar("st_mr_force_file", "ellis");
		//cvar("st_mr_play", Ent("!ellis").GetEntityIndex());
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
		//cvar("st_mr_force_file", "nick");
		//cvar("st_mr_play", Ent("!nick").GetEntityIndex());
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
		//cvar("st_mr_force_file", "rochelle");
		//cvar("st_mr_play", Ent("!rochelle").GetEntityIndex());
		//ST_MR(hPlayer, 0, "campaign/m1_rochelle");
	}
}

SpawnTrigger("z2", Vector(2587.160, 2558.551, -7.969));
SpawnTrigger("cb", Vector(2611.339, 3396.593, -263.969));
SpawnTrigger("z4", Vector(2771.882, 4080.495, 174.674));
SpawnTrigger("z5", Vector(3463.124, 4651.250, 210.112));

function OnTriggerTouch()
{
	if (activator && activator.IsSurvivor() && !g_bRestarting)
	{
		// sName - name of a trigger
		// activator - player who activated a trigger
		local sName = caller.GetName();
		if (sName == "z2")
		{
			z2();
			caller.Kill();
		}
		else if (sName == "cb")
		{
			cb();
			caller.Kill();
		}
		else if (sName == "z4")
		{
			z4();
			caller.Kill();
		}
		else if (sName == "z5")
		{
			z5();
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
	//IncludeScript("pipe_jump.nut");
	cvar("host_timescale", 0.25);
	DisableAutoClimb();
	/*
	g_bTLS = true;
	IncludeScript("modules/tas_kit.nut");
	IncludeScript("modules/speedrunner_tools.nut");
	*/

	CreateTimer(1.100, function()
	{
		z1();
	});
	CreateTimer(4.100, function()
	{
		z3();
	});

	CreateTimer(37.100, function()
	{
		cvar("host_timescale", 0.25);
	});

	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"callvote changedifficulty Impossible\");", 52.000);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"vote yes\");", 52.100);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!coach\"), \"vote yes\");", 52.100);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"vote no\");", 52.100);

		//1st warp All NPSs -> coach
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!ellis\"), \"sm_idle\");", 29.400);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!ellis\")), true)", 35.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 29.400);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 35.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 29.400);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 35.533);

		//2nd warp rochelle -> ellis 1:08.333
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 51.000);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!rochelle\")), true)", 58.100);
	//EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!rochelle\"), \"sm_idle\");", 53.000);
	//EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!coach\")), true)", 35.533);
	EntFire("worldspawn", "RunScriptCode", "ClientCommand(Ent(\"!nick\"), \"sm_idle\");", 57.900);
	EntFire("worldspawn", "RunScriptCode", "ST_Idle(GetOwner(Ent(\"!nick\")), true)", 58.200);
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

function Items()
{
	/*
	local ent;
	while (ent = Entities.FindByClassname(ent, "weapon_melee_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_pain_pills_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_adrenaline_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_first_aid_kit_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_item_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_ammo_spawn")) ent.Kill();

	ent = null;
	while (ent = Entities.FindByClassname(ent, "weapon_upgradepack_spawn")) ent.Kill();
	*/


	//Weapon Spawns
	RemoveItemByName("molotov");RemoveItemByName("pipe_bomb");RemoveItemByName("gascan");
	//saferoom
	SpawnItem("frying_pan", Vector(210.281, -286.219, 39.219), QAngle(0.000, 68.511, 90.000), 1,3.0);
	SpawnItem("pistol", Vector(203.625, -49.063, 1.094), QAngle(0.088, 52.471, 90.835), 5,3.0);
	SpawnItem("shotgun_chrome", Vector(157.000, -11.000, 1.156), QAngle(0.132, 188.525, 88.857), 4,3.0);
	SpawnItem("smg", Vector(123.719, 7.844, 1.531), QAngle(358.682, 123.311, 83.716), 4,3.0);
	SpawnItem("smg", Vector(148.594, 11.719, 1.469), QAngle(357.891, 99.712, 85.254), 1,3.0);
	SpawnItem("pistol_magnum", Vector(137.469, 58.156, 0.938), QAngle(359.209, 16.392, 88.242), 1,3.0);
	SpawnItem("first_aid_kit", Vector(-52.000, 346.000, 0.000), QAngle(359.517, 281.514, 1.494), 1,3.0);
	SpawnItem("first_aid_kit", Vector(-42.000, 334.000, 3.000), QAngle(89.473, 336.489, 1.494), 1,3.0);
	SpawnItem("first_aid_kit", Vector(-21.000, 358.000, 0.000), QAngle(359.517, 0.000, 1.494), 1,3.0);
	SpawnItem("first_aid_kit", Vector(-5.000, 352.125, 3.000), QAngle(89.473, 37.485, 1.494), 1,3.0);
	SpawnItem("pumpshotgun", Vector(202.000, 240.000, 54.094), QAngle(360.000, 15.469, 89.341), 1,3.0);
	SpawnItem("electric_guitar", Vector(196.000, 180.000, 1.000), QAngle(0.000, 75.015, 90.000), 1,3.0);
	SpawnItem("ammo", Vector(215.000, 312.000, 53.000), QAngle(0.000, 262.002, 0.000), 1,3.0);

	SpawnItem("upgradepack_explosive", Vector(6941.000, 6327.000, -6.000), QAngle(0.000, 180.527, 0.000), 1,3.0);
	SpawnItem("adrenaline", Vector(691.031, 757.000, 34.781), QAngle(355.869, 0.132, 359.033), 1,3.0);
	SpawnItem("defibrillator", Vector(5885.250, 6650.281, -203.563), QAngle(359.561, 0.000, 1.143), 1,3.0);

	SpawnItem("vomitjar", Vector(6086.563, 4068.688, 5.375), QAngle(357.451, 0.176, 358.594), 1,3.0);
	SpawnItem("vomitjar", Vector(3590.906, 1707.938, -211.563), QAngle(359.165, 359.736, 359.517), 1,3.0);
	SpawnItem("vomitjar", Vector(4191.406, 3009.469, 37.406), QAngle(357.451, 359.824, 357.891), 1,3.0);
	SpawnItem("vomitjar", Vector(1894.188, 2945.500, 5.313), QAngle(358.418, 0.044, 358.813), 1,3.0);
	SpawnItem("vomitjar", Vector(6764.156, 6381.375, -40.938), QAngle(56.689, 149.678, 270.088), 1,3.0);
	SpawnItem("pipe_bomb", Vector(2435.000, 2388.281, -215.375), QAngle(51.724, 51.855, 89.121), 1,3.0);
	SpawnItem("pipe_bomb", Vector(-766.563, 788.719, 37.094), QAngle(0.000, 0.000, 359.912), 1,3.0);
	SpawnItem("pipe_bomb", Vector(5066.281, 2267.625, 5.031), QAngle(359.121, 0.000, 0.000), 1,3.0);
	SpawnItem("pipe_bomb", Vector(6889.188, 6368.875, -41.375), QAngle(318.428, 210.059, 90.000), 1,3.0);

	SpawnItem("pain_pills", Vector(4878.563, 2284.344, 0.500), QAngle(1.758, 359.780, 5.713), 1,3.0);
	SpawnItem("pain_pills", Vector(4898.250, 2268.031, 0.531), QAngle(355.518, 0.132, 358.989), 1,3.0);
	SpawnItem("pain_pills", Vector(6577.500, 6280.219, 172.625), QAngle(1.362, 359.736, 4.438), 1,3.0);
	SpawnItem("adrenaline", Vector(4192.031, 3055.000, 32.500), QAngle(354.946, 0.132, 359.033), 1,3.0);
	SpawnItem("adrenaline", Vector(4077.031, 2206.000, 13.500), QAngle(353.232, 0.132, 359.077), 1,3.0);
	SpawnItem("pain_pills", Vector(6089.031, 3985.875, 0.500), QAngle(0.527, 359.692, 1.670), 1,3.0);
	SpawnItem("pain_pills", Vector(2033.750, 2954.156, 0.531), QAngle(357.100, 0.132, 358.945), 1,3.0);

	SpawnItem("pipe_bomb", Vector(4520.844, 9019.250, -271.813), QAngle(0.000, 0.000, 358.901), 1,3.0);
	SpawnItem("adrenaline", Vector(4526.500, 9000.219, -301.750), QAngle(0.703, 359.692, 2.241), 1,3.0);
	//SpawnItem("pain_pills", Vector(4526.500, 9000.219, -301.750), QAngle(0.703, 359.692, 2.241), 1,3.0);
	SpawnItem("propanetank", Vector(4664.813, 8658.000, -301.000), QAngle(1.406, 270.088, 1.143), -1,3.0);

	SpawnItem("propanetank", Vector(4193.031, 2828.875, 43.156), QAngle(0.396, 359.824, 0.527), -1,3.0);
}//nick 1,2 ellis 1,2 rochelle 1,0 coach

CreateTimer(0.1, function()
{
	Items();
	sayf("Loaded...");
});

//===============Custom Functions================//
function z1()
{
SpawnCommonForCB(Vector(1045.258, 799.652, -7.969), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2);
SpawnCommon("common_female_tankTop_jeans", Vector(262.500, 1062.500, 38.474), QAngle(0.0, 345.398, 0.0));
//SpawnCommon("common_female_tankTop_jeans", Vector(1587.500, 412.500, 182.154), QAngle(0.0, 113.172, 0.0));
//SpawnCommon("common_female_tshirt_skirt", Vector(1537.500, 825.000, 10.031), QAngle(0.0, 140.438, 0.0));
SpawnCommon("common_male_roadcrew", Vector(1487.500, 1662.500, 2.031), QAngle(0.0, 39.707, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1412.500, 1712.500, 45.151), QAngle(0.0, 156.517, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1300.000, 1850.000, 2.031), QAngle(0.0, 219.112, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1512.500, 1887.500, 6.031), QAngle(0.0, 91.268, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1512.500, 2037.500, 6.031), QAngle(0.0, 348.631, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1512.500, 2112.500, 6.031), QAngle(0.0, 31.700, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1337.500, 1175.000, 2.031), QAngle(0.0, 179.485, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1712.500, 237.500, 84.693), QAngle(0.0, 270.280, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1762.500, 225.000, 95.278), QAngle(0.0, 215.830, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1462.500, 2400.000, 33.695), QAngle(0.0, 357.218, 0.0));
SpawnCommon("common_male_roadcrew", Vector(1462.500, 2400.000, 33.695), QAngle(0.0, 225.482, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1425.000, 2456.784, 20.442), QAngle(0.0, 309.341, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1352.326, 2475.000, 11.494), QAngle(0.0, 122.947, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1287.500, 2575.000, 2.031), QAngle(0.0, 348.036, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1312.500, 2587.500, 2.031), QAngle(0.0, 292.435, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1350.000, 2637.500, 2.031), QAngle(0.0, 253.403, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1087.500, 337.500, 56.097), QAngle(0.0, 236.715, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1900.000, 2762.500, 6.031), QAngle(0.0, 228.514, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(2025.000, 2705.502, 2.031), QAngle(0.0, 103.157, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1950.000, 2787.500, 10.031), QAngle(0.0, 61.338, 0.0));
SpawnCommon("common_male_roadcrew", Vector(2100.000, 2650.000, 43.524), QAngle(0.0, 99.771, 0.0));
SpawnCommon("common_male_roadcrew", Vector(2187.500, 2600.000, 2.031), QAngle(0.0, 89.537, 0.0));
SpawnCommon("common_female_tshirt_skirt", Vector(2044.280, 87.420, 116.707), QAngle(0.0, 291.729, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1662.500, -87.500, 106.551), QAngle(0.0, 229.441, 0.0));
}

function z2()
{
	SpawnCommon("common_male_tshirt_cargos", Vector(2500.618, 2471.120, -263.969), QAngle(0.000, 44.154, 0.000));
	SpawnCommon("common_female_tshirt_skirt", Vector(2614.189, 2835.844, -263.969), QAngle(-0.000, 265.587, 0.000));
}

function z3()
{
SpawnCommon("common_female_tankTop_jeans", Vector(1450.615, 2658.315, -7.969), QAngle(0.0, 251.228, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1400.086, 2660.288, -7.969), QAngle(0.0, 255.564, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1306.052, 2549.786, -7.969), QAngle(0.0, 262.652, 0.0));
SpawnCommon("common_male_roadcrew", Vector(1623.064, 2704.958, -7.969), QAngle(0.0, 224.390, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1380.565, 1979.514, 79.787), QAngle(0.0, 190.096, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1482.529, 2016.765, -7.969), QAngle(0.0, 238.818, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1478.495, 1962.247, -7.969), QAngle(0.0, 234.414, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1504.648, 1948.319, -7.969), QAngle(0.0, 232.900, 0.0));
SpawnCommon("common_male_tankTop_jeans", Vector(1414.828, 1615.906, 57.842), QAngle(0.0, 145.916, 0.0));
SpawnCommon("common_female_tankTop_jeans", Vector(1329.722, 1743.706, 42.500), QAngle(0.0, 228.358, 0.0));
}

function z4()
{
	SpawnCommon("common_female_tshirt_skirt", Vector(3409.133, 4493.155, 176.687), QAngle(0.0, 157.306, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(3307.236, 4484.401, 164.608), QAngle(0.0, 153.246, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(3344.064, 4520.365, 168.644), QAngle(0.0, 157.306, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(3269.998, 4501.483, 167.878), QAngle(0.0, 153.109, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(4593.031, 4201.567, 161.432), QAngle(0.0, 149.255, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(4571.706, 4240.572, 157.353), QAngle(0.0, 150.493, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-80.274, 1300.000, 84.083), QAngle(0.0, 165.059, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(675.000, -162.500, 51.507), QAngle(0.0, 30.534, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(-97.506, 1300.000, 81.210), QAngle(0.0, 251.261, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(675.000, -162.500, 51.507), QAngle(0.0, 95.496, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-90.567, 1300.000, 82.367), QAngle(0.0, 142.819, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(675.000, -162.500, 51.507), QAngle(0.0, 107.374, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-98.397, 1300.000, 81.062), QAngle(0.0, 337.547, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(675.000, -162.500, 51.507), QAngle(0.0, 75.335, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(4662.692, 4431.544, 213.270), QAngle(0.0, 162.055, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-88.098, 1300.000, 82.778), QAngle(0.0, 35.250, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(675.000, -162.500, 51.507), QAngle(0.0, 247.586, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(-79.969, 1300.000, 84.133), QAngle(0.0, 210.718, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(675.000, -162.500, 51.507), QAngle(0.0, 14.136, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-78.494, 1300.000, 84.379), QAngle(0.0, 286.568, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(675.000, -162.500, 51.507), QAngle(0.0, 136.983, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-86.230, 1300.000, 83.090), QAngle(0.0, 112.630, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(675.000, -162.500, 51.507), QAngle(0.0, 177.502, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(-76.080, 1300.000, 84.782), QAngle(0.0, 53.643, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(625.000, -162.500, 50.222), QAngle(0.0, 187.778, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(-81.932, 1300.000, 83.806), QAngle(0.0, 74.125, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(625.000, -162.500, 50.222), QAngle(0.0, 330.906, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4185.454, 4693.027, 401.063), QAngle(0.0, 173.478, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4108.408, 4716.422, 391.892), QAngle(0.0, 175.474, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(3793.140, 4359.835, 375.328), QAngle(0.0, 108.447, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(3790.264, 4664.865, 273.198), QAngle(0.0, 149.599, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(4205.828, 4554.230, 256.526), QAngle(0.0, 162.123, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(4134.647, 3618.617, 26.117), QAngle(0.0, 88.972, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4144.692, 3675.739, 47.778), QAngle(0.0, 89.523, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(4584.995, 3754.886, 101.318), QAngle(0.0, 118.081, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4541.346, 3243.042, 12.286), QAngle(0.0, 105.832, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(4545.840, 4202.667, 144.865), QAngle(0.0, 133.702, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(4505.476, 4551.108, 274.553), QAngle(0.0, 169.074, 0.0));
	SpawnCommon("common_male_dressShirt_jeans", Vector(3693.155, 4752.467, 307.235), QAngle(0.0, 342.307, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(3754.931, 4721.547, 307.291), QAngle(0.0, 343.890, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(4371.303, 3736.787, 43.890), QAngle(0.000, 267.241, 0.000));
}
function z5()
{
	SpawnCommon("common_male_tshirt_cargos", Vector(4326.137, 3655.660, 17.993), QAngle(0.000, 103.581, 0.000));
	SpawnCommon("common_female_tshirt_skirt", Vector(4560.513, 3217.590, 12.002), QAngle(0.0, 114.454, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4491.583, 3429.873, 28.515), QAngle(0.0, 117.895, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(4129.939, 3195.248, 13.101), QAngle(0.0, 79.441, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(4492.688, 3314.542, 13.572), QAngle(0.0, 112.045, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4630.964, 3432.862, 111.986), QAngle(0.0, 132.759, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(4609.541, 3613.258, 128.938), QAngle(0.0, 152.096, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(4629.011, 3623.246, 196.970), QAngle(0.0, 152.991, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(4581.574, 3706.022, 103.163), QAngle(0.0, 164.552, 0.0));
}
function cb()
{
	SpawnCommonForCB(Vector(2523.423, 3568.419, 22.446), QAngle(0, RandomInt(220.395, 220.395), 0), 0.2);

	SpawnCommon("common_female_tankTop_jeans", Vector(1442.541, 2277.841, 1.800), QAngle(0.0, 10.468, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(340.876, 1200.317, 56.941), QAngle(0.0, 17.049, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(1452.492, 2404.583, 25.219), QAngle(0.0, 88.709, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(1853.870, 2545.229, -7.969), QAngle(0.0, 340.183, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2036.284, 2727.303, -7.969), QAngle(0.0, 325.462, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2466.342, 2547.230, -7.969), QAngle(0.0, 302.519, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2542.509, 2418.667, -7.969), QAngle(0.0, 193.338, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2562.587, 2462.292, -7.969), QAngle(0.0, 344.301, 0.0));
	SpawnCommon("common_male_tankTop_jeans", Vector(2074.410, 2632.533, 28.993), QAngle(0.0, 34.342, 0.0));
	SpawnCommon("common_female_tankTop_jeans", Vector(2284.377, 2729.160, -7.969), QAngle(0.0, 221.614, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2710.300, 3209.440, -2.627), QAngle(0.0, 135.869, 0.0));
	SpawnCommon("common_male_tshirt_cargos", Vector(2399.915, 3784.795, 54.807), QAngle(0.0, 279.625, 0.0));
	SpawnCommon("common_female_tshirt_skirt", Vector(2422.915, 3753.673, 44.203), QAngle(0.0, 277.767, 0.0));
}